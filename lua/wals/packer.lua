-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'ryanoasis/vim-devicons'
	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

	use('neovim/nvim-lspconfig')
	use "jose-elias-alvarez/null-ls.nvim"
	use('MunifTanjim/prettier.nvim')

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
	use "WhoIsSethDaniel/mason-tool-installer.nvim"

	use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
	use "onsails/lspkind-nvim"
  use "glepnir/lspsaga.nvim"

	use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

  use 'ThePrimeagen/harpoon'

  use { 'mhartington/formatter.nvim' }

  use { "catppuccin/nvim", as = "catppuccin" }

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'mxsdev/nvim-dap-vscode-js'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
  }

  use 'windwp/nvim-ts-autotag'
end)
