local formatter = require("formatter")
local default_formatters = require("formatter.defaults")
local source = require("plugins.lint.source")

local filetype = {
	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
}

for name, value in pairs(source.formatters) do
	for _, source_filetype in pairs(value.filetype) do
		filetype[source_filetype] = {
			default_formatters[name],
		}
	end
end

formatter.setup({
	filetype = filetype,
})

vim.cmd[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]
