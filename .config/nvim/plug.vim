call plug#begin('~/.config/nvim/plugged')
"Vim Improvements
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'

"Languages Specific
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'
Plug 'vim-ruby/vim-ruby'

"ColorSchemes
Plug 'ajh17/spacegray.vim'

Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
call plug#end()
