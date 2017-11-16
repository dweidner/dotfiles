" plugin/plugin.bbye.vim
"
" @file Configuration of the Bbye plugin


" Close the current buffer but preserve the window layout if possible
if dw#IsLoaded('vim-bbye')
  nnoremap <silent><special> <Leader>x :<C-U>Bdelete<CR>
else
  nnoremap <silent><special> <Leader>x :<C-U>lclose<CR>:bdelete<CR>
endif
