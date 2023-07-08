local null_ls = require("null-ls")
local utils = require("utils")
local M = {}

local mason_sources = {}

function M.setup(source_list)
	mason_sources = utils.insert_item_list_to_table(mason_sources, source_list.formatters)
	mason_sources = utils.insert_item_list_to_table(mason_sources, source_list.linters)
	mason_sources = utils.insert_item_list_to_table(mason_sources, source_list.only_install)

	require("mason-null-ls").setup({
		automatic_setup = true,
		ensure_installed = mason_sources,
		automatic_installation = true,
		handlers = {
			function(source, types)
				if
						not null_ls.is_registered(source)
						and not utils.is_configured_servers(source, source_list.only_install)
				then
					vim.tbl_map(function(type)
						null_ls.register(null_ls.builtins[type][source])
					end, types)
				end
			end,
		},
	})
end

return M
