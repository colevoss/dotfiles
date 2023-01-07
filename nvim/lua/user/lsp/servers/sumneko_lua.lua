local sumneko_lua = {
  Lua = {
    runtime = {
      version = 'LuaJIT'
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
      checkThirdParty = false,
    },
    telemetry = { enable = false },
    diagnostics = {
      globals = {
        'vim',
        'use'
      }
    }
  }
}

return sumneko_lua
