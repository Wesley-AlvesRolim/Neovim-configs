local icons = require("config.icons")

return {
  -- Theme
  {
    "sam4llis/nvim-tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-tundra").setup()
      vim.cmd.colorscheme("tundra")
    end,
  },

  -- Buffer
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = require("config.buffer-manager").keys,
    config = function()
      local bm = require("buffer_manager")
      local configs = require("config.buffer-manager")
      bm.setup(configs.opts)
      configs.keymap()
    end,
  },

  -- Git
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, config = require("config.git-signs").setup },

  -- Notifier
  {
    "vigoux/notifier.nvim",
    event = "VeryLazy",
    config = function()
      require("notifier").setup({
        components = { "nvim", "lsp", "mason", "treesitter" },
        component_name_recall = true,
      })
    end,
  },

  -- QuickFix List
  {
    "yorickpeterse/nvim-pqf",
    event = { "VeryLazy" },
    opts = {
      signs = {
        error = { hl = icons.signs[1].name, text = icons.signs[1].text },
        warning = { hl = icons.signs[2].name, text = icons.signs[2].text },
        info = { hl = icons.signs[3].name, text = icons.signs[3].text },
        hint = { hl = icons.signs[4].name, text = icons.signs[4].text },
      },
    },
  },
}
