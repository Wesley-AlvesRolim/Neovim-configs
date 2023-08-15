return {
	{
		"folke/neodev.nvim",
		event = "BufEnter",
		filetype = "lua",
		config = function()
			require("neodev").setup()
		end,
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = true,
	},

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
		event = "InsertEnter",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},

	-- Files finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Git
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = require("config.git-signs").setup },

	-- Code Copilot
	{ "Exafunction/codeium.vim", event = "VimEnter" },

	-- Java
	{ "mfussenegger/nvim-jdtls" },

	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
		},
	},

	-- Notifier
	{
		"vigoux/notifier.nvim",
		event = "VeryLazy",
		config = function()
			require("notifier").setup({
				components = { "nvim", "lsp", "mason", "null-ls", "treesitter" },
			})
		end,
	},

	-- Tmux integration
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
	},
}
