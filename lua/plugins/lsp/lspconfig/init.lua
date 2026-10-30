local M = {}

local servers = {
  "lua_ls",
  "jsonls",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "omnisharp",
  "biome",
  "pylsp",
}

local local_configured_servers = { "tailwindcss", "rust_analyzer", "ts_ls", "jdtls" }

M.setup = function()
  vim.lsp.config("gdscript", require("plugins.lsp.lspconfig.handlers").opts)

  require("plugins.lsp.lspconfig.cmp")
  require("plugins.lsp.lspconfig.mason").setup(servers, local_configured_servers)
  require("plugins.lsp.lspconfig.handlers").setup()
  M.start_smd_lang()
end

M.start_smd_lang = function()
  local smd_ls_name = "smd_ls"
  local smd_grp = vim.api.nvim_create_augroup(smd_ls_name, { clear = true })

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.smd",
    group = smd_grp,
    command = "set filetype=smd",
  })

  vim.lsp.config[smd_ls_name] = {
    cmd = { "/home/wesley/Área de trabalho/smd-lang/cli/target/release/smd-lang-cli", "lsp" },
    filetypes = { "smd" },
  }

  vim.lsp.enable(smd_ls_name)
end

return M
