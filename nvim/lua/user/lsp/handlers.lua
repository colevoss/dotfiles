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
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local function on_attach(client, bufnr)
  lsp_keymaps(bufnr)
  local status_ok, illumnate = pcall(require, 'illumnate')

  if status_ok then
    illumnate.on_attach(client)
  end
  navic.attach(client, bufnr)
end

M.on_attach = on_attach
M.lsp_flags = lsp_flags

--[[ M.on_attach = function(client, bufnr) ]]
--[[   if client.name == "tsserver" then ]]
--[[     client.resolved_capabilities.document_formatting = false ]]
--[[   end ]]
--[[   lsp_keymaps(bufnr) ]]
--[[   lsp_highlight_document(client) ]]
--[[ end ]]

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
