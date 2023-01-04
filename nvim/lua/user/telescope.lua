local keymap = vim.keymap.set
local telescope_ok, telescope = pcall(require, "telescope")

if not telescope_ok then
  vim.notify("Could not load Telescope")
  return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup {
  defaults = {
    hidden = true,
    prompt_prefix = " ",
    selection_caret = "契",
    path_display = { "smart" },
    file_ignore_patterns = {
      "^.git/",
      "node_modules",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-t>"] = trouble.open_with_trouble,
      }
    }
  },
  pickers = {
    find_files = {
      prompt_prefix = "🔍",
      hidden = true,
      command = "rg",
    }
  },
}

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local opts = {
  silent = true
}

local project_files = function(pf_opts)
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    builtin.git_files(pf_opts)
  else
    builtin.find_files(pf_opts)
  end
end

local quick_find_files = function()
  project_files(
    themes.get_dropdown({
      previewer = false,
      hidden = false
    })
  )
end

local incoming_lsp_calls = function()
  builtin.lsp_incoming_calls(themes.get_ivy())
end

local live_grep = function()
  -- builtin.live_grep(themes.get_ivy())
  builtin.live_grep()
end

local find_buffer = function()
  -- builtin.buffers(
  --   themes.get_dropdown({
  --     previewer = false
  --   })
  -- )

  builtin.buffers(
    themes.get_ivy()
  )
end

keymap("n", "<leader>ff", project_files, opts)
keymap("n", "<leader>p", quick_find_files, opts)
keymap("n", "gr", builtin.lsp_references, opts)
keymap("n", "<leader>gi", incoming_lsp_calls, opts)
keymap("n", "<leader>ft", live_grep, opts)
keymap("n", "<leader>fm", builtin.marks, opts)
keymap("n", "<leader>fr", builtin.registers, opts)
keymap("n", "<leader>b", find_buffer, opts)
keymap("n", "<leader>fs", builtin.treesitter)
keymap("n", "<leader>tr", builtin.resume)
