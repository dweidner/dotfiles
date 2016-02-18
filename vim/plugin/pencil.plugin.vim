" plugin/pencil.plugin.vim

" Use soft line wrap by default
let g:pencil#wrapModeDefault = 'soft'

" Create a custom autocmd group for the vim-pencil plugin
augroup dotpencil
  au!
augroup end

" Load vim pencil for specific filetypes only
au dotpencil FileType markdown call pencil#init()
