local navic = require('nvim-navic')

local WinBar = {
  condition = function()
    return navic.is_available()
  end,
  provider = function()
    return navic.get_location()
  end,
  update = "CursorMoved"
}

vim.api.nvim_create_autocmd("User", {
  pattern = "HeirlineInitWinbar",
  callback = function(args)
    local buf = args.buf
    local buftype = vim.tbl_contains(
      { "prompt", "nofile", "help", "quickfix" },
      vim.bo[buf].buftype
    )

    local filetype = vim.tbl_contains({ "gitcommit", "fugitive" }, vim.bo[buf].filetype)

    if buftype or filetype then
      vim.opt_local.winbar = nil
    end
  end,
})

return WinBar
