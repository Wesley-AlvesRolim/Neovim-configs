# NEOVIM

## Install Neovim

- [Download](https://github.com/neovim/neovim/releases/tag/stable)
- [Install](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source)

## Install the config

```sh
rm -rf ~/.config/nvim
git clone https://github.com/Wesley-AlvesRolim/Neovim-configs.git ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

## Dependencies

- Postgres

  ```sh
  sudo apt install postgresql-18
  ```


- Ripgrep

  ```sh
  sudo apt install ripgrep
  ```

- Java Format Style

  ```sh
  curl -i https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml -o ~/.local/share/nvim/intellij-java-google-style.xml
  ```

## Fonts

- [https://github.com/terroo/fonts](https://github.com/terroo/fonts)

## Configuration

---

### Plugins

- [lazy](https://github.com/folke/lazy.nvim)
- [persistence](https://github.com/folke/persistence.nvim)
- [hardtime](https://github.com/m4xshen/hardtime.nvim)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [Oil](https://github.com/stevearc/oil.nvim)
- [better-ts-errors](https://github.com/davidosomething/format-ts-errors.nvim)
- [blink-ripgrep](https://github.com/mikavilpas/blink-ripgrep.nvim)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [blink.compat](https://github.com/Saghen/blink.compat)
- [buffer-manager](https://github.com/j-morano/buffer_manager.nvim)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [codecompanion](https://github.com/olimorris/codecompanion.nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [dadbod-grip.nvim](https://github.com/joryeugene/dadbod-grip.nvim)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [improved-ft](https://github.com/backdround/improved-ft.nvim)
- [lazydev.nvim](https://github.com/folke/lazydev.nvim)
- [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [mason](https://github.com/mason-org/mason.nvim)
- [mini.ai](https://github.com/echasnovski/mini.ai)
- [mini.statusline](https://github.com/echasnovski/mini.statusline)
- [neo-gitmoji.nvim](https://github.com/HenriqueArtur/neo-gitmoji.nvim)
- [notify.nvim](https://github.com/rcarriga/nvim-notify)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua)
- [nvim-dap-repl-highlights](https://github.com/LiadOz/nvim-dap-repl-highlights)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-java](https://github.com/nvim-java/nvim-java)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [nvim-lsp-notify](https://github.com/mrded/nvim-lsp-notify)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [theme](https://github.com/sam4llis/nvim-tundra)
- [tmux.nvim](https://github.com/aserowy/tmux.nvim)

---
