local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('nvimpire.colors').colors

local LspActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach', 'BufEnter' },

  provider = function(self)
    local names = {}

    local current_buff = vim.api.nvim_get_current_buf()
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = current_buff })) do
      table.insert(names, server.name)
    end

    return "[ " .. table.concat(names, ", ") .. " ]"
  end,
  hl = {
    fg = colors.comment,
    -- bold = true
  },
}

return LspActive
