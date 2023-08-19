local servers = {
	"jdtls",
	"lua_ls",
	"html",
	"cssls",
	"jsonls",
	"yamlls",
	"dockerls",
	"docker_compose_language_service",
	"omnisharp_mono",
}

local configured_servers = { "jdtls", "omnisharp_mono" }

require("lspconfig").gdscript.setup(require("lsp.handlers").opts)

require("lsp.cmp")
require("lsp.mason").setup(servers, configured_servers)
require("lsp.handlers").setup()
