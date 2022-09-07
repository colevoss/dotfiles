local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

--[[ local handlers = require("user.lsp.handlers") ]]

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = true,
  log_level = "debug",

  sources = {
    --[[ formatting.prettier, ]]
    --[[ formatting.eslint_d, ]]
    diagnostics.eslint_d,
    formatting.prettierd,
    formatting.gofmt,
  },

  --[[ on_attach = handlers.on_attach, ]]
})
