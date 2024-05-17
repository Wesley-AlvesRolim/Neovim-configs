local autocmd = vim.api.nvim_create_autocmd

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

local function open_oil_tree_on_startup(data)
  local is_not_a_directory = vim.fn.isdirectory(data.file) == 0
  local is_a_file = is_not_a_directory and data.file ~= ""
  if is_a_file then
    return
  end

  local dir = data.file
  if dir == "" then
    local output = vim.fn.system("echo $PWD")
    dir = string.gsub(output, "\n", "")
  end

  vim.cmd.cd(dir)
  vim.cmd.e(".")
end

autocmd({ "VimEnter" }, { callback = open_oil_tree_on_startup })

return {
  "stevearc/oil.nvim",
  event = "VimEnter",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      opts = {
        override = custom_icons,
        default = true,
      },
    },
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    float = {
      padding = 2,
      max_width = 120,
      max_height = 75,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      override = function(conf)
        return conf
      end,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set("n", "<leader>e", require("oil").toggle_float, {
      desc = "Toggle File Tree",
    })
  end,
}
