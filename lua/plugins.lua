local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "kevinoid/vim-jsonc" },
	-- Comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Auto close ( [ {
	{ "jiangmiao/auto-pairs" },

	-- theme
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
        if (has("termguicolors"))
          set termguicolors
        endif
      ]])
			vim.cmd([[ syntax enable ]])
			vim.cmd([[ colorscheme dracula ]])
		end,
	},

	-- Rainbow brackets
	{
		"fedepujol/bracketpair.nvim",
		lazy = false,
	},

	-- these two plugins will add highlighting and indenting to JSX and TSX files.
	{ "pangloss/vim-javascript" },

	{ "neoclide/vim-jsx-improve" },

	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },

	-- File explorer tree CTRL + B
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Files finder
	{ "nvim-telescope/telescope.nvim",    tag = "0.1.1",      dependencies = { "nvim-lua/plenary.nvim" } },

	-- Tabs on nvim
	{ "romgrk/barbar.nvim" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	-- Java
	{ "mfussenegger/nvim-jdtls" },

	-- Code Copilot
	{ "Exafunction/codeium.vim" },

	-- Null ls
	{ "williamboman/mason.nvim",          cmd = "MasonUpdate" },

	{ "williamboman/mason-lspconfig.nvim" },

	{ "jose-elias-alvarez/null-ls.nvim" },

	{ "jay-babu/mason-null-ls.nvim" },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- CMP Sources
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"f3fora/cmp-spell",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	-- Notifier
	{
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup({
				components = { "nvim", "lsp" },
			})
		end,
	},
})
