let g:lightline = { 
      \ 'colorscheme': 'base16',
      \ 'active':{
      \    'left': [ ['mode', 'paste', 'fugitive'],['readonly','filename','modified']]
      \ },
      \ 'component': {
      \     'readonly': '%{&readonly?"\ue0a2":""}',
      \ },
      \ 'component_function': {
      \	    'fugitive': 'LightLineFugitive'
      \ }, 
      \ 'separator': { 'left': "", 'right': "" },
      \ 'subseparator': { 'left': "|", 'right': "|" }
      \ }

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ' '  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction
