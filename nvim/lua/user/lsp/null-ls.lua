local M = {}

function M.setup()
  local null_ls_ok, null_ls = pcall(require, 'null-ls')

  if not null_ls_ok then
    vim.notify("Could not load null-ls")
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local codeactions = null_ls.builtins.code_actions

  local sources = {
    codeactions.eslint_d,
    diagnostics.eslint_d,
    formatting.prettierd,
  }

  null_ls.setup {
    debug = true,
    log_level = "debug",

    sources = sources
  }
end

return M
