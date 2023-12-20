local M = {}
local util = require("lspconfig.util")

M.tailwindcss = {
  root_dir = function(fname)
    return util.root_pattern("tailwind.config.*")(fname)
      and util.find_node_modules_ancestor(fname)
      and util.find_package_json_ancestor(fname)
  end,
}

M.tsserver = {
  init_options = {
    maxTsServerMemory = "1024",
  },
}

M.rust_analyzer = {
  capabilities = require("plugins.lsp.lspconfig.handlers").opts.capabilities,
  on_attach = function(_, bufnr)
    require("plugins.lsp.lspconfig.handlers").on_attach(bufnr)
  end,
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
