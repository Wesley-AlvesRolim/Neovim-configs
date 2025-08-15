local M = {}

local local_configs = require("plugins.lsp.lspconfig.local-configs")
local utils = require("utils")

local nvim_java_ok, nvim_java = pcall(require, "java")
if not nvim_java_ok then
  vim.notify("nvim-java not found, please install")
  return M
end

local jdtls_ok, _ = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify("JDTLS not found, install with `:Lazy`")
  return M
end

local opts = require("plugins.lsp.lspconfig.handlers").opts

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  vim.notify("Could not find project root dir")
  return M
end

local mason_packages_path = vim.fn.stdpath("data") .. "/mason/packages"
local jdtls_path = mason_packages_path .. "/jdtls"
local shared_config_path = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins/"
local lombok_path = mason_packages_path .. "/lombok-nightly/lombok.jar"
local path_to_jar = vim.fn.glob(path_to_plugins .. "org.eclipse.equinox.launcher_*.jar")

local cache_dir = vim.fs.normalize("~/.cache/jdtls")
local config_dir = cache_dir .. "/config"
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = cache_dir .. "/workspace/" .. project_name

M.config = utils.merge(local_configs.jdtls, {
  cmd = {
    "java",
    -- "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
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
  },

  root_dir = root_dir,
  capabilities = opts.capabilities,
  on_attach = function(_, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
    opts.on_attach(nil, bufnr)
  end,
})

M.setup = function()
  nvim_java.setup()
  local server = "jdtls"
  vim.lsp.enable(server)
  vim.lsp.config(server, local_configs[server])
  opts.setup()
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.java" },
    callback = function()
      local _, _ = pcall(vim.lsp.codelens.refresh)
    end,
  })
end

return M
