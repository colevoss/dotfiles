local keymap = vim.keymap.set
local telescope = require('telescope.builtin')
local telescope_themes = require('telescope.themes')
local opts = {
  silent = true
}

-- Remap space to leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Colon shortcut
keymap("n", ";", ":")

-- Save shortcut
keymap("n", "<leader>w", ":w<CR>")
--[[ keymap("n", "<leader>wa", ":wa<CR>") ]]

-- Reload vimrc
keymap("n", "<leader>sv", ":source $HOME/.config/nvim/init.lua")

-- Normal --
-- Better window navigation
--- Maybe turn this back on. I'm just kind of used to C-w
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- In buffer nav
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Buffer nav
--[[ keymap("n", "<S-h>", ":bprevious<CR>", opts) ]]
--[[ keymap("n", "<S-l>", ":bnext<CR>", opts) ]]

keymap("n", "<C-p>", ":bprevious<CR>", opts)
keymap("n", "<C-n>", ":bnext<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better full line yank
keymap("n", "<S-y>", "<S-v>y", opts)

-- Move to start or end of line
keymap("n", "<C-e>", "$", opts)
--[[ keymap("n", "<C-a>", "0", opts) ]]

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", telescope.find_files, opts)

keymap("n", "<leader>p",
  function()
    telescope.find_files(
      telescope_themes.get_dropdown({ previewer = false, hidden = false }))
  end,
  opts)

keymap("n", "gr", telescope.lsp_references, opts)
keymap("n", "<leader>gi", function()
  telescope.lsp_incoming_calls(telescope_themes.get_ivy())
end, opts)
keymap("n", "gd", telescope.lsp_definitions, opts)

keymap("n", "<leader>ft", function()
  telescope.live_grep(telescope_themes.get_ivy())
end, opts)

keymap("n", "<leader>fm", telescope.marks, opts)
keymap("n", "<leader>fr", telescope.registers)
keymap("n", "<leader>fd", telescope.diagnostics)
keymap("n", "<leader>b",
  function()
    telescope.buffers(telescope_themes.get_dropdown({ previewer = false }))
  end, opts)
keymap("n", "<leader>fs", telescope.lsp_document_symbols)
keymap("n", "<leader>tr", telescope.resume)
keymap("n", "<leader>jb", require('jabs').open, opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", opts)

-- Comment
--[[ keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts) ]]
--[[ keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>') ]]


-- Close buffer
keymap("n", "<leader>dd", ":Bdelete %<CR>", opts)
