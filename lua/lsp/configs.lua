local configs = require("lsp.handlers")
local M = {}

M.setup = function(servers)
	for _, server in pairs(servers) do
		local opts = {
			on_attach = configs.on_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}

		require("lspconfig")[server].setup(opts)
		configs.setup()
	end
end

return M
