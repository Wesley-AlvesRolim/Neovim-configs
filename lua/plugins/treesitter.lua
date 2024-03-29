return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  dependencies = {
    -- Auto tag
    "windwp/nvim-ts-autotag",
    -- Comment
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local configs = {
      sync_install = false,
      auto_install = true,
      ignore_install = { "javascript", "css", "scss" },

      autotag = {
        enable = true,
      },

      context_commentstring = {
        enable_autocmd = false,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },

      highlight = {
        enable = true,
        disable = { "html", "css", "scss" },
        additional_vim_regex_highlighting = false,
      },
    }
    require("nvim-treesitter.configs").setup(configs)
  end,
}
