require("mason").setup()

require("mason-null-ls").setup({
	automatic_setup = true,
	ensure_installed = {
		-- formatters
		"prettierd",
		"stylua",
		"google-java-format",

		-- linters
		"eslint_d",
		"markdownlint",
		"editorconfig-checker",

		-- debuggers
	},
	automatic_installation = true,
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		-- formatters
		formatting.prettierd,
		formatting.stylua,
		formatting.google_java_format,

		-- diagnostics
		diagnostics.eslint_d,
		diagnostics.markdownlint,
		diagnostics.editorconfig_checker.with({
			command = "editorconfig-checker",
		}),
	},
})
