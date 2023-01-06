local M = {}

local diagnostics = {
  "diagnostics",
  padding = 8,
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filename = {
  "filename",
  path = 1,
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
}

local location = {
  "location",
}

function M.setup()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end


  local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "dashboard", "NvimTree", "Outline", "TelescopePrompt" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch },
      lualine_c = { filename, betterfiletype, diagnostics },
      lualine_x = { "diff", spaces, "encoding" },
      lualine_y = { location },
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
    tabline = {
    },
    extensions = {},
  })
end

return M
