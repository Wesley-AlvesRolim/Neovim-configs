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

	-- Comment
	{
		"numToStr/Comment.nvim",
		config = true,
	},

	-- theme
	{ "sam4llis/nvim-tundra", lazy = false, priority = 1000, config = true },

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},

	-- Auto close ( [ {
	{
		"windwp/nvim-autopairs",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Auto tag
	{
		"windwp/nvim-ts-autotag",
	},

	-- File explorer tree CTRL + B
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Files finder
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Tabs on nvim
	{ "romgrk/barbar.nvim" },

	-- Git
	{ "lewis6991/gitsigns.nvim" },

	-- Java
	{ "mfussenegger/nvim-jdtls" },

	-- Code Copilot
	{ "Exafunction/codeium.vim" },

	-- Null ls
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	-- LSP
	{ "neovim/nvim-lspconfig" },

	{
		"https://git.sr.ht/~nedia/auto-format.nvim",
		event = "BufWinEnter",
		config = true,
	},

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
				components = { "nvim", "lsp", "mason", "null-ls", "treesitter" },
			})
		end,
	},

	-- Statusline
	{
		"echasnovski/mini.statusline",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
	},

	-- Pomodoro
	{
		"cmpadden/pomodoro.nvim",
		config = true,
	},
})
