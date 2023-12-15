local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notify("JDTLS not found, install with `:LspInstall jdtls`")
	return
end

local opts = require("plugins.lsp.lspconfig.handlers").opts

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	vim.notify("Could not find project root dir")
	return
end

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local shared_config_path = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins/"
local lombok_path = jdtls_path .. "/lombok.jar"
local path_to_jar = vim.fn.glob(path_to_plugins .. "org.eclipse.equinox.launcher_*.jar")

local cache_dir = vim.fs.normalize("~/.cache/jdtls")
local config_dir = cache_dir .. "/config"
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = cache_dir .. "/workspace/" .. project_name

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
	cmd = {
		"java",
		"-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044",
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
		-- shared_config_path,
		"-data",
		workspace_dir,
	},

	root_dir = root_dir,
	capabilities = opts.capabilities,
	on_attach = function()
		jdtls.setup.add_commands()
		opts.on_attach()
	end,

	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "JavaSE-17",
						path = vim.fs.normalize("~/.asdf/installs/java/adoptopenjdk-17.0.8+7/"),
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			import = {
				gradle = {
					enabled = true,
					home = "/opt/gradle/gradle-7.6/bin/gradle",
				},
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				settings = {
					-- source: https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml,
					url = vim.fn.stdpath("data") .. "/intellij-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
			signatureHelp = { enabled = true },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			contentProvider = { preferred = "fernflower" },
			extendedClientCapabilities = extendedClientCapabilities,
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
		},

		flags = {
			allow_incremental_sync = true,
		},

		init_options = {
			bundles = {},
		},
	},
}

jdtls.start_or_attach(config)
