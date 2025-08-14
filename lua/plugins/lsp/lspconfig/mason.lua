local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local configs = require("plugins.lsp.lspconfig.handlers")
local local_configs = require("plugins.lsp.lspconfig.local-configs")
local java = require("plugins.lsp.lspconfig.local-configs.java")

local M = {}

M.setup = function(servers, local_configured_servers)
  if next(vim.api.nvim_list_uis()) == nil then
    return
  end

  if mason_ok then
    mason.setup({
      log_level = vim.log.levels.WARN,
    })
  end

  if mason_lsp_ok then
    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_enable = true,
    })

    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
      vim.lsp.config(server, configs.opts)
      configs.setup()
    end

    for _, server in ipairs(local_configured_servers) do
      if local_configs[server] == "jdtls" then
        java.setup()
      elseif local_configs[server] then
        vim.lsp.enable(server)
        vim.lsp.config(server, local_configs[server])
        configs.setup()
      else
        print("No local configuration found for " .. server)
      end
    end
  end
end

return M
