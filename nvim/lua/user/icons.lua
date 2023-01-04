local icons_ok, icons = pcall(require, "nvim-web-devicons")

if not icons_ok then
  vim.notify("Could not load nvim-web-devicons")
  return
end

icons.setup {}
