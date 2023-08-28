-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- Add a line to display vim mode and more
  use("nvim-lualine/lualine.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("ryanoasis/vim-devicons")
  -- Syntax Highlight
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  -- Allows you to see all changes history (and undo each of them, of course)
  use("mbbill/undotree")

  -- Git tracker
  use("tpope/vim-fugitive")

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },          -- Required
      { "williamboman/mason.nvim" },        -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },      -- Required
      { "hrsh7th/cmp-nvim-lsp" },  -- Required
      { "L3MON4D3/LuaSnip" },      -- Required
      { "hrsh7th/cmp-buffer" },    -- Optional
      { "hrsh7th/cmp-path" },      -- Optional
      { "hrsh7th/cmp-cmdline" },   -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "onsails/lspkind-nvim" },  -- Optional
      { "jose-elias-alvarez/null-ls.nvim" },

      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
  })

  use("jose-elias-alvarez/typescript.nvim")

  use("prettier/vim-prettier")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use 'mg979/vim-visual-multi'

  -- Switch between files quickly
  use("ThePrimeagen/harpoon")

  use({ "mhartington/formatter.nvim" })

  -- Catppuccin theme
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- DAP (Debug Adapter Protocol)
  use("mfussenegger/nvim-dap")
  use("mxsdev/nvim-dap-vscode-js")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use({
    "microsoft/vscode-js-debug",
    opt = true,
  })

  use("windwp/nvim-ts-autotag")

  -- Emmet plugin
  use 'mattn/emmet-vim'

  -- nvim-tree (file explorer)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
end)
