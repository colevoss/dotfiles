local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.config")

require("user.lsp.servers.tsserver")
require("user.lsp.servers.sumneko_lua")
require("user.lsp.servers.gopls")