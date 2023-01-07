local M = {}

function M.setup()
  local notify_ok, notify = pcall(require, 'notify')

  if not notify_ok then
    vim.notify("Could not load notify")
    return
  end

  notify.setup {
    background_colour = "#000000",
  }

  vim.notify = notify
end

return M
