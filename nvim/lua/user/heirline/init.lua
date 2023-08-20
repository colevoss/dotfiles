local VimMode = require('user.heirline.mode').VimMode
local WorkDir = require('user.heirline.cwd')
local Git = require('user.heirline.git')
local LspDiagnostics = require('user.heirline.lsp_diagnostics')
local Winbar = require('user.heirline.winbar')
local Bufferline = require('user.heirline.bufferline')
local helpers = require('user.heirline.helpers')
local colors = require('nvimpire').colors
local settings = require('nvimpire.config').settings

local M = {}

function M.setup()
  local heirline_ok, heirline = pcall(require, 'heirline')

  if not heirline_ok then
    vim.notify("Could not load heirline")
    return
  end

  heirline.load_colors(colors)

  local StatusLine = {
    VimMode, WorkDir, Git,
    helpers.Align,
    LspDiagnostics,

    hl = {
      bg = settings.transparent and colors.none or colors.bg_dark,
    }
  }

  heirline.setup({
    statusline = StatusLine,
    winbar = Winbar,
    tabline = Bufferline,
  })

  vim.o.showtabline = 2
end

return M
