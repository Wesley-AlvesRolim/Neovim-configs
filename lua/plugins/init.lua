return {
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
      disabled_filetypes = {
        ["lazy"] = true,
        ["mason"] = true,
        ["buffer_manager"] = true,
        ["help"] = true,
        ["qf"] = true,
        ["lspinfo"] = true,
        ["oil"] = true,
        ["grip.*"] = true,
        ["sql"] = true,
      },
    },
  },
}
