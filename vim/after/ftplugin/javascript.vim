" after/ftplugin/javascript.vim
"
" @file Configuration applied for javascript files


" All linters are disabled by default
let b:neomake_enabled_makers = []

" Use eslint if the current project has a local configuration file
let s:eslintrc = dw#project#FindFile(['.eslintrc.yml', '.eslintrc.json'])

if filereadable(s:eslintrc)
  let b:neomake_enabled_makers += ['eslint']
  let b:neomake_javascript_eslint_exe = dw#node#FindPackage('eslint')
endif

" Auto format the current file using eslint
if executable('eslint')
  nnoremap <silent><special><buffer>
        \ <Leader>=
        \ :silent !eslint --fix -- %<CR>:checktime<CR>
endif
