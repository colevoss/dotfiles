local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function()
  use { 'wbthomason/packer.nvim' } -- Have packer manage itself
  use { 'nvim-lua/plenary.nvim' }
  use { 'dracula/vim' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    }
  }
  use { "L3MON4D3/LuaSnip" }
  use "saadparwaiz1/cmp_luasnip"

  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  use {
    "akinsho/bufferline.nvim",
    require = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    }
  }
  use { "moll/vim-bbye" }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  use 'windwp/nvim-autopairs'
  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'nvim-telescope/telescope.nvim' }
  use { "lewis6991/gitsigns.nvim" }

  use { "jose-elias-alvarez/null-ls.nvim" }

  use { "folke/trouble.nvim" }

  use { "lukas-reineke/indent-blankline.nvim" }

  use { "p00f/nvim-ts-rainbow" }
end)
