local M = {}

local colors = require('nvimpire').colors

local diagnostics = {
  "diagnostics",
  padding = 2,
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  -- symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local mode_colors = {
  n = colors.purple,
  i = colors.green,
  v = colors.cyan,
  [' '] = colors.cyan,
  V = colors.cyan,
  c = colors.orange,
  no = colors.purple,
}

local mode = {
  "mode",
  icons_enabled = true,
  fmt = function(str)
    return str
  end,
  color = function()
    return { bg = mode_colors[vim.fn.mode()], fg = '#282a36' }
  end
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = {
    "",
    color = {
      fg = colors.orange
    }
  },
  padding = 2,
  color = {
    fg = colors.fg
  }
}

local location = {
  "location",
}

local lsp = {
  'lsp',
  fmt = function()
    local client_names = {}
    local client_count = 0

    for _, client in ipairs(vim.lsp.get_active_clients()) do
      table.insert(client_names, client.name)
      client_count = client_count + 1
    end

    if client_count == 0 then
      return ""
    end

    return "[ " .. table.concat(client_names, ",") .. " ]"
  end,
  color = {
    fg = colors.comment,
    -- bg = colors.none,
  }
}

local function _lsp()
  local client_names = {}
  local client_count = 0

  for _, client in ipairs(vim.lsp.get_active_clients()) do
    table.insert(client_names, client.name)
    client_count = client_count + 1
  end

  if client_count == 0 then
    return ""
  end

  return "[ " .. table.concat(client_names, ",") .. " ]"
end

local diff = {
  'diff',
}

local filename = {
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
}

local filetype = {
  'filetype',
  colored = true,
  icon_only = true,
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
      -- theme = theme,
      theme = 'nvimpire',
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "dashboard", "NvimTree", "Outline", "TelescopePrompt", "Trouble" },
      always_divide_middle = false,
    },
    sections = {
      lualine_a = { mode },
      -- lualine_b = { branch, diff },
      lualine_b = { branch },
      lualine_c = { filetype, filename },
      -- lualine_c = { filetype, filename },
      lualine_x = { diagnostics, lsp },
      lualine_y = { location },
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = { mode },
      lualine_b = { branch, diff },
      lualine_c = {},
      lualine_x = { lsp },
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {
        filetype,
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
              -- fg = '#6272a4'
              bg = colors.none,
            }
          end
        },
        nav,
      },
    },
    winbar = {
      lualine_a = {
        filetype,
        filename,
        nav,
      },
    },
  })
end

return M
