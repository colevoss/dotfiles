-- local theme = require('vimpire')
-- local nvimpire = require('nvimpire')
local nvimpire = require('nvimpire')

local M = {}

function M.setup()
  local colorscheme = 'nvimpire'
  local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not colorscheme_status_ok then
    vim.notify("could not set color scheme to nvimpire")
    return
  end

  nvimpire.setup {
    transparent = true
  }

  -- Set background to transparent
  -- local transparent_status, _ = pcall(vim.cmd, "let g:dracula_colorterm = 0")
  -- if not transparent_status then
  --   vim.notify("Could not set dracula_colorterm = 0")
  -- end
  -- local colorscheme = "dracula"
  -- local colorscheme_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  -- if not colorscheme_status_ok then
  --   vim.notify("could not set color scheme to dracula")
  --   return
  -- end
end

return M
