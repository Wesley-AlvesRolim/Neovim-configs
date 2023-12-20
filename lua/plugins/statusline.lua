return {
  {
    "echasnovski/mini.statusline",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
    event = "VeryLazy",
    config = require("config.statusline").setup,
  },
}
