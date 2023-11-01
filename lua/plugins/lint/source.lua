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
}

return M
