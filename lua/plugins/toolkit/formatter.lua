local merge = require("utils").merge
local source = require("plugins.toolkit.source")

local filetype = {}

for name, value in pairs(source.formatters) do
  for _, source_filetype in pairs(value.filetype) do
    local filetype_table_copy = source_filetype[source_filetype] or {}
    table.insert(filetype_table_copy, name)
    filetype[source_filetype] = filetype_table_copy
  end
end

local conform = require("conform")
local conform_format_config = {
  lsp_fallback = true,
  async = false,
  timeout_ms = 500,
}
conform.setup({
  formatters_by_ft = filetype,
  format_on_save = conform_format_config,
})

vim.api.nvim_create_user_command("Format", function()
  conform.format(merge(conform_format_config, { async = true }))
end, { bang = true })
