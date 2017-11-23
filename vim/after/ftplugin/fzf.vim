" after/ftplugin/fzf.vim
"
" @file Configuration applied in FZF windows


" Hide the status line
set laststatus=0
set noshowmode
set noruler

" Reset the settings when leaving the buffer
autocmd vimrc BufLeave <buffer>
  \ set laststatus=2 |
  \ set showmode |
  \ set ruler
