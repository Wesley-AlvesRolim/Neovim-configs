local servers = { "tsserver", "jdtls", "lua_ls", "html", "cssls", "jsonls", "yamlls", "dockerls",
	"docker_compose_language_service" }
require('lsp.cmp')
require('lsp.mason').setup(servers)
require('lsp.configs').setup(servers)
require('lsp.handlers').setup()

