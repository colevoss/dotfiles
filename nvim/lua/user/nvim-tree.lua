local remap = require('user.util.remap')
local M = {}

function M.setup()
  local nvim_tree_ok, tree = pcall(require, "nvim-tree")

  if not nvim_tree_ok then
    vim.notify("Could not load nvim-tree.lua")
    return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
    return
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

  tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
      update_cwd = false,
    },
    live_filter = {
      prefix = "F",
      always_show_folders = false,
    },
    ignore_ft_on_setup = {
      "gitcommit",
    },
    filters = {
      custom = {
        "^.git$",
      }
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      -- number = true,
      width = 50,
      side = "right",
      signcolumn = "yes",
      mappings = {
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        },
      },
    },
    renderer = {
      root_folder_modifier = ":t",
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json" },
      highlight_opened_files = 'all',
      indent_markers = {
        enable = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            modified = "",
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      }
    }
  }

  -- @see https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes
  remap.nmap('<leader>e', tree.toggle, 'Toggle Nvim Tree', true)
end

return M
