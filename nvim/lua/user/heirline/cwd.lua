local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire.colors').colors

local WorkDir = {
  hl = {
    fg = colors.fg,
    bg = colors.bg_lighter,
    -- bold = true
  },
  helpers.Space(),
  {
    provider = function()
      local cwd = vim.fn.getcwd(0)
      cwd = vim.fn.fnamemodify(cwd, ":t")

      if not conditions.width_percent_below(#cwd, 0.25) then
        cwd = vim.fn.pathshorten(cwd)
      end

      return cwd
    end,
  },
  helpers.Space(),
}

return WorkDir
