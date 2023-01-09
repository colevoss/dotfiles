local M = {}

function M.setup()
  local navic_ok, navic = pcall(require, "nvim-navic")

  if not navic_ok then
    vim.notify('Could not load nvim-navic')
    return
  end

  vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "", fg = "#ffb86c" })
  vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "", fg = "#f8f8f2" })
  vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "", fg = "#8be9fd" })
  vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "", fg = "#8be9fd" })
  vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "", fg = "#f8f8f2" })
  vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "", fg = "#8be9fd" })
  vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "", fg = "#f8f8f2" })
  vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "", fg = "#BD93F9" })
  vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "", fg = "#8be9fd" })
  vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "", fg = "#424450" })

  navic.setup {
    highlight = true,
    icons = {
      File          = " ",
      Module        = " ",
      Namespace     = " ",
      Package       = " ",
      Class         = " ",
      Method        = " ",
      Property      = " ",
      Field         = " ",
      Constructor   = " ",
      Enum          = "練",
      Interface     = "練",
      Function      = " ",
      Variable      = " ",
      Constant      = " ",
      String        = " ",
      Number        = " ",
      Boolean       = "◩ ",
      Array         = " ",
      Object        = " ",
      Key           = " ",
      Null          = "ﳠ ",
      EnumMember    = " ",
      Struct        = " ",
      Event         = " ",
      Operator      = " ",
      TypeParameter = " ",
    },
    separator = " > ",
    depth_limit = 0,
  }

  vim.g.navic_silence = true
  -- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

return M
