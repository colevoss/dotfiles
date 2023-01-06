local M = {}

local diagnostics = {
  "diagnostics",
  padding = 2,
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local mode_colors = {
  n = '#bd93f9', -- purple
  i = '#50fa7b', -- green
  v = '#8be9fd', -- cyan
  [' '] = '#8be9fd', -- cyan
  V = '#8be9fd', -- cyan
  c = '#ffb86c', -- pink
  no = '#bd93f9',
}

local mode = {
  "mode",
  icons_enabled = true,
  fmt = function(str, ctx)
    return str
  end,
  color = function()
    return { bg = mode_colors[vim.fn.mode()], fg = '#282a36' }
  end
}

local betterfiletype = {
  "filetype",
  icon_only = true,
  padding = 0,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  padding = 2,
}

local location = {
  "location",
}

local diff = {
  'diff',
  -- colored = true,
  -- diff_color = {
  --   -- Same color values as the general color option can be used here.
  --   added    = 'DiffAdd', -- Changes the diff's added color
  --   modified = 'DiffChange', -- Changes the diff's modified color
  --   removed  = 'DiffDelete', -- Changes the diff's removed color you
  -- },
  symbols = {
    added = '',
    modified = '',
    removed = '',
  },
}

local progress = {
  'progress',
  fmt = function()
    return "%P/%L"
  end
}

local navic = require('nvim-navic')

local nav = {
  navic.get_location,
  cond = navic.is_available
}

function M.setup()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  lualine.setup({
    options = {
      icons_enabled = true,
      -- theme = "auto",
      theme = {
        normal = {
          a = 'auto',
          b = {
            bg = '#21222b',
          },
          c = {
            bg = '#21222b',
          },
        },
      },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "dashboard", "NvimTree", "Outline", "TelescopePrompt" },
      always_divide_middle = false,
      -- globalstatus = true,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch, diff },
      lualine_c = { diagnostics },
      lualine_x = {},
      lualine_y = { location, progress },
      lualine_z = { filetype },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {
        {
          'filetype',
          colored = true,
          icon_only = true,
        },
        {
          'filename',
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 0, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '', -- Text to show when the file is modified.
            readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]', -- Text to show for newly created file before first write
          },
          color = function()
            return {
              fg = '#6272a4'
            }
          end
        },
        -- nav,
      },
    },
    winbar = {
      lualine_a = {
        {
          'filetype',
          colored = true,
          icon_only = true,
        },
        {
          'filename',
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 0,
          -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '', -- Text to show when the file is modified.
            readonly = '', -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]', -- Text to show for newly created file before first write
          },
          color = function()
            return {
              -- fg = '#6272a4'
              fg = '#f8f8f2'
            }
          end
        },
        nav,
      },
    },
    tabline = {},
    extensions = {},
  })
end

return M
