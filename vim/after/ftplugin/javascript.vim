" after/ftplugin/javascript.vim

" Quickly move between functions
" @see <https://github.com/romainl/dotvim>
nnoremap <silent> <buffer> ]] :call dw#Jump('/function')<CR>
nnoremap <silent> <buffer> [[ :call dw#Jump('?function')<CR>

" Custom keybinding to add documentation
nnoremap <silent> <buffer> <Leader>pd :JsDoc<CR>

" Lint javascript files using eslint and syntastic
let s:eslint_exec = dwproject#GetNodeModulePath('eslint')

if executable(s:eslint_exec)
  let b:syntastic_checkers = ["eslint"]
  let b:syntastic_javascript_eslint_exec = s:eslint_exec
endif
