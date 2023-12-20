local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local is_configured_servers = require("utils").is_configured_servers
local configs = require("plugins.lsp.lspconfig.handlers")
local local_configs = require("plugins.lsp.lspconfig.local-configs")

local M = {}

M.setup = function(servers, configured_servers, local_configured_servers)
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
      automatic_installation = true,
    })

    mason_lspconfig.setup_handlers({
      function(server)
        if is_configured_servers(server, local_configured_servers) then
          require("lspconfig")[server].setup(local_configs[server])
          configs.setup()
        elseif not is_configured_servers(server, configured_servers) then
          require("lspconfig")[server].setup(configs.opts)
          configs.setup()
        end
      end,
    })
  end
end

return M
