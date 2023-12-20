-- File explorer tree CTRL + B
return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle" },
  opts = require("config.nvim-tree").tree_configs,
  lazy = false,
  keys = {
    {
      "C-b",
      "<cmd>NvimTreeToggle<cr>",
      {
        mode = { "n", "i" },
        desc = "Toggle File Tree",
      },
    },
  },
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      opts = require("config.nvim-tree").icons_configs,
    },
  },
}
