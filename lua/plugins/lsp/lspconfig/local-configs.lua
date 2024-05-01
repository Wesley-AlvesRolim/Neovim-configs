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

-- M.tsserver = {
--   capabilities = lsp_opts.capabilities,
--   on_attach = lsp_opts.on_attach,
--   init_options = {
--     maxTsServerMemory = "1024",
--   },
-- }

M.rust_analyzer = {
  capabilities = lsp_opts.capabilities,
  on_attach = lsp_opts.on_attach,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
      cargo = {
        allFeatures = true,
      },
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

return M
