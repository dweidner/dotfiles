" plugin/plugin.ack.vim
"
" @file Configuration of the Ack file grepper


" Use grepprg if customized by the user
if &grepprg !~ '^grep' | let g:ackprg=&grepprg | endif
