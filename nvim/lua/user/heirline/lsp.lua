local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('nvimpire.colors').colors
local helpers = require('user.heirline.helpers')

local null_ls_map = {
  prettierd = "prettier",
  eslint_d = "eslint"
}

local LspActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach', 'BufEnter' },
  helpers.LeftBubbleSeperator(colors.purple),
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

      return "ﯶ " .. table.concat(names, ", ")
    end,
    hl = {
      fg = colors.bg,
      bg = colors.purple,
      bold = true
    },
  },
  helpers.RightBubbleSeperator(colors.purple),
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
