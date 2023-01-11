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
end

return M
