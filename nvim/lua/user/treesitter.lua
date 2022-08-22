local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  vim.notify("Could not load Treesitter configs")
  return
end

--[[ vim.api.nvim_exec("hi rainbowcolor3 guifg=#ffffff", true) ]]

configs.setup {
  ensure_installed = { "lua", "go", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    addistional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  --[[ rainbow = { ]]
  --[[   enable = true, ]]
  --[[   extended_mode = true, ]]
  --[[   max_file_lines = nil, ]]
  --[[ }, ]]
}
