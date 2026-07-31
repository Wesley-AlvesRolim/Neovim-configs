return {
  {
    "olimorris/codecompanion.nvim",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua", "java" },
    event = "BufEnter",
    version = "^18.0.0",
    opts = {
      interactions = {
        chat = {
          adapter = {
            name = "copilot",
            model = "gpt-4.1",
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "romus204/tree-sitter-manager.nvim",
    },
  },
}
