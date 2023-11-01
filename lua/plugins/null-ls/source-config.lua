local M = {}

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
