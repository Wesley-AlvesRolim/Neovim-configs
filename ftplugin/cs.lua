local opts = require("plugins.lsp.lspconfig.handlers").opts

local omnisharp_bin = vim.fn.stdpath("data") .. "/mason/bin/omnisharp-mono"

require("lspconfig")["omnisharp_mono"].setup({
  cmd = { omnisharp_bin },
  capabilities = opts.capabilities,
  on_attach = function(client)
    opts.on_attach()
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
