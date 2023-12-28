return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
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

  -- Code Copilot
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {},
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  -- Discord
  {
    "andweeb/presence.nvim",
    cmd = "Presence",
    lazy = true,
    opts = {
      neovim_image_text = "The One True Text Editor",
      main_image = "neovim",
      log_level = nil,
      debounce_timeout = 10,
      enable_line_number = false,
      blacklist = {},
      buttons = true,
      file_assets = {},
      show_time = false,

      editing_text = "Editing %s",
      file_explorer_text = "",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
    },
  },

  -- Good use of neovim
  {
    "m4xshen/hardtime.nvim",
    event = { "BufEnter" },
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = { "NvimTree", "lazy", "mason", "buffer_manager", "help" },
    },
  },
}
