return {
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

  -- Session persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },

  -- Good use of neovim
  {
    "m4xshen/hardtime.nvim",
    event = { "BufEnter" },
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = { "NvimTree", "lazy", "mason", "buffer_manager", "help", "qf", "lspinfo", "oil" },
    },
  },
}
