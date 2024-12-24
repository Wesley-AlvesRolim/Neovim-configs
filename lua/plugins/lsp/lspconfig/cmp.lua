---@module 'blink.cmp'
---@type blink.cmp.Config
return {
  keymap = {
    preset = "enter",
    cmdline = { preset = "super-tab" },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "calc", "ripgrep" },
    providers = {
      calc = {
        name = "calc",
        module = "blink.compat.source",
        opts = {},
      },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        ---@module "blink-ripgrep"
        ---@type blink-ripgrep.Options
        opts = {
          prefix_min_len = 3,
          context_size = 5,
          max_filesize = "1M",
          project_root_marker = { ".git", "package.json", "Cargo.toml" },
          search_casing = "--ignore-case",
          additional_rg_options = {},
          fallback_to_regex_highlighting = true,
        },
      },
    },
  },
  signature = { enabled = true },
}
