local utils = require("utils")

local formatters = {
	"prettierd",
	"stylua",
}

local linters = {
	"eslint_d",
	"markdownlint",
}

local supported_code_actions = {
	"eslint_d",
	"gitsigns",
}

local mason_sources = {}
mason_sources = utils.insert_item_list_to_table(mason_sources, formatters)
mason_sources = utils.insert_item_list_to_table(mason_sources, linters)

require("mason-null-ls").setup({
	automatic_setup = true,
	ensure_installed = mason_sources,
	automatic_installation = true,
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local sources = {}

sources = utils.merge(sources, {
	diagnostics.editorconfig_checker.with({
		command = "editorconfig-checker",
	}),

	-- snippets support
	null_ls.builtins.completion.luasnip,
})
sources = utils.merge(sources, utils.insert_item_from_table_to_table(sources, formatting, formatters))
sources = utils.merge(sources, utils.insert_item_from_table_to_table(sources, diagnostics, linters))
sources = utils.merge(sources, utils.insert_item_from_table_to_table(sources, code_actions, supported_code_actions))

null_ls.setup({ sources = sources })
