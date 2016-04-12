" config/help.vim

" Close help window with <q>
augroup dothelp
  au!
  au FileType help nn <silent><buffer> q :q<CR>
  au FileType help nn <silent><buffer> Q :q<CR>
augroup end
