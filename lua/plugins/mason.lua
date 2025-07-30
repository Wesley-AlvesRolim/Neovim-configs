return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonUpdate" },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
  },
}
