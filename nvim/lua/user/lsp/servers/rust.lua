local status_ok, config = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require("user.lsp.handlers")

-- config.rust_analyzer.setup(handlers)
config.rust_analyzer.setup {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = {
    imports = {
      granularity = {
        group = "module",
      },
      prefix = "self",
    },
  }
}

-- local rt_status_ok, rt = pcall(require, "rust-tools")

-- if not rt_status_ok then
--   return
-- end

-- local function rt_on_attach(client, buf)
--   handlers.on_attach(client, buf)
--   local opts = { noremap = true, silent = true, buffer = buf }

--   vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
--   vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
-- end

-- rt.setup(handlers)
-- rt.setup {
--   server = {
--     on_attach = rt_on_attach,
--     standalone = false,

--     --[[ settings = { ]]
--     --[[   ["rust-analyzer"] = { ]]
--     --[[     checkOnSave = { ]]
--     --[[       command = "clippy" ]]
--     --[[     } ]]
--     --[[   } ]]
--     --[[ } ]]
--   },

--   inlay_hints = {
--     auto = true
--   },

--   --[[ hover_actions = { ]]
--   --[[   auto_focus = true ]]
--   --[[ } ]]
-- }
-- --[[ rt.inlay_hints.set() ]]
