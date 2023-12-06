return {
	position = { "center", "center" }, -- position = {'<position_x>', '<position_y>'}
	relative = "editor", -- win, editor, cursor. Default win
	clip_popup_size = true,
	width = 100,
	height = 20,
	border = "rounded", -- none, single, double, rounded, solid, shadow, (or an array or chars).
	sort_mru = true, -- Sort buffers by most recently used
	split_filename = true, -- Split filename into separate components for name and path.
	split_filename_path_width = 25, -- If split_filename is true
	preview_position = "bottom",
	preview = {
		width = 120,
		height = 25,
		border = "single",
	},
	highlight = {
		current = "Title", -- default StatusLine
		hidden = "StatusLineNC", -- default ModeMsg
		split = "WarningMsg", -- default StatusLine
		alternate = "StatusLine", -- default WarningMsg
	},
}
