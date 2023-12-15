local M = {}

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

local local_configured_servers = { "tailwindcss", "tsserver", "rust_analyzer" }

M.setup = function()
	require("lspconfig").gdscript.setup(require("plugins.lsp.lspconfig.handlers").opts)

	require("plugins.lsp.lspconfig.cmp")
	require("plugins.lsp.lspconfig.mason").setup(servers, configured_servers, local_configured_servers)
	require("plugins.lsp.lspconfig.handlers").setup()
end

return M
