local remap = require('user.util.remap')

local M = {}

M.setup = function()
  -- Remap Space to leader
  remap.keymap("", "<Space>", "<Nop>", {
    silent = true,
    desc = "Space as leader"
  })

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  ------------------------
  -- Normal
  ------------------------

  -- Colon Shortcut
  remap.nmap(";", ":", "Colon works as semicolon", false)

  -- Save Shortcut
  remap.nmap("<leader>w", ":w<CR>", "Leader + W save shortcut", false)

  -- Better window navigation
  remap.nmap("<C-h>", "<C-w>h", "<C-h> to navigate to left pane", true)
  remap.nmap("<C-j>", "<C-w>j", "<C-j> to navigate to down pane", true)
  remap.nmap("<C-k>", "<C-w>k", "<C-k> to navigate to up pane", true)
  remap.nmap("<C-l>", "<C-w>l", "<C-l> to navigate to right pane", true)

  -- In buffer nav
  remap.nmap("<C-d>", "<C-d>zz", "Navigate down and center", true)
  remap.nmap("<C-u>", "<C-u>zz", "Navigate up and center", true)

  -- Previous and next buffers
  remap.nmap("<C-p>", ":bprevious<CR>", "Go to previous buffer", true)
  remap.nmap("<C-n>", ":bnext<CR>", "Go to next buffer", true)

  -- Better full line yank
  remap.nmap("<S-y>", "<S-v>y", "Better full line yank", true)

  -- Move to start or end of line
  remap.nmap("<C-e>", "$", "Move to start or end of line", true)

  ------------------------
  -- Visual
  ------------------------

  -- Stay in indent mode
  remap.vmap("<", "<gv", "Indent left", true)
  remap.vmap(">", ">gv", "Indent right", true)
end

return M
