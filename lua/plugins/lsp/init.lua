return {
  -- Lua/Neovim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },

  -- Java
  { "nvim-java/nvim-java" },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        tools = {},
        server = {
          on_attach = require("plugins.lsp.lspconfig.local-configs.init").rust_analyzer.on_attach,
          default_settings = require("plugins.lsp.lspconfig.local-configs.init").rust_analyzer.settings,
        },
        dap = {},
      }
    end,
  },

  -- TS
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      local lsp_opts = require("plugins.lsp.lspconfig.handlers").opts
      require("typescript-tools").setup({
        on_attach = lsp_opts.on_attach,
        settings = {
          separate_diagnostic_server = true,
          expose_as_code_action = "all",
        },
      })
    end,
  },
  {
    "davidosomething/format-ts-errors.nvim",
    opts = {
      add_markdown = true,
      start_indent_level = 0,
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason.nvim",
      {
        "mrded/nvim-lsp-notify",
        dependencies = { "rcarriga/nvim-notify" },
        opts = {},
      },
    },
    config = require("plugins.lsp.lspconfig").setup,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "mikavilpas/blink-ripgrep.nvim",
      "hrsh7th/cmp-calc",
      { "saghen/blink.compat", version = "*", opts = {} },
      "joryeugene/dadbod-grip.nvim",
    },
    opts = require("plugins.lsp.lspconfig.cmp"),
  },
}
