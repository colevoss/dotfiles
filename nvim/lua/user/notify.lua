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

  local telescope_ok, telescope = pcall(require, 'telescope')

  if telescope_ok then
    telescope.load_extension('notify')
  end
end

return M
