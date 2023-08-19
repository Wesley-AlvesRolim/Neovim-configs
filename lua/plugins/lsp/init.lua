return {
	-- Lua/Neovim
	{
		"folke/neodev.nvim",
		event = "BufEnter",
		filetype = "lua",
		config = function()
			require("neodev").setup()
		end,
	},

	-- Java
	{ "mfussenegger/nvim-jdtls" },

	-- Typescript
	{
		"pmizio/typescript-tools.nvim",
		ft = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

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
}
