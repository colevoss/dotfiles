local status_ok, trouble = pcall(require, "trouble")

if not status_ok then
  vim.notify("Could not load trouble")
  return
end

trouble.setup {
  auto_open = true
}
