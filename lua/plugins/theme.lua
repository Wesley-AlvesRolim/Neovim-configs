return {
	"sam4llis/nvim-tundra",
	lazy = false,
	priority = 1000,
	config = function()
		require("nvim-tundra").setup()
		vim.cmd.colorscheme("tundra")
	end,
}
