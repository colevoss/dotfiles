local status_ok, trouble = pcall(require, "trouble")
local keymap = vim.keymap.set

if not status_ok then
  vim.notify("Could not load trouble")
  return
end

trouble.setup {
}

keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xf", "<cmd>Trouble document_diagnostics<CR>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", opts)
keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<CR>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble lsp_definitions<CR>", opts)
