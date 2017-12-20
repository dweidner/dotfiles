" after/ftplugin/fzf.vim
"
" @file Configuration applied in FZF windows


" Hide the status line
setlocal laststatus=0
setlocal noshowmode
setlocal noruler
setlocal signcolumn="no"

" Reset the settings when leaving the buffer
autocmd vimrc BufLeave <buffer>
  \ setlocal laststatus=2 |
  \ setlocal showmode |
  \ setlocal signcolumn="yes" |
  \ setlocal ruler |
