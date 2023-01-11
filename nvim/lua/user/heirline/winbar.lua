local conditions = require('heirline.conditions')
local FileName = require('user.heirline.filename')
local helpers = require('user.heirline.helpers')
local navic = require('nvim-navic')

local Nav = {
  condition = function()
    return navic.is_available()
  end,
  provider = function()
    print('navic run')
    return navic.get_location()
  end,
  update = "CursorMoved"
}

local WinBar = {
  fallthrough = false,
  -- {
  --   confition = function()
  --     return conditions.buffer_matches({
  --       buftype = { "nofile", "prompt", "help", "quickfix" },
  --       filetype = { "^git.*", "fugitive" },
  --     })
  --   end,
  --   init = function()
  --     vim.opt_local.winbar = nil
  --   end
  -- },
  -- { -- A special winbar for terminals
  --   condition = function()
  --     return conditions.buffer_matches({ buftype = { "terminal" } })
  --   end,
  --   provider = "TERMINAL"
  --   -- utils.surround({ "", "" }, "dark_red", {
  --   --     FileType,
  --   --     Space,
  --   --     TerminalName,
  --   -- }),
  -- },
  -- {
  --   condition = function()
  --     return not conditions.is_active()
  --   end,
  --   provider = "INACTGIVE"
  -- },
  {
    FileName,
    helpers.Space(),
    Nav,
  }
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
