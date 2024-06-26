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

- [lazy](https://github.com/folke/lazy.nvim.git)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [theme](https://github.com/sam4llis/nvim-tundra)
- [buffer-manager](https://github.com/j-morano/buffer_manager.nvim)
- [statusline](https://github.com/echasnovski/mini.statusline)
- [mini.ai](https://github.com/echasnovski/mini.ai)
- [improved-ft](https://github.com/backdround/improved-ft.nvim)
- [nvim-pqf](https://github.com/yorickpeterse/nvim-pqf)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-spell](https://github.com/f3fora/cmp-spell)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-repl-highlights](https://github.com/LiadOz/nvim-dap-repl-highlights)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [Oil](https://github.com/stevearc/oil.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [notifier.nvim](https://github.com/vigoux/notifier.nvim)
- [neodev.nvim](https://github.com/folke/neodev.nvim)
- [nvim-java](https://github.com/nvim-java/nvim-java)
- [jdtls](https://github.com/mfussenegger/nvim-jdtls)
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim)
- [typescript-tools](https://github.com/pmizio/typescript-tools.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [persistence](https://github.com/folke/persistence.nvim)
- [presence.nvim](https://github.com/andweeb/presence.nvim)

---
