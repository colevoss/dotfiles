local remap = require('user.util.remap')
local M = {}

function M.setup()
  local neotree_ok, neotree = pcall(require, 'neo-tree')

  if not neotree_ok then
    vim.notify('Could not load neotree')
    return
  end

  local explorer_focus_cmd = "Neotree focus filesystem right"
  local buffer_focus_cmd = "Neotree focus buffers right"
  local git_focus_cmd = "Neotree focus git_status right"

  neotree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,

    window = {
      position = "right",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["e"] = function()
          vim.api.nvim_exec(explorer_focus_cmd, true)
        end,
        ["b"] = function()
          vim.api.nvim_exec(buffer_focus_cmd, true)
        end,
        ["g"] = function()
          vim.api.nvim_exec(git_focus_cmd, true)
        end,
        ["<CR>"] = "open",
        ["<esc>"] = "revert_preview",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        -- ["l"] = "focus_preview",
        ["v"] = "open_vsplit",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["m"] = "move",
        ["R"] = "refresh",
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require('neo-tree.sources.filesystem').toggle_directory(state, node)
          else
            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' then
            if not node:is_expanded() then
              require('neo-tree.sources.filesystem').toggle_directory(state, node)
            elseif node:has_children() then
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          end
        end
      }
    },

    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = true,
      },

      follow_current_file = true,
      hijack_netrw_behavior = "open_default",

      window = {
        mappings = {
          ["/"] = "fuzzy_finder",
          ["<c-x>"] = "clear_filter"
        }
      },

      buffers = {
        follow_current_file = true,

        show_unloaded = true,

        window = {
          mappings = {
            ["bd"] = "buffer_delete",
          }
        }
      },

      git_status = {
        window = {
          position = "float"
        }
      }
    },

    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      icon = {
        -- folder_closed = "",
        -- folder_open = "",
        -- folder_empty = ""
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      },

      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          renamed = "",
          untracked = "U",
          ignored = "◌",
          unstaged = "",
          staged = "S",
          conflict = "",
          deleted = "✖"
        }
      },
    }
  })

  remap.nmap('<leader>ee', ":Neotree reveal=true source=filesystem<CR>", 'Toggle Nvim Tree', true)
  remap.nmap('<leader>eb', ":Neotree reveal=true source=buffers<CR>", 'Toggle Nvim Tree', true)
  remap.nmap('<leader>eg', ":Neotree reveal=true source=git_status<CR>", 'Toggle Nvim Tree', true)
  remap.nmap('<leader>ec', ":Neotree close<CR>", 'Toggle Nvim Tree', true)
end

return M
