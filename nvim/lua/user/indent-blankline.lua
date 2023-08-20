local M = {}

function M.setup()
  local status_ok, blankline = pcall(require, "indent_blankline")

  if not status_ok then
    vim.notify("Could not load blankline")
    return
  end

  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  blankline.setup {
    show_end_of_line = true,
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    -- char_highlight_list = {
    --   "IndentBlanklineIndent1",
    --   "IndentBlanklineIndent2",
    --   "IndentBlanklineIndent3",
    --   "IndentBlanklineIndent4",
    --   "IndentBlanklineIndent5",
    --   "IndentBlanklineIndent6",
    -- },
  }
end

return M
