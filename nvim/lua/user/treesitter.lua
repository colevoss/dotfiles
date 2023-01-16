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
      "typescript",
      "tsx",
      "html",
      "graphql",
      "rust",
      "help",
      "json"
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
      additional_vim_regex_highlighting = false,

      indent = {
        enable = true,
        disable = { "yaml" }
      }
    },
    -- playground = {
    --   enable = true
    -- }
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn", -- set to `false` to disable one of the mappings
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  }

  -- local ts_context_ok, ts_context = pcall(require, 'treesitter-context')
  --
  -- if not ts_context_ok then
  --   vim.notify('Could not load treesitter context')
  --   return
  -- end

  -- ts_context.setup {
  --   mode = 'cursor'
  -- }

  -- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE", italic = true })
  -- vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#50fa7b" })
  -- vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#50fa7b" })
end

return M
