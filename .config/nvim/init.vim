scriptencoding utf-8
set mouse=a
set encoding=utf-8
set number
set noshowmode
set expandtab
set sw=4
set ts=4

set laststatus=2

so ~/.config/nvim/plug.vim
so ~/.config/nvim/lightline.vim

let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_puppet_enabled_makers = ['puppet-lint']
call neomake#configure#automake('w')

let mapleader=","
let g:deoplete#enable_at_startup = 1
map <Leader>n :NERDTreeToggle<cr>

set termguicolors
colorscheme spacegray

au BufWritePost * Neomake

"Vim-Go Configs
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

"Startify Configs

let g:startify_bookmarks = [
            \ {'c': '~/.config/nvim/init.vim'},
            \ {'p': '~/.config/nvim/plug.vim'},
            \ {'z': '~/.zshrc'},
            \ ]

let g:startify_commands = [
            \ {'u': ['Update Plugins', 'PlugUpdate']}
            \ ]
