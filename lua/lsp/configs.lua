local configs = require("lsp.handlers")
local M = {}

M.setup = function(servers, configured_servers)
	for _, server in pairs(servers) do
		for _, configured_server in pairs(configured_servers) do
			if server == configured_server then
				return
			end
		end

		local opts = {
			on_attach = configs.on_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}

		require("lspconfig")[server].setup(opts)
		configs.setup()
	end
end

return M
