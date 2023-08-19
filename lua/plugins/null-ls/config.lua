local M = {}
local sources = {}

function M.setup(source_list)
	local null_ls = require("null-ls")
	local utils = require("utils")
	local source_config = require("plugins.null-ls.source-config")

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local code_actions = null_ls.builtins.code_actions

	sources = utils.merge(sources, {
		formatting.eslint_d.with(source_config.eslint_d),
		diagnostics.eslint_d.with(source_config.eslint_d),
		code_actions.eslint_d.with(source_config.eslint_d),

		formatting.gdformat.with(source_config.gdformat),
		diagnostics.gdlint.with(source_config.gdlint),
		-- snippets support
		null_ls.builtins.completion.luasnip,
	})
	sources = utils.merge(sources, utils.insert_item_from_table_to_table(sources, formatting, source_list.formatters))
	sources = utils.merge(sources, utils.insert_item_from_table_to_table(sources, diagnostics, source_list.linters))
	sources = utils.merge(
		sources,
		utils.insert_item_from_table_to_table(sources, code_actions, source_list.supported_code_actions)
	)

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		debug = false,
		fallback_severity = vim.diagnostic.severity.WARN,
		update_in_insert = false,
		debounce = 500,
		sources = sources,
		on_exit = function()
			os.execute(vim.fn.stdpath("data") .. "/mason/bin/eslint_d stop")
			os.execute(vim.fn.stdpath("data") .. "/mason/bin/prettierd stop")
		end,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client_by_filter)
								return client_by_filter.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end,
	})
end

return M
