" plugin/plugin.cycle.vim
"
" @file Configuration of the Cycle plugin


if !dw#IsInstalled('tabular') | finish | endif

xnoremap <silent> ga/ :Tabularize /\/\/<CR>
xnoremap <silent> ga" :Tabularize /"<CR>

xnoremap <silent> ga= :Tabularize /=<CR>
xnoremap <silent> ga> :Tabularize /=>/<CR>
xnoremap <silent> ga: :Tabularize /:\zs/l0l1<CR>
