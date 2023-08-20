local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- Automatically install packer
local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }

    print "Installing packer close and reopen Neovim..."
    vim.cmd([[packadd packer.nvim]])

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}


return packer.startup(function()
  -- Have packer manage itself
  use { 'wbthomason/packer.nvim' }

  -- Theme
  -- use { 'colevoss/nvimpire' }
  use '~/codes/neovim/nvimpire'
  -- use { 'dracula/vim' }

  -- Nvim Tree
  use { 'nvim-tree/nvim-web-devicons' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
    },
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  -- use {
  --   'nvim-treesitter/nvim-treesitter-context'
  -- }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- LSP Installer
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    }
  }

  -- CMP
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- use {
  --   'ibhagwan/fzf-lua'
  -- }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use {
    'rebelot/heirline.nvim'
  }

  -- Trouble
  use {
    'folke/trouble.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  use {
    'lewis6991/gitsigns.nvim',
  }

  use {
    'windwp/nvim-autopairs'
  }

  use {
    'lukas-reineke/indent-blankline.nvim'
  }

  use {
    'RRethy/vim-illuminate'
  }

  use {
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- use {
  --   'rcarriga/nvim-notify'
  -- }

  use {
    'norcalli/nvim-colorizer.lua'
  }

  use {
    "fladson/vim-kitty"
  }

  if packer_bootstrap then
    packer.sync()
  end
end)
