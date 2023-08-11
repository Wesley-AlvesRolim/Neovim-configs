return {
	"willothy/nvim-cokeline",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",     -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
	},
	keys = {
		{ "<C-S-H>" },
		{ "<C-S-L>" },
		{ "<S-H>" },
		{ "<S-L>" },
		{ "<C-C>" },
	},
	config = require("config.bufferline").setup,
}
