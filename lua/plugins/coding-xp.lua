return {
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = {
          "*",
          "!help",
          typescriptreact = { mode = "background", names = true },
        },
        user_default_options = {
          mode = "virtualtext",
          names = false,
          css = true,
          tailwind = true,
        },
      })
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "romus204/tree-sitter-manager.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local opts = {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
      require("Comment").setup(opts)
    end,
  },

  -- Improve F T motions
  {
    "backdround/improved-ft.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      use_default_mappings = true,
    },
  },

  {
    "echasnovski/mini.ai",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  -- Auto close ( [ {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },

  -- Tmux integration
  {
    "aserowy/tmux.nvim",
    event = "VeryLazy",
    opts = {
      resize = {
        enable_default_keybindings = false,
        resize_step_x = 1,
        resize_step_y = 1,
      },
      copy_sync = {
        sync_clipboard = true,
      },
    },
  },

  -- Gitmoji
  {
    "HenriqueArtur/neo-gitmoji.nvim",
    event = "BufEnter",
    opts = {},
  },

  -- DB
  {
    "joryeugene/dadbod-grip.nvim",
    event = "VeryLazy",
    dependencies = { "saghen/blink.cmp" },
    config = function(_, _)
      require("dadbod-grip").setup({
        completion = false,
        connections_path = vim.fs.normalize("~/.config/.grip/connections.json"),
        keymaps = {
          qpad_execute = "<F5>",
        },
      })
    end,
  },
}
