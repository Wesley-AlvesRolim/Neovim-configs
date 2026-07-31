local M = {
  config = {},
  setup = function() end,
}

local lsp_handlers = require("plugins.lsp.lspconfig.handlers")
local local_configs = require("plugins.lsp.lspconfig.local-configs")

local nvim_java_ok, _ = pcall(require, "java")
if not nvim_java_ok then
  vim.notify("nvim-java not found, please install")
  return M
end

local root_dir = vim.fs.root(vim.fn.getcwd(), { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
if root_dir == "" or root_dir == nil then
  return M
end

local nvim_java_packages_path = vim.fn.stdpath("data") .. "/nvim-java/packages"
local jdtls_path = nvim_java_packages_path .. "/jdtls"
local shared_config_path = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins/"
local lombok_path = vim.fn.glob(nvim_java_packages_path .. "/lombok*/lombok*.jar")
local path_to_jar = vim.fn.glob(path_to_plugins .. "org.eclipse.equinox.launcher_*.jar")

local cache_dir = vim.fs.normalize("~/.cache/jdtls")
local config_dir = cache_dir .. "/config"
local index_dir = cache_dir .. "/index"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = cache_dir .. "/workspace/" .. project_name

M.config = {
  _cmd = { -- Not using, but kept for reference
    "java",
    -- "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx8G",
    "-noverify",
    "-XX:+UseParallelGC",
    "-Dsun.zip.disableMemoryMapping=true",
    "--add-modules=ALL-SYSTEM",

    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-Dosgi.checkConfiguration=true",
    "-Dosgi.sharedConfiguration.area=" .. shared_config_path,
    "-Dosgi.sharedConfiguration.area.readOnly=true",
    "-Dosgi.configuration.cascaded=true",

    "-javaagent:" .. lombok_path,

    "-jar",
    path_to_jar,
    "-configuration",
    config_dir,
    "-data",
    workspace_dir,
    "-Djdt.core.sharedIndexLocation=" .. index_dir,
  },

  root_dir = root_dir,
  capabilities = local_configs.jdtls.capabilities,
  settings = local_configs.jdtls.settings,
}

M.setup = function()
  require("java").setup()
  vim.lsp.config("jdtls", M.config)
  vim.lsp.enable("jdtls")
  lsp_handlers.setup()
  local_configs.jdtls.on_attach()
end

return M
