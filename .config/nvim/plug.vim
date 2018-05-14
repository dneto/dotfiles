call plug#begin('~/.config/nvim/plugged')
"Vim Improvements
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'taohex/lightline-buffer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
"Languages Specific
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'vim-ruby/vim-ruby'
"Visual
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
call plug#end()
