local M = {}

local c = require('user.colors')



function M.setup()
  local heirline_ok, heirline = pcall(require, 'heirline')

  if not heirline_ok then
    vim.notify("Could not load heirline")
    return
  end

  local utils = require('heirline.utils')
  local conditions = require('heirline.conditions')

  heirline.load_colors(c)

  local VimMode = {
    init = function(self)
      self.mode = vim.fn.mode(1)

      if not self.once then
        vim.api.nvim_create_autocmd("ModeChanged", {
          pattern = "*:*o",
          command = "redrawstatus"
        });

        self.once = true
      end
    end,
    provider = function(self)
      -- return self.mode_names[self.mode]
      return "  %-2(" .. self.mode_names[self.mode] .. "%)"
    end,
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      return {
        bg = c[self.mode_colors[mode]],
        fg = c.bg,
        bold = true
      }
    end,
    update = {
      "ModeChanged",
    },
    static = {
      mode_names = { -- change the strings if you like it vvvvverbose!
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
        V = "V_",
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
      },
      mode_colors = {
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
    },
  }


  local StatusLine = {
    VimMode
  }

  heirline.setup(StatusLine)
end

return M
