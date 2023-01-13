local colors = require('nvimpire.colors').colors

local M = {}

M.Align = {
  provider = "%="
}

M.Space = function(n)
  n = n or 1

  return {
    provider = string.rep(" ", n),
  }
end

M.LeftSeparator = function(color)
  return {
    provider = "",
    hl = {
      fg = color,
    }
  }
end

M.RightSeparator = function(fg, bg)
  bg = bg or colors.none
  return {
    provider = "",
    hl = {
      fg = fg,
      bg = bg,
    }
  }
end

M.LeftBubbleSeperator = function(fg, bg)
  bg = bg or colors.none
  return {
    provider = "",
    hl = {
      fg = fg,
      bg = bg
    }
  }
end

M.RightBubbleSeperator = function(fg, bg)
  bg = bg or colors.none
  return {
    provider = "",
    hl = {
      fg = fg,
      bg = bg
    }
  }
end

-- 
-- 

return M
