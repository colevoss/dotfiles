local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  vim.notify("Could not load Treesitter configs")
  return
end

configs.setup {
  ensure_installed = { "lua", "go", "javascript", "typescript", "graphql", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
