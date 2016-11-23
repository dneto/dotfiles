call plug#begin('~/.config/nvim/plugged')
"Vim Improvements
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
"Languages Specific
Plug 'fatih/vim-go'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'daviesjamie/vim-base16-lightline'
"Visual
Plug 'chriskempson/base16-vim'
call plug#end()
