local keymap = vim.keymap.set
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
keymap("n", "<leader>wa", ":wa<CR>")

-- Reload vimrc
keymap("n", "<leader>sv", ":source $HOME/.config/nvim/init.lua")

-- Normal --
-- Better window navigation
--- Maybe turn this back on. I'm just kind of used to C-w
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer nav
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better full line yank
keymap("n", "<S-y>", "<S-v>y", opts)

-- Move to start or end of line
keymap("n", "<C-e>", "$", opts)
keymap("n", "<C-a>", "0", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.git_files()<cr>", opts)
keymap("n", "<leader>p",
  "<cmd>lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", opts)
keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", opts)
keymap("n", "<leader>fm", "<cmd>lua require'telescope.builtin'.marks()<cr>")
keymap("n", "<leader>fr", "<cmd>lua require'telescope.builtin'.registers()<cr>")
keymap("n", "<leader>fd", "<cmd>lua require'telescope.builtin'.diagnostics()<cr>")

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", opts)


-- Close buffer
keymap("n", "<leader>ww", ":Bdelete %<CR>", opts)