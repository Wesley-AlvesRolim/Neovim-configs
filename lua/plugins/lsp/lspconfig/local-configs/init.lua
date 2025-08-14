local M = {}
local util = require("lspconfig.util")
local lsp_opts = require("plugins.lsp.lspconfig.handlers").opts

M.tailwindcss = {
  capabilities = lsp_opts.capabilities,
  on_attach = lsp_opts.on_attach,
  root_dir = function(fname)
    return util.root_pattern("tailwind.config.*")(fname)
      and util.find_node_modules_ancestor(fname)
      and util.find_package_json_ancestor(fname)
  end,
}

M.ts_ls = {
  capabilities = lsp_opts.capabilities,
  on_attach = lsp_opts.on_attach,
  -- init_options = {
  --   maxTsServerMemory = "1024",
  -- },
  handlers = {
    ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      if result.diagnostics == nil then
        return
      end

      -- ignore some tsserver diagnostics
      local idx = 1
      while idx <= #result.diagnostics do
        local entry = result.diagnostics[idx]

        local formatter = require("format-ts-errors")[entry.code]
        entry.message = formatter and formatter(entry.message) or entry.message

        -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
        if entry.code == 80001 then
          -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
          table.remove(result.diagnostics, idx)
        else
          idx = idx + 1
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
}

M.rust_analyzer = {
  capabilities = lsp_opts.capabilities,
  on_attach = lsp_opts.on_attach,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cachePriming = { enable = false },
      cargo = { allFeatures = true },
      completion = { limit = 5 },
      inlayHints = {
        enabled = false,
        expressionAdjustmentHints = { enable = false },
        bindingModeHints = { enable = false },
        chainingHints = { enable = false },
        closingBraceHints = { enable = false },
        closureCaptureHints = { enable = false },
      },
      lens = {
        enable = true,
        methodReferences = true,
        references = true,
        implementations = false,
      },
    },
  },
}

M.jdtls = {
  settings = {
    java = {
      configuration = {},
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      import = {
        gradle = {
          enabled = true,
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
          -- source: https://raw.githubusercontent.com/palantir/palantir-java-format/refs/heads/develop/.baseline/idea/intellij-java-palantir-style.xml
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

return M
