local M = {}

function M.setup()
  require("user.lsp.config").setup()
  require("user.lsp.mason").setup()
  require("user.lsp.null-ls").setup()
end

return M
