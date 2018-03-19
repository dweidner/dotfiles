" after/ftplugin/scss.vim
"
" @file Configuration applied for SASS files


" All linters are disabled by default
let b:neomake_enabled_makers = []

" Use sasslint if the current project has a local configuration file
let s:sasslintrc = dw#project#FindFile(['.sasslintrc', '.sass-lint.yml', '.sass-lint.json'])

if filereadable(s:sasslintrc)
  let b:neomake_enabled_makers += ['sasslint']
  let b:neomake_scss_sasslint_exe = dw#node#FindPackage('sass-lint')
  let b:neomake_scss_sasslint_args = [
        \ '--no-exit',
        \ '--verbose',
        \ '--format', 'compact',
        \ '--config', s:sasslintrc,
        \ ]
endif

" Fix highlighting of some properties (e.g.: vertical-align, box-shadow)
setlocal iskeyword+=-
