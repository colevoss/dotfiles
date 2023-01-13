local conditions = require('heirline.conditions')
-- local utils = require('heirline.utils')
local colors = require('nvimpire.colors').colors
local helpers = require('user.heirline.helpers')

local null_ls_map = {
  prettierd = "prettier",
  eslint_d = "eslint"
}

local LspActive = {
  condition = conditions.lsp_attached,
  {
    hl = function(self)
      return {
        fg = colors.bg_lighter,
        bg = self.show_diagnostics and colors.bg_light or colors.none
      }
    end,
    provider = helpers.LeftBubbleChar,
  },
  {
    provider = function()
      local names = {}

      local current_buff = vim.api.nvim_get_current_buf()
      for _, client in pairs(vim.lsp.get_active_clients({ bufnr = current_buff })) do
        if client.name ~= 'null-ls' then
          table.insert(names, client.name)
        else
          local sources = require('null-ls.sources').get_available(vim.bo.filetype)

          local null_ls_sources = {}
          for _, source in ipairs(sources) do
            local null_ls_name = null_ls_map[source.name] or source.name
            null_ls_sources[null_ls_name] = true
          end

          vim.list_extend(names, vim.tbl_keys(null_ls_sources))
        end
      end

      return "ﯶ " .. table.concat(names, ", ") .. " "
    end,
    hl = {
      fg = colors.purple,
      bg = colors.bg_lighter,
      bold = true
    },
  },
}

return LspActive
