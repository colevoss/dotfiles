local M = {}

M.keymap = vim.keymap.set

function M.nmap(seq, replace_seq, desc, silent)
  vim.keymap.set("n", seq, replace_seq, {
    desc = desc,
    silent = silent
  })
end

function M.vmap(seq, replace_seq, desc, silent)
  vim.keymap.set("v", seq, replace_seq, {
    desc = desc,
    silent = silent
  })
end

return M
