return {
	-- Theme
	{
		"sam4llis/nvim-tundra",
		lazy = false,
		priority = 1000,
		config = function()
			require("nvim-tundra").setup()
			vim.cmd.colorscheme("tundra")
		end,
	},

	-- Git
	{ "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = require("config.git-signs").setup },

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
}
