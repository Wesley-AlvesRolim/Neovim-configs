local icons = require("config.icons")
local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local function get_tree_size()
	return require("nvim-tree.view").View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose", function()
	bufferline_api.set_offset(0)
end)

require("bufferline").setup({

	-- Enable/disable animations
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = true,

	-- Enable/disable close button
	closable = true,

	icons = {
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = icons.diagnostics.Error },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true, icon = icons.diagnostics.Hint },
		},
		gitsigns = {
			added = { enabled = false, icon = icons.git.add.text },
			changed = { enabled = false, icon = icons.git.change.text },
			deleted = { enabled = false, icon = icons.git.delete.text },
		},
		filetype = {
			-- Sets the icon's highlight group.
			-- If false, will use nvim-web-devicons colors
			custom_colors = false,

			-- Requires `nvim-web-devicons` if `true`
			enabled = true,
		},

		separator = { left = "▎", right = "" },

		-- Configure the icons on the bufferline when modified or pinned.
		-- Supports all the base icon options.
		modified = { button = "●" },
		pinned = { button = "", filename = true },
	},

	-- Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- Sets the minimum padding width with which to surround each tab
	minimum_padding = 1,

	-- Sets the maximum buffer name length.
	maximum_length = 30,

	-- Sets the minimum buffer name length.
	minimum_length = 10,

	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		NvimTree = true,
	},
})

local map = vim.api.nvim_set_keymap
local opts = {
	noremap = true,
	silent = true,
}

-- Move to previous/next
map("n", "<S-H>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<S-L>", "<Cmd>BufferNext<CR>", opts)
map("n", "<C-C>", "<Cmd>BufferClose<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
