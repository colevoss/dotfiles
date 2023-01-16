local M = {}

function M.setup()
  local navic_ok, navic = pcall(require, "nvim-navic")

  if not navic_ok then
    vim.notify('Could not load nvim-navic')
    return
  end

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
