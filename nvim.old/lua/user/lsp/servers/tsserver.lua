local status_ok, config = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require("user.lsp.handlers")

config.tsserver.setup(handlers)
