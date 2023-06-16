local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notify("JDTLS not found, install with `:LspInstall jdtls`")
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local shared_config_path = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins/"
local lombok_path = jdtls_path .. "/lombok.jar"
local path_to_jar = vim.fn.glob(path_to_plugins .. "org.eclipse.equinox.launcher_*.jar")

local cache_dir = vim.fs.normalize("~/.cache/jdtls")
local config_dir = cache_dir .. "/config"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = cache_dir .. "/workspace/" .. project_name

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	vim.notify("Could not find project root dir")
	return
end

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		-- "-Dosgi.checkConfiguration=true",
		"-Dosgi.sharedConfiguration.area=" .. shared_config_path,
		-- "-Dosgi.sharedConfiguration.area.readOnly=true",
		-- "-Dosgi.configuration.cascaded=true,
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-javaagent:" .. lombok_path,
		"-Xbootclasspath/a:" .. lombok_path,
		"-jar",
		path_to_jar,
		"-configuration",
		config_dir,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	capabilities = capabilities,

	settings = {
		java = {
			format = {
				enabled = true,
				settings = {
					profile = "GoogleStyle",
					-- source: https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml,
					url = vim.fn.stdpath("data") .. "/intellij-java-google-style.xml",
				},
			},
		},
	},
}

jdtls.start_or_attach(config)
