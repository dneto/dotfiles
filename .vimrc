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
