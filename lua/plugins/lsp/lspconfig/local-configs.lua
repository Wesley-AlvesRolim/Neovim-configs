local M = {}
local util = require("lspconfig.util")

M.tailwindcss = {
	root_dir = function(fname)
		return util.root_pattern("tailwind.config.*")(fname)
			and util.find_node_modules_ancestor(fname)
			and util.find_package_json_ancestor(fname)
	end,
}

M.tsserver = {
	init_options = {
		maxTsServerMemory = "1024",
	},
}

return M
