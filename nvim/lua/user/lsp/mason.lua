local servers = require('user.lsp.servers.servers')
local M = {}

-- LSP Keymaps
function M.lsp_keymaps(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, {
      buffer = bufnr,
      desc = desc,
      silent = true
    })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ctions')

  -- IDEA: Load telescope functions with a fallback on vim.lsp functions
  -- nmap('gd', vim.lsp.buf.definition, '[G]o to [D]efinition')
  nmap('gI', vim.lsp.buf.implementation, '[G]o to [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('K', vim.lsp.buf.hover, 'Hover documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')

  -- Create a command `:Format` local to the lsp buffer
  vim.api.nvim_buf_create_user_command(
    bufnr,
    'Format',
    function(_)
      vim.lsp.buf.format()
    end,
    { desc = 'Format current buffer with LSP' }
  )

  -- Telescope LSP Keymaps
  local telescope_ok, telescope = pcall(require, 'telescope.builtin')

  if telescope_ok then
    nmap('gd', telescope.lsp_definitions, '[G]o to [D]efinitions')
    nmap('gr', telescope.lsp_references, '[G]o to [R]eferences')
    nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  else
    vim.notify('Could not load telescope builtin for LSP attach')
  end
end

-- Navic Support
function M.setup_navic(client, bufnr)
  -- Navic
  local navic_ok, navic = pcall(require, 'nvim-navic')
  if navic_ok then
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  else
    vim.notify('Could not load nvim-navic for lsp on attach')
  end
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      if client.name == 'tsserver' then
        return false
      end

      return true
      -- return client.name == 'null-ls'
    end,
    bufnr = bufnr
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function format_on_save(client, bufnr)
  if not client.supports_method("textDocument/formatting") then
    return
  end

  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      lsp_formatting(bufnr)
    end
  })
end

-- ON ATTACH
function M.on_attach(client, bufnr)
  M.lsp_keymaps(client, bufnr)
  M.setup_navic(client, bufnr)
  format_on_save(client, bufnr)
end

-- Setup
function M.setup()
  local mason_ok, mason = pcall(require, "mason")
  local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  local fidget_ok, fidget = pcall(require, "fidget")

  if not mason_ok then
    vim.notify("Could not load Mason")
    return
  end

  if not mason_lspconfig_ok then
    vim.notify("Could not load Mason-lspconfig")
    return
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

  if cmp_nvim_lsp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  else
    vim.notify('Could not load cmp_nvim_lsp')
  end

  require('neodev').setup()

  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers)
  }

  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

  if not lspconfig_ok then
    vim.notify("Could load LSP Config")
    return
  end

  mason_lspconfig.setup_handlers {
    function(server_name)
      lspconfig[server_name].setup {
        capabilities = capabilities,
        on_attach = M.on_attach,
        settings = servers[server_name],
      }
    end
  }

  if not fidget_ok then
    vim.notify("Could not load fidget")
    return
  end

  fidget.setup {
    window = {
      winblend = 0
    },
    text = {
      spinner = "dots",
    },
  }
end

return M
