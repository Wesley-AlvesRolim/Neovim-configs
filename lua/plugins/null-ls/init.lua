local formatters = {}

local linters = {
	"markdownlint",
}

local supported_code_actions = {
	"gitsigns",
}

local only_install = { "gdtoolkit" }

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		local mason = require("plugins.null-ls.mason")
		local config = require("plugins.null-ls.config")

		mason.setup({
			formatters = formatters,
			linters = linters,
			only_install = only_install,
		})

		config.setup({
			formatters = formatters,
			linters = linters,
			supported_code_actions = supported_code_actions,
		})
	end,
}
