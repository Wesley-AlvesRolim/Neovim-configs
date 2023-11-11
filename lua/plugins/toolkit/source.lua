local M = {}

M.formatters = {
	markdownlint = {
		filetype = {
			"markdown",
		},
	},
	stylua = {
		filetype = {
			"lua",
		},
	},
	prettierd = {
		filetype = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	gdformat = {
		command = vim.fn.stdpath("data") .. "/mason/bin/gdformat",
		filetype = {
			"gd",
			"gdscript",
			"gdscript3",
		},
	},
}

M.linters = {
	markdownlint = {
		filetype = {
			"markdown",
		},
	},
	eslint_d = {
		filetype = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	gdlint = {
		command = vim.fn.stdpath("data") .. "/mason/bin/gdlint",
		filetype = {
			"gd",
			"gdscript",
			"gdscript3",
		},
	},
}

M.alternative_package = {
	gdformat = "gdtoolkit",
	gdlint = "gdtoolkit",
}

return M
