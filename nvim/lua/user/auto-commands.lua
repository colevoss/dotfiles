local M = {}

function M.setup()
  -- Use 'q' to quit from common plugins
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
    callback = function()
      vim.cmd [[
        nnoremap <silent> <buffer> q :close<CR> 
        set nobuflisted 
      ]]
    end,
  })

  -- Highlight on yank
  local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
  })

  -- Fixes Autocomment
  vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
      vim.cmd "set formatoptions-=cro"
    end,
  })
end

return M
