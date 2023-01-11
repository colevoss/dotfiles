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
  helpers.Space(2),
  {
    init = function(self)
      self.cwd = vim.fn.getcwd(0)
    end,
    provider = function(self)
      -- local cwd = vim.fn.getcwd(0)
      local cwd = vim.fn.fnamemodify(self.cwd, ":t")

      if not conditions.width_percent_below(#cwd, 0.25) then
        cwd = vim.fn.pathshorten(self.cwd)
      end

      return " " .. cwd
    end,
  },
  helpers.Space(2),
}

return WorkDir
