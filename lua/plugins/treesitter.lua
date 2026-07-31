return {
  "romus204/tree-sitter-manager.nvim",
  event = "BufReadPre",
  dependencies = {
    -- Auto tag
    "windwp/nvim-ts-autotag",
    -- Comment
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local configs = {
      auto_install = true,

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

      highlight = true,
      nohighlight = { "html", "css", "scss" },
    }
    require("tree-sitter-manager").setup(configs)
  end,
}
