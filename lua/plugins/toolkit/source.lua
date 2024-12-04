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
	biome = {
		filetype = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"html",
			"css",
			"json",
			"jsonc",
			"yaml",
		},
	},
	-- prettierd = {
	--   filetype = {
	--     "javascript",
	--     "javascriptreact",
	--     "typescript",
	--     "typescriptreact",
	--     "vue",
	--     "html",
	--     "css",
	--     "json",
	--     "jsonc",
	--     -- "yaml",
	--   },
	-- },
	gdformat = {
		command = vim.fn.stdpath("data") .. "/mason/bin/gdformat",
		filetype = {
			"gd",
			"gdscript",
			"gdscript3",
		},
	},
	csharpier = {
		filetype = {
			"cs",
		},
	},
	["pretty-php"] = {
		filetype = {
			"php",
		},
	},
	blue = {
		filetype = {
			"python",
		},
	},
}

M.linters = {
	markdownlint = {
		filetype = {
			"markdown",
		},
	},
	biomejs = {
		filetype = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	-- eslint_d = {
	--   filetype = {
	--     "javascript",
	--     "javascriptreact",
	--     "typescript",
	--     "typescriptreact",
	--     "vue",
	--   },
	-- },
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
