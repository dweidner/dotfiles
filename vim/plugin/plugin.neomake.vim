" plugin/neomake.vim
"
" @file Configuration of the Neomake linting plugin


if !dw#IsPluginLoaded('neomake') | finish | endif

augroup dwneomake
  autocmd!
augroup END

map  <silent> <special> <F6> :<C-U>:Neomake<CR>
map  <silent> <special> <F7> :<C-U>:Neomake<CR>
map! <silent> <special> <F6> <Esc>:Neomake<CR>
map! <silent> <special> <F7> <Esc>:Neomake!<CR>

autocmd dwneomake BufWritePost * Neomake
