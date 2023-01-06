local M = {}

function M.setup()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")

  if not status_ok then
    vim.notify("Could not load Treesitter configs")
    return
  end

  configs.setup {
    ensure_installed = {
      "lua",
      "go",
      "javascript",
      "typescript",
      "graphql",
      "rust",
      "help"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      enable = true,

      disable = {
        ""
      },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      -- additional_vim_regex_highlighting = false,

      indent = {
        enable = true,
        disable = { "yaml" }
      }
    }
  }
end

return M
