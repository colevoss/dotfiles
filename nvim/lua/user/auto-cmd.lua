local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

local formatGroup = api.nvim_create_augroup("FormatGroup", { clear = true })
api.nvim_create_autocmd("BufWritePre *", {
  command = "silent! lua vim.lsp.buf.formatting_sync()",
  group = formatGroup,
})
