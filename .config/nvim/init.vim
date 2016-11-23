
set encoding=utf-8
scriptencoding utf-8
set noshowmode

so ~/.config/nvim/plug.vim

set laststatus=2
so ~/.config/nvim/lightline.vim


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"Dynamic vim colorscheme script
if filereadable(expand("~/.config/nvim/vim_background.vim"))
  let base16colorspace=256
  source ~/.config/nvim/vim_background.vim
endif

set number
let g:neomake_open_list = 2
let g:neomake_go_enabled_makers = ['go', 'govet', 'golint']
"let g:neomake_error_sign = {'text': '●','texthl': 'ErrorMsg'}

let mapleader=","
let g:deoplete#enable_at_startup = 1
map <Leader>n :NERDTreeToggle<cr>

au BufWritePost * Neomake

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
