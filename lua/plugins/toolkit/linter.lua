local lint = require("lint")
local source = require("plugins.toolkit.source")

local filetype = {}

for name, value in pairs(source.linters) do
	for _, source_filetype in pairs(value.filetype) do
		filetype[source_filetype] = {
			name
		}
	end
end


lint.linters_by_ft = filetype

-- Autocommand for nvim-lint
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
