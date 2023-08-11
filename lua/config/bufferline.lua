local map = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

local setup_keymaps = function()
	local coke_map = require("cokeline.mappings")
	map("n", "<C-S-H>", function()
		coke_map.by_step("switch", -1)
	end, opts)

	map("n", "<C-S-L>", function()
		coke_map.by_step("switch", 1)
	end, opts)

	map("n", "<S-H>", function()
		coke_map.by_step("focus", -1)
	end, opts)

	map("n", "<S-L>", function()
		coke_map.by_step("focus", 1)
	end, opts)

	map("n", "<C-C>", function()
		require("cokeline.utils").buf_delete(vim.api.nvim_get_current_buf())
		vim.cmd.redrawtabline()
	end, opts)
end

local setup_bufferline = function()
	local get_hex = require("cokeline/utils").get_hex
	require("cokeline").setup({
		default_hl = {
			fg = function(buffer)
				return buffer.is_focused and get_hex("Boolean", "fg") or get_hex("Comment", "fg")
			end,
			bg = function(buffer)
				return buffer.is_focused and get_hex("cursorline", "bg")
			end,
		},

		sidebar = {
			filetype = "NvimTree",
			components = {
				{
					text = "  NvimTree",
					fg = get_hex("conceal", "fg"),
					bg = get_hex("floating", "bg"),
					style = "bold",
				},
			},
		},

		components = {
			{
				text = function(buffer)
					return (buffer.index ~= 1) and "▏" or ""
				end,
			},
			{
				text = "  ",
			},
			{
				text = function(buffer)
					return buffer.devicon.icon
				end,
				fg = function(buffer)
					return buffer.devicon.color
				end,
			},
			{
				text = " ",
			},
			{
				text = function(buffer)
					return buffer.filename .. "  "
				end,
				style = function(buffer)
					return buffer.is_focused and "bold" or nil
				end,
			},
			{
				-- text = "",
				text = function(buffer)
					return buffer.is_modified and "" or ""
				end,
				on_click = function(_, _, _, _, buffer)
					buffer:delete()
				end,
			},
			{
				text = "  ",
			},
		},
	})
end

return {
	setup = function()
		setup_keymaps()
		setup_bufferline()
	end,
}
