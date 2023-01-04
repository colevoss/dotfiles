local keymap = vim.keymap.set
local opts = {
  silent = true
}

-- Remap Space to leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Colon Shortcut
keymap("n", ";", ":")

-- Save Shortcut
keymap("n", "<leader>w", ":w<CR>")

------------------------
-- Normal
------------------------

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- In buffer nav
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Previous and next buffers
keymap("n", "<C-p>", ":bprevious<CR>", opts)
keymap("n", "<C-n>", ":bnext<CR>", opts)

------------------------
-- Visual
------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better full line yank
keymap("n", "<S-y>", "<S-v>y", opts)

-- Move to start or end of line
keymap("n", "<C-e>", "$", opts)
