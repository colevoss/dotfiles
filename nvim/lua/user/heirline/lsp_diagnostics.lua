local conditions = require('heirline.conditions')
-- local utils = require('heirline.utils')
local colors = require('nvimpire.colors').colors
local helpers = require('user.heirline.helpers')
local Diagnostics = require('user.heirline.diagnostics')
local Lsp = require('user.heirline.lsp')

local LspDiagnostics = {
  update = { "DiagnosticChanged", 'LspAttach', 'LspDetach', 'BufEnter' },
  init = function(self)
    self.has_diagnostics = conditions.has_diagnostics()
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

    self.show_diagnostics = self.has_diagnostics
        and ((self.errors > 0)
            or (self.warnings > 0)
            or (self.hints > 0)
            or (self.info > 0))
  end,
  {
    condition = function(self)
      return self.show_diagnostics
    end,
    helpers.LeftBubbleSeperator(colors.bg_light),
    hl = {
      bg = colors.bg_light
    },
    Diagnostics,
  },
  Lsp
}

return LspDiagnostics
