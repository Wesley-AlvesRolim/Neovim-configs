local custom_icons = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh",
  },
  vue = {
    icon = "",
    color = "#00dc82",
    cterm_color = "65",
    name = "Vue",
  },
  ["playwright.config.ts"] = {
    icon = "󰴂",
    color = "#45ba4b",
    cterm_color = "65",
    name = "playwright",
  },
}

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
        mode = { "n" },
        desc = "Toggle File Tree",
      },
    },
  },
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      opts = {
        override = custom_icons,
        default = true,
      },
    },
  },
}
