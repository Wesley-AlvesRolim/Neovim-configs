local M = {}

M.eslint_d = {
	condition = function(null_ls_utils)
		return null_ls_utils.root_has_file_matches(".eslintrc*")
	end,
}

return M
