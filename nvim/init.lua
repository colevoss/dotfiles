-- Install all plugins first
-- Plugins doesnt run setup
require("user.plugins")

-- Basic setup
require("user.options").setup()
require("user.vim-keymaps").setup()

-- require('user.notify').setup()

-- Plugin setups
require("user.colorscheme").setup()
require("user.icons").setup()
require("user.lsp").setup()
require("user.cmp").setup()
require("user.nvim-tree").setup()
require("user.treesitter").setup()
require("user.telescope").setup()
-- require("user.lualine").setup()
require("user.heirline").setup()
require("user.trouble").setup()
require("user.gitsigns").setup()
require("user.autopairs").setup()
require("user.illuminate").setup()
require("user.indent-blankline").setup()
require("user.comment").setup()
require("user.navic").setup()
require("user.auto-commands").setup()

require('colorizer').setup()
