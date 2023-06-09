local icons = require("config.icons")
local MiniStatusline = require("mini.statusline")

local diagnostic_levels = {
	{ id = vim.diagnostic.severity.ERROR, sign = icons.diagnostics.Error },
	{ id = vim.diagnostic.severity.WARN, sign = icons.diagnostics.Warn },
	{ id = vim.diagnostic.severity.INFO, sign = icons.diagnostics.Info },
	{ id = vim.diagnostic.severity.HINT, sign = icons.diagnostics.Hint },
}

local get_diagnostic_count = function(id)
	return #vim.diagnostic.get(0, { severity = id })
end

MiniStatusline.setup()

MiniStatusline.section_diagnostics = function(args)
	local hasnt_attached_client = next(vim.lsp.buf_get_clients()) == nil
	local dont_show_lsp = MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" or hasnt_attached_client
	if dont_show_lsp then
		return ""
	end

	local t = {}
	for _, level in ipairs(diagnostic_levels) do
		local n = get_diagnostic_count(level.id)
		if n > 0 then
			table.insert(t, string.format(" %s%s", level.sign, n))
		end
	end

	local icon = args.icon or ("" or "LSP")
	if vim.tbl_count(t) == 0 then
		return ("%s -"):format(icon)
	end
	return string.format("%s%s", icon, table.concat(t, ""))
end

MiniStatusline.section_location = function()
	return "%l│%2v"
end

vim.cmd("set laststatus=3")
