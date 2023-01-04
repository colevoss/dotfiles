local mason_ok, mason = pcall(require, "mason")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_ok then
  vim.notify("Could not load Mason")
  return
end

if not mason_lspconfig_ok then
  vim.notify("Could not load Mason-lspconfig")
  return
end

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "gopls",
  }
}

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

if not lspconfig_ok then
  vim.notify("Could load LSP Config")
  return
end

lspconfig.sumneko_lua.setup {}
