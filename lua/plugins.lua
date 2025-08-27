---@diagnostic disable: undefined-global
local status, packer = pcall(require, "packer")
if not status then return end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use "folke/tokyonight.nvim"
	use 'kyazdani42/nvim-web-devicons'
	use 'neovim/nvim-lspconfig'
	-- use 'glepnir/lspsaga.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'hoob3rt/lualine.nvim'
	use 'akinsho/nvim-bufferline.lua'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'lewis6991/gitsigns.nvim'
	use {
		'akinsho/flutter-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional: vim.ui.select
		}
	}
	-- Snippets
	use 'L3MON4D3/LuaSnip'
	use 'onsails/lspkind-nvim'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	-- use 'hrsh7th/cmp-buffer'
end)
