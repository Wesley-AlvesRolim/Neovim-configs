return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  {
    "giuxtaposition/blink-cmp-copilot",
    event = "InsertEnter",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "BufEnter",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
  },
}
