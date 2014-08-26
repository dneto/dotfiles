"Vundle Configurations
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'junegunn/seoul256.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'mhinz/vim-signify'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tfnico/vim-gradle'
Plugin 'tpope/vim-surround'
Plugin 'derekwyatt/vim-scala'
Plugin 'gregsexton/gitv'

call vundle#end()

syntax on
filetype plugin indent on

"Visual configurations
set laststatus=2
colorscheme gruvbox
set background=dark
set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
set guioptions=-M
set guioptions=-t
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

"Neocomplete
let g:neocomplete#enable_at_startup=1

"Mapping
map <C-n> :NERDTreeToggle<cr>
map <C-Tab> :bn<cr>
