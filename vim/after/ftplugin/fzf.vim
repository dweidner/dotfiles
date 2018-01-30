" after/ftplugin/fzf.vim
"
" @file Configuration applied in FZF windows


" Hide the status line
setlocal nohlsearch
setlocal laststatus=0
setlocal noruler
setlocal noshowmode
setlocal signcolumn="no"

" Reset the settings when leaving the buffer
autocmd vimrc BufLeave <buffer>
      \ setlocal hlsearch |
      \ setlocal laststatus=2 |
      \ setlocal ruler |
      \ setlocal showmode |
      \ setlocal signcolumn="yes"
