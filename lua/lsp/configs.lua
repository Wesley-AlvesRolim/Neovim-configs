local configs = require("lsp.handlers")
local M = {}

local function is_configured_servers(server_to_compare, configured_servers)
	for _, configured_server in ipairs(configured_servers) do
		return configured_server == server_to_compare
	end
end

M.setup = function(servers, configured_servers)
	for _, server in ipairs(servers) do
		if not is_configured_servers(server, configured_servers) then
			local opts = {
				on_attach = configs.on_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				),
			}

			require("lspconfig")[server].setup(opts)
			configs.setup()
		end
	end
end

return M
