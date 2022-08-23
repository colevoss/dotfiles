local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  vim.notify("Could not load telescope")
  return
end

local actions = require("telescope.actions")
local trouble = require("trouble")

telescope.setup()

telescope.setup {
  defaults = {
    hidden = true,
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      "^.git/",
      "node_modules",
    },
  },
  pickers = {
    find_files = {
      prompt_prefix = "🔍",
      hidden = true,
      command = "rg",
    }
  },
}
