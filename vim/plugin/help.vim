" plugin/help.vim

" Create a new autocmd group for the help utilities
augroup dothelp
  au!
augroup end

" Close help window with <q>
au dothelp FileType help nn <silent><buffer> q :q<CR>
au dothelp FileType help nn <silent><buffer> Q :q<CR>

