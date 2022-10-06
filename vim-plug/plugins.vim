call plug#begin()

" here you'll add all the plugins needed
Plug 'kevinoid/vim-jsonc'

"Plug 'neoclide/coc.nvim', {'branch': 'release'} " this is for auto complete, prettier and tslinting

"let g:coc_global_extensions = [ 'coc-css', 'coc-html', 'coc-json', 'coc-eslint']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" theme
Plug 'dracula/vim'

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" File explorer tree CTRL + B
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Files finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" File tabs/buffers

call plug#end()

