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
  require("lspconfig").gdscript.setup(require("plugins.lsp.lspconfig.handlers").opts)

  require("plugins.lsp.lspconfig.cmp")
  require("plugins.lsp.lspconfig.mason").setup(servers, local_configured_servers)
  require("plugins.lsp.lspconfig.handlers").setup()
end

return M
