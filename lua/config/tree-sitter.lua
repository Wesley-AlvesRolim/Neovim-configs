require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "java", "typescript", "yaml", "json", "regex", "tsx" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript", "css", "scss" },

	indent = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},

	highlight = {
		enable = true,
		disable = { "css", "scss" },
		additional_vim_regex_highlighting = false,
	},
})
