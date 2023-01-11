local conditions = require('heirline.conditions')
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire.colors').colors

local Git = {
  condition = conditions.is_git_repo,
  hl = {
    fg = colors.purple,
    bg = colors.bg_light,
  },
  helpers.Space(2),
  {
    {
      provider = function()
        return " " .. vim.b.gitsigns_status_dict.head
      end
    },
    {
      condition = function()
        return vim.b.gitsigns_status_dict.added or 0 ~= 0
      end,
      provider = function()
        local count = vim.b.gitsigns_status_dict.added or 0
        -- return count > 0 and (" +" .. count)
        return count > 0 and ("  " .. count)

      end,
      hl = {
        fg = colors.green,
        force = true,
      },
    },
    {
      condition = function()
        return vim.b.gitsigns_status_dict.changed or 0 ~= 0
      end,
      provider = function()
        local count = vim.b.gitsigns_status_dict.changed or 0
        -- return count > 0 and (" ~" .. count)
        return count > 0 and ("  " .. count)
      end,
      hl = {
        fg = colors.orange,
        force = true,
      }
    },
    {
      condition = function()
        return vim.b.gitsigns_status_dict.removed or 0 ~= 0
      end,
      provider = function()
        local count = vim.b.gitsigns_status_dict.removed or 0
        return count > 0 and ("  " .. count)
      end,
      hl = {
        fg = colors.red,
        force = true,
      }
    },
    helpers.Space(2),
  }
}

return Git
