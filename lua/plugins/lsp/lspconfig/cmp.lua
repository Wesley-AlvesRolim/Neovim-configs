local cmp = require("cmp")

local configs = {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      local icons = require("config.icons").kinds
      vim_item.kind = string.format("%s", icons[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        codeium = "[AI]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        path = "[Path]",
        emoji = "[Emoji]",
        neorg = "[Neorg]",
        spell = "[Spell]",
      })[entry.source.name]
      return vim_item
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<C-n>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),

  sources = cmp.config.sources({
    {
      name = "codeium",
      group_index = 1,
      priority = 100,
    },
    {
      name = "nvim_lsp",
      priority = 100,
      group_index = 1,
    },
    {
      name = "luasnip",
      priority = 90,
      group_index = 2,
    },
    {
      name = "buffer",
      priority = 80,
      autocomplete = false,
      group_index = 3,
    },
    {
      name = "path",
      priority = 80,
      group_index = 3,
    },
    {
      name = "spell",
      priority = 50,
      group_index = 3,
    },
    {
      name = "calc",
      priority = 50,
      group_index = 3,
    },
    { name = "emoji" },
    { name = "nvim_lsp_signature_help" },
  }),
}

cmp.setup(configs)

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
