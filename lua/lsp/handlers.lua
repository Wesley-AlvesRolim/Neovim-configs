local M = {}
local icons = require("config.icons")

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warn },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local diagConfig = {
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
	}

	vim.diagnostic.config(diagConfig)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", vim.lsp.buf.declaration, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", vim.lsp.buf.definition, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", vim.lsp.buf.implementation, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", vim.lsp.buf.references, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", vim.lsp.buf.hover, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.api.nvim_buf_set_keymap(bufnr, { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", vim.lsp.buf.format, opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

M.on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
end

return M
