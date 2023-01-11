local M = {}

local colors = require('nvimpire').colors

M.mode_names = {
  n = "N",
  no = "N?",
  nov = "N?",
  noV = "N?",
  ["no\22"] = "N?",
  niI = "Ni",
  niR = "Nr",
  niV = "Nv",
  nt = "Nt",
  v = "V",
  vs = "Vs",
  V = "V-",
  Vs = "Vs",
  ["\22"] = "^V",
  ["\22s"] = "^V",
  s = "S",
  S = "S_",
  ["\19"] = "^S",
  i = "I",
  ic = "Ic",
  ix = "Ix",
  R = "R",
  Rc = "Rc",
  Rx = "Rx",
  Rv = "Rv",
  Rvc = "Rv",
  Rvx = "Rv",
  c = "C",
  cv = "Ex",
  r = "...",
  rm = "M",
  ["r?"] = "?",
  ["!"] = "!",
  t = "T",
}

M.mode_colors = {
  n = "purple",
  i = "green",
  v = "cyan",
  V = "cyan",
  ["\22"] = "cyan",
  c = "orange",
  s = "yellow",
  S = "yellow",
  ["\19"] = "purple",
  R = "orange",
  r = "orange",
  ["!"] = "red",
  t = "red",
}

M.VimMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
    -- Can we use an augroup?
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = "redrawstatus"
      })

      self.once = true
    end
  end,
  provider = function(self)
    return " %-0.2(" .. M.mode_names[self.mode] .. "%) "
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)

    return {
      bg = colors[M.mode_colors[mode]],
      fg = colors.bg,
      bold = true
    }
  end,
  update = {
    "ModeChanged",
  }
}

return M
