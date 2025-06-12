local status, packer = pcall(require, "packer")
if not status then return end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme: tokyonight
  use "folke/tokyonight.nvim"

  -- Theme: onedark
  use 'navarasu/onedark.nvim'

  -- Theme: Solarized
  use {
    'svrana/neosolarized.nvim',
    commit = "ce91523ab50cccb7da7e227efc7c1084e84f10b5",
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Theme: Gruvbox
  use 'ellisonleao/gruvbox.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- UI
  use 'hoob3rt/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Autopairs and autotag
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Flutter/Dart
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional: vim.ui.select
    }
  }

  -- Emmet LSP (for HTML/CSS)
  use 'aca/emmet-ls'

  -- Mason (optional)
  -- use 'williamboman/mason.nvim'
  -- use 'williamboman/mason-lspconfig.nvim'
end)
