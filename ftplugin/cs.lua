local opts = require("lsp.handlers").opts

local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

require("lspconfig")["omnisharp_mono"].setup({
	cmd = { omnisharp_bin },
	capabilities = opts.capabilities,
	on_attach = function(client)
		opts.on_attach()
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
