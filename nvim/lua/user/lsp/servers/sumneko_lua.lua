local status_ok, config = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require("user.lsp.handlers")

config.sumneko_lua.setup {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = {

    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
