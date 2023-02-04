call plug#begin()
"here you'll add all the plugins needed
Plug 'kevinoid/vim-jsonc'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [ 'coc-css', 'coc-html', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tabnine']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" theme
Plug 'dracula/vim'

" Rainbow brackets 
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'pangloss/vim-javascript'
Plug 'neoclide/vim-jsx-improve'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File explorer tree CTRL + B
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Files finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Tabs on nvim
Plug 'romgrk/barbar.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

