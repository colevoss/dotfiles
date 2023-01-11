local VimMode = require('user.heirline.mode').VimMode
local FileName = require('user.heirline.filename')
local LspActive = require('user.heirline.lsp')
local WorkDir = require('user.heirline.cwd')
local Git = require('user.heirline.git')
local Diagnostics = require('user.heirline.diagnostics')
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire').colors

local M = {}
local Align = helpers.Align
local Space = helpers.Space

function M.setup()
  local heirline_ok, heirline = pcall(require, 'heirline')

  if not heirline_ok then
    vim.notify("Could not load heirline")
    return
  end

  heirline.load_colors(colors)

  local StatusLine = {
    -- VimMode, Space, FileName, Git, Align,
    VimMode, WorkDir, Git, Align,
    -- FileName,
    -- WorkDir, Align,
    Diagnostics, Space(), LspActive,

    hl = {
      bg = colors.bg_dark,
    }
  }

  heirline.setup({
    statusline = StatusLine
  })
end

return M
