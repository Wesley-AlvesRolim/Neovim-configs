require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = {"c", "lua", "vim", "help", "java", "typescript", "yaml", "json", "python", "regex", "rust",
                        "tsx"},
    sync_install = false,
    auto_install = true,
    ignore_install = {"javascript", "scss"},

    indent = {
        enable = true
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>'
        }
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
})