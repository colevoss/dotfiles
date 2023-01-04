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
    vim.cmd [[packadd packer.nvim]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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

  -- "All the lua functions I don't want to write twice."
  use { 'nvim-lua/plenary.nvim' }

  -- Theme
  use { 'dracula/vim' }

  -- Nvim Tree
  use { 'nvim-tree/nvim-web-devicons' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
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

  use { "RRethy/vim-illuminate" }

  if packer_bootstrap then
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
    packer.sync()
  end
end)
