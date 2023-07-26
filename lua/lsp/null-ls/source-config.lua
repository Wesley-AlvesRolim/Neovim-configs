local M = {}

M.eslint_d = {
	condition = function(null_ls_utils)
		return null_ls_utils.root_has_file_matches(".eslintrc*")
	end,
}

M.gdlint = {
	name = "gdlint",
	command = vim.fn.stdpath("data") .. "/mason/bin/gdlint",
	filetypes = { "gd", "gdscript", "gdscript3" },
}

M.gdformat = {
	name = "gdformat",
	command = vim.fn.stdpath("data") .. "/mason/bin/gdformat",
	filetypes = { "gd", "gdscript", "gdscript3" },
}

return M
