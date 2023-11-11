return {
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("plugins.toolkit.linter")
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.toolkit.formatter")
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		event = "VimEnter",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			local source_configs = require("plugins.toolkit.source")
			local ensure_installed = {}

			for tool, _ in pairs(source_configs.formatters) do
				local name = source_configs.alternative_package[tool] or tool
				table.insert(ensure_installed, name)
			end

			for tool, _ in pairs(source_configs.linters) do
				local name = source_configs.alternative_package[tool] or tool
				table.insert(ensure_installed, name)
			end

			mason_tool_installer.setup({
				ensure_installed = ensure_installed,
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
}
