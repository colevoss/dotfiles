local status_ok, bufferline = pcall(require, "bufferline")

print("LOADING BUFFERLINE")

if not status_ok then
  vim.notify("Could not load bufferline")
  return
end

bufferline.setup {
  options = {
    close_icon = "",
    buffer_close_icon = "",
  }
}
