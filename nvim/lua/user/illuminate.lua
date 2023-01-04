local status_ok, illuminate = pcall(require, "illuminate")

if not status_ok then
  vim.notify("Could not load vim-illuminate")
  return
end

illuminate.configure {}
