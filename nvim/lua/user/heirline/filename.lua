local conditions = require('heirline.conditions');
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire.colors').colors

local Left = {
  condition = conditions.is_active,
  provider = "",
  hl = function(self)
    return {
      bg = self.none,
      fg = self.bg,
    }
  end
}

local Right = {
  condition = conditions.is_active,
  provider = "",
  hl = function(self)
    return {
      bg = self.none,
      fg = self.bg,
    }
  end
}

local FileTags = {
  provider = function()
    return vim.bo.modified and ' ' or ' '
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
}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)

    self.git_highlight = false
    if conditions.is_git_repo() then
      ---@diagnostic disable-next-line: undefined-field
      local added = (vim.b.gitsigns_status_dict.added or 0) ~= 0
      ---@diagnostic disable-next-line: undefined-field
      local changed = (vim.b.gitsigns_status_dict.changed or 0) ~= 0
      ---@diagnostic disable-next-line: undefined-field
      local removed = (vim.b.gitsigns_status_dict.removed or 0) ~= 0

      self.git_highlight = added or changed or removed
    end

    self.errors = 0
    self.warnings = 0
    self.has_diagnostics = false

    local bufnr = vim.fn.bufnr()

    if conditions.has_diagnostics() then
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.has_diagnostics = self.errors ~= 0 or self.warnings ~= 0
    end

    local active = conditions.is_active()
    local bg = active and colors.fg or colors.none
    local fg = active and colors.bg or colors.fg

    if self.git_highlight then
      bg = active and colors.cyan or bg
      fg = active and colors.bg or colors.cyan
    end

    if self.errors > 0 then
      bg = active and colors.red or bg
      fg = active and colors.bg or colors.red
    elseif self.warnings > 0 then
      bg = active and colors.orange or bg
      fg = active and colors.bg or colors.orange
    end

    self.bg = bg
    self.fg = fg
  end,
  Left,
  {
    hl = function(self)
      return {
        fg = self.fg,
        bg = self.bg,
        bold = true,
      }
    end,
    FileIcon,
    FileName,
    FileTags,
  },
  Right,
}

return FileNameBlock
