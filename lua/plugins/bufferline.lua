return {
	"willothy/nvim-cokeline",
	event = "VeryLazy",
	commit = "48636776059b5fb6de4b91a21655b06d16150ce6",
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
