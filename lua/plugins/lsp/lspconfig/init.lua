local M = {}

local servers = {
  "lua_ls",
  "jsonls",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "jdtls",
  "omnisharp",
  "biome",
  "pylsp",
}

local configured_servers = { "jdtls", "omnisharp", "rust_analyzer" }

local local_configured_servers = { "tailwindcss", "ts_ls" }

M.setup = function()
  require("lspconfig").gdscript.setup(require("plugins.lsp.lspconfig.handlers").opts)

  require("plugins.lsp.lspconfig.cmp")
  require("plugins.lsp.lspconfig.mason").setup(servers, configured_servers, local_configured_servers)
  require("plugins.lsp.lspconfig.handlers").setup()
end

return M
