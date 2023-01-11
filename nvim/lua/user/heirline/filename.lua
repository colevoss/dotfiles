local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire.colors').colors

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)

    if conditions.is_git_repo() then
      local added = vim.b.gitsigns_status_dict.added or 0 ~= 0
      local changed = vim.b.gitsigns_status_dict.changed or 0 ~= 0
      local removed = vim.b.gitsigns_status_dict.removed or 0 ~= 0

      self.git_highlight = added or changed or removed
    end

    self.errors = 0
    self.warnings = 0

    if conditions.has_diagnostics() then
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
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
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":t")
    if filename == "" then return "[No name]" end

    local diagnostic_count = 0
    -- local diagnostic_count = self.warnings + self.errors
    if self.errors > 0 then
      diagnostic_count = self.errors
    elseif self.warnings > 0 then
      diagnostic_count = self.warnings
    end

    if diagnostic_count > 0 then
      filename = filename .. " " .. tostring(diagnostic_count)
    end

    return filename
  end,
  -- make italic if not active
  hl = function(self)
    local fg = colors.fg

    if self.git_highlight then
      fg = colors.green
    end

    if self.errors > 0 then
      fg = colors.red
    elseif self.warnings > 0 then
      fg = colors.orange
    end

    return {
      fg = fg,
      italic = not conditions.is_active(),
    }
  end,
}

local FileTags = {
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
