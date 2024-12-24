return {
  -- Lua/Neovim
  {
    "folke/neodev.nvim",
    ft = "lua",
    config = function()
      require("neodev").setup()
      local opts = require("plugins.lsp.lspconfig.handlers").opts
      local is_ok, lspconfig = pcall(require, "lspconfig")
      if is_ok then
        lspconfig.lua_ls.setup({
          capabilities = opts.capabilities,
          on_attach = opts.on_attach,
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end
    end,
  },

  -- Java
  { "mfussenegger/nvim-jdtls", enabled = false },
  {
    "nvim-java/nvim-java",
    enabled = false,
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
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
  { "davidosomething/format-ts-errors.nvim" },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = require("plugins.lsp.lspconfig.local-configs").rust_analyzer,
      }
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
    },
    config = require("plugins.lsp.lspconfig").setup,
  },

  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "mikavilpas/blink-ripgrep.nvim",
      "hrsh7th/cmp-calc",
      { "saghen/blink.compat", version = "*", opts = {} },
    },
    opts = require("plugins.lsp.lspconfig.cmp"),
  },
}
