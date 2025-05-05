---@module 'blink.cmp'
---@type blink.cmp.Config
return {
  keymap = {
    preset = "enter",
  },
  cmdline = {
    keymap = {
      preset = "super-tab",
    },
  },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "copilot", "lsp", "path", "snippets", "buffer", "calc", "ripgrep" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        max_items = 1,
        score_offset = 140,
        async = true,
      },
      lsp = {
        enabled = true,
        name = "lsp",
        module = "blink.cmp.sources.lsp",
        score_offset = 120,
      },
      path = {
        name = "path",
        module = "blink.cmp.sources.path",
        score_offset = 100,
      },
      snippets = {
        enabled = true,
        name = "snippets",
        module = "blink.cmp.sources.snippets",
        max_items = 5,
        min_keyword_length = 2,
        score_offset = 80,
      },
      buffer = {
        enabled = true,
        name = "buffer",
        module = "blink.cmp.sources.buffer",
        max_items = 3,
        min_keyword_length = 2,
        score_offset = 60,
      },
      calc = {
        name = "calc",
        module = "blink.compat.source",
        opts = {},
        score_offset = 40,
      },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        max_items = 3,
        score_offset = 20,
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
