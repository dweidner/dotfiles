" plugin/plugin.investigate.vim

" Open macOS specific application using vim investigate
if has('mac')

  " Use dash on macOS
  let g:investigate_use_dash = 1

  " Look up word in macOS dictionary when editing markdown files
  let g:investigate_use_url_for_markdown = 1
  let g:investigate_url_for_markdown = 'dict://^x'

  " Look up word in macOS dictionary when editing markdown files
  let g:investigate_use_url_for_gitcommit = 1
  let g:investigate_url_for_gitcommit = 'dict://^x'

endif

" Custom keybinding to open documentation pages
nnoremap <leader>K :call investigate#Investigate('n')<CR>
vnoremap <leader>K :call investigate#Investigate('v')<CR>

" Rebind normal mode `K` only if `&keywordprg` is different to
" its default value `man -s`
function! s:RunExprIfDefault(cmd)
  if &keywordprg =~# '^man'
    return a:cmd
  endif
  return 'K'
endfunction

nnoremap <expr> K <SID>RunExprIfDefault(':call investigate#Investigate("n")<CR>')
