local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('nvimpire.colors').colors

local LspActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach', 'BufEnter' },

  provider = function(self)
    local names = {}

    local current_buff = vim.api.nvim_get_current_buf()
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = self.bufnr })) do
      print(vim.inspect(client.messages))
      table.insert(names, client.name)
    end

    return " [ " .. table.concat(names, ", ") .. " ]"
  end,
  hl = {
    fg = colors.comment,
    -- bold = true
  },
}
--
local LspProgress = {
  condition = conditions.lsp_attached,
  update = { "User", pattern = { 'LspProgressUpdate', 'LspRequest' } },

  provider = function(self)
    local progress = vim.lsp.util.get_progress_messages()[1]
    if not progress then
      return ""
    end

    local perc = progress.percentage or 0

    return "prog: " .. perc .. (progress.title or '')
  end,
  hl = {
    fg = colors.comment,
  },
}

return LspActive

-- return {
--   LspActive,
--   LspProgress
-- }
