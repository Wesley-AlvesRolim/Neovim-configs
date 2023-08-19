return {
	-- Comment
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},

	-- Auto close ( [ {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},

	-- Files finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
	},

	-- Code Copilot
	{ "Exafunction/codeium.vim", event = "VimEnter" },

	-- Tmux integration
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
	},
}
