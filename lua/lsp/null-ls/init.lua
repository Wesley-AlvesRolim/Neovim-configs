local mason = require("lsp.null-ls.mason")
local config = require("lsp.null-ls.config")

local formatters = {
	"prettierd",
	"stylua",
}
local linters = {
	"markdownlint",
}

local supported_code_actions = {
	"gitsigns",
}

local only_install = { "eslint_d", "gdtoolkit" }

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
