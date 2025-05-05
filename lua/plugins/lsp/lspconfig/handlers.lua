local M = {}
local icons = require("config.icons")
local merge = require("utils").merge
local keymap = vim.keymap.set

local floating_menu_opts = {
  border = "rounded",
  width = 60,
}

M.setup = function()
  local signs_config = {
    text = {},
    linehl = {},
    numhl = {},
  }
  local severity_type = {
    ["DiagnosticSignError"] = vim.diagnostic.severity.ERROR,
    ["DiagnosticSignWarn"] = vim.diagnostic.severity.WARN,
    ["DiagnosticSignHint"] = vim.diagnostic.severity.HINT,
    ["DiagnosticSignInfo"] = vim.diagnostic.severity.INFO,
  }

  for _, sign in ipairs(icons.signs) do
    local severity = severity_type[sign.name]
    signs_config.text[severity] = sign.text
    signs_config.linehl[severity] = sign.name
    signs_config.numhl[severity] = ""
  end

  local diagConfig = {
    virtual_text = true,
    signs = signs_config,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
  }

  vim.diagnostic.config(diagConfig)
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
  keymap("n", "K", function()
    vim.lsp.buf.hover(floating_menu_opts)
  end, merge(opts, { desc = "[K]eyboard hover" }))
  keymap("n", "<leader>D", vim.lsp.buf.type_definition, merge(opts, { desc = "[D]efinition Type" }))
  keymap("n", "<leader>rn", vim.lsp.buf.rename, merge(opts, { desc = "[R]e[n]ame" }))
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, merge(opts, { desc = "[C]ode [A]ction" }))
  keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, merge(opts, { desc = "[F]ormat Request" }))
end

local function lsp_keymaps()
  keymap("n", "<leader>se", function()
    vim.diagnostic.open_float(floating_menu_opts)
  end)
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
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}

return M
