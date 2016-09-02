" plugin/plugin.investigate.vim

" Use dash if available on the current system
let g:investigate_use_dash = has('mac')

" Custom keybinding to open documentation pages
nnoremap <leader>K :call investigate#Investigate('n')<CR>
vnoremap <leader>K :call investigate#Investigate('v')<CR>
