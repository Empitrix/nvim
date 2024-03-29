local status, packer = pcall(require, "packer")
if (not status) then return end

vim.cmd [[ packadd packer.nvim ]]

-- plugins
packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Pakcer Manger
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }                                  -- Solarized theme
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim'         -- LSP UIs
  use 'L3MON4D3/LuaSnip'             -- Snippet
  use 'hoob3rt/lualine.nvim'         -- Statusline
  use 'onsails/lspkind-nvim'         -- Vscode-like pictograms
  use 'hrsh7th/cmp-buffer'           -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'         -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'             -- Completion
  use 'neovim/nvim-lspconfig'        -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }                                       -- Treesitter
  use 'williamboman/mason-lspconfig.nvim' -- Mason
  use 'williamboman/mason.nvim'           -- Mason
  use 'jose-elias-alvarez/null-ls.nvim'   -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'         -- Prettier for Neovim's built-in LSP clinet
  use 'windwp/nvim-autopairs'             -- Auto close for pairs
  use 'windwp/nvim-ts-autotag'            -- Auto close for tags
  use 'nvim-lua/plenary.nvim'             -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua' -- Colorize color squres

  use 'lewis6991/gitsigns.nvim'

  -- Dart / Flutter
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  use "lukas-reineke/indent-blankline.nvim"

  use "ellisonleao/gruvbox.nvim" -- Gruvbox (Neovide)

  -- use "gcmt/taboo.vim" -- Rename Tab
  -- github suggestd issue for lsp html/css
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- https://www.reddit.com/r/neovim/comments/12ov8rj/neovim_emmetls_issues/
  use {             -- Configurations for Nvim LSPs
    "aca/emmet-ls", -- Enable emmet LSP
  }
end)
