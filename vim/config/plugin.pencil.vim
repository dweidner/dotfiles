" config/plugin.pencil.vim

" Use soft line wrap by default
let g:pencil#wrapModeDefault = 'soft'

" Load vim pencil for specific filetypes only
autocmd vimrc FileType markdown call pencil#init()
