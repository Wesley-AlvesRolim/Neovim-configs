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
  { "mfussenegger/nvim-jdtls" },
  {
    "nvim-java/nvim-java",
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
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      local lsp_opts = require("plugins.lsp.lspconfig.handlers").opts
      require("typescript-tools").setup({
        on_attach = lsp_opts.on_attach,
        settings = {
          separate_diagnostic_server = false,
          publish_diagnostic_on = "insert_leave",
          expose_as_code_action = "all",
          tsserver_max_memory = 512 + 512 + 256,
        },
      })
    end,
  },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
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
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
    },
    config = require("plugins.lsp.lspconfig").setup,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- CMP Sources
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
    },
  },
}
