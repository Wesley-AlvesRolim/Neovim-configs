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
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      max_width = 40,
      render = "wrapped-compact",
      stages = "fade",
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },
}
