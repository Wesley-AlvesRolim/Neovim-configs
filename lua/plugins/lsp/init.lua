return {
	-- Lua/Neovim
	{
		"folke/neodev.nvim",
		event = "BufEnter",
		config = function()
			require("neodev").setup()
		end,
	},

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
		config = require("plugins.lsp.lspconfig").setup,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- CMP Sources
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"f3fora/cmp-spell",

			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = "make install_jsregexp",
				config = function()
					require("config.snippets")
				end,
				dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
			},
		},
	},
}
