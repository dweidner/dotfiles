" plugin/plugin.investigate.vim
"
" @file Configuration of the Investigate plugin


if !dw#IsLoaded('investigate.vim') | finish | endif

let s:dash = '/Applications/Dash.app'
let s:dictionary = '/Applications/Dictionary.app'

" Use dash integration when installed on the current system
if isdirectory(s:dash) || isdirectory(expand('$HOME' . s:dash))
  let g:investigate_use_dash = 1
endif

" Look up word under cursor using the macOS dictionary
if isdirectory(s:dictionary)
  let g:investigate_use_url_for_markdown = 1
  let g:investigate_url_for_markdown = 'dict://^x'

  let g:investigate_use_url_for_gitcommit = 1
  let g:investigate_url_for_gitcommit = 'dict://^x'
endif

" Default keybindings are not added, because easyclip has a mapping for gK
" in visual mode
nnoremap gK :call investigate#Investigate('n')<CR>
vnoremap gK :call investigate#Investigate('v')<CR>
