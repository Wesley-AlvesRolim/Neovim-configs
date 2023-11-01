return {
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("plugins.lint.linter")
		end,
	},
	{
		"mhartington/formatter.nvim",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("plugins.lint.formatter")
		end,
	},
}
