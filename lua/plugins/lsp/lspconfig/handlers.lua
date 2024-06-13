local M = {}
local icons = require("config.icons")
local merge = require("utils").merge
local keymap = vim.keymap.set

M.setup = function()
  for _, sign in ipairs(icons.signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local diagConfig = {
    virtual_text = true,
    signs = { active = icons.signs },
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

local function lsp_keymaps_buf(buf)
  keymap("n", "<leader>se", vim.diagnostic.open_float)
  keymap("n", "<leader>le", vim.diagnostic.setloclist)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  local opts = { buffer = buf, noremap = true, silent = true }
  keymap("n", "gr", vim.lsp.buf.references, merge(opts, { desc = "[G]oto [R]eferences" }))
  keymap("n", "gD", vim.lsp.buf.declaration, merge(opts, { desc = "[G]oto [D]eclaration" }))
  keymap("n", "gd", vim.lsp.buf.definition, merge(opts, { desc = "[G]oto [D]efinition" }))
  keymap("n", "gi", vim.lsp.buf.implementation, merge(opts, { desc = "[G]oto [I]mplementation" }))
  keymap("n", "K", vim.lsp.buf.hover, merge(opts, { desc = "[K]eyboard hover" }))
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, merge(opts, { desc = "[S]ignature [H]elp" }))
  keymap("n", "<leader>D", vim.lsp.buf.type_definition, merge(opts, { desc = "[D]efinition Type" }))
  keymap("n", "<leader>rn", vim.lsp.buf.rename, merge(opts, { desc = "[R]e[n]ame" }))
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, merge(opts, { desc = "[C]ode [A]ction" }))
  keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, merge(opts, { desc = "[F]ormat Request" }))
end

local function lsp_keymaps()
  keymap("n", "<leader>se", vim.diagnostic.open_float)
  keymap("n", "<leader>le", vim.diagnostic.setloclist)

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      lsp_keymaps_buf(ev.buf)
    end,
  })
end

M.on_attach = function(_, buf)
  if buf ~= nil then
    lsp_keymaps_buf(buf)
  else
    lsp_keymaps()
  end
end

M.opts = {
  on_attach = M.on_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

return M
