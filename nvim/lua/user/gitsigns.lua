local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
  vim.notify("Could not load gitsigns")
  return
end

gitsigns.setup()
