local servers = {
	"tsserver",
	"jdtls",
	"lua_ls",
	"html",
	"cssls",
	"jsonls",
	"yamlls",
	"dockerls",
	"docker_compose_language_service",
}

local configured_servers = { "jdtls" }

require("lsp.cmp")
require("lsp.mason").setup(servers, configured_servers)
require("lsp.handlers").setup()
