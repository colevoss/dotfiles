local navic = require("nvim-navic")
local M = {}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float, opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name ~= "tsserver"
    end,
    bufnr = bufnr,
  })
end


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function format_on_save(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end
    })
  end
end

local function attach_illuminate(client)
  local status_ok, illumnate = pcall(require, 'illumnate')

  if status_ok then
    illumnate.on_attach(client)
  end
end

local function on_attach(client, bufnr)
  navic.attach(client, bufnr)
  format_on_save(client, bufnr)
  attach_illuminate(client)
  lsp_keymaps(bufnr)
end

M.on_attach = on_attach
M.lsp_flags = lsp_flags

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
