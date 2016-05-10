" after/ftplugin/scss.vim

" Lint sass files using stylelint
let s:stylelint_path = util#GetNodeModulePath('stylelint')
if !empty(s:stylelint_path)
  let b:syntastic_checkers = ["sass", "stylelint"]
  let b:syntastic_css_stylelint_exec = s:stylelint_path
  let b:syntastic_scss_stylelint_exec = s:stylelint_path
endif
