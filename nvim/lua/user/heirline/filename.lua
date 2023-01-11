local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire.colors').colors

-- local M = {}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)

    if conditions.is_git_repo() then
      local added = vim.b.gitsigns_status_dict.added or 0 ~= 0
      local changed = vim.b.gitsigns_status_dict.changed or 0 ~= 0
      local removed = vim.b.gitsigns_status_dict.removed or 0 ~= 0

      self.git_highlight = added or changed or removed
    end
  end
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return {
      fg = self.icon_color
    }
  end
}

local FileName = {
  -- init = function(self)
  --   if not conditions.is_git_repo() then
  --     return
  --   end
  --
  --   local added = vim.b.gitsigns_status_dict.added or 0 ~= 0
  --   local changed = vim.b.gitsigns_status_dict.changed or 0 ~= 0
  --   local removed = vim.b.gitsigns_status_dict.removed or 0 ~= 0
  --
  --   self.git_highlight = added or changed or removed
  -- end,
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":t")
    if filename == "" then return "[No name]" end

    return filename
  end,
  -- make italic if not active
  hl = function(self)
    return {
      fg = self.git_highlight and colors.cyan or self.fg,
      italic = not conditions.is_active(),
    }
  end,
}

local FileTags = {
  -- condition = function()
  --   return vim.bo.modified
  -- end,
  -- provider = ''
  provider = function()
    return vim.bo.modified and '' or ' '
  end
}

FileNameBlock = utils.insert(FileNameBlock,
  FileIcon,
  FileName,
  helpers.Space(),
  FileTags
)

return FileNameBlock
