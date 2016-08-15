" after/ftplugin/scss.vim

" Fix highlighting for properties that use hyphens
" @see <https://github.com/cakebaker/scss-syntax.vim>
setlocal iskeyword+=-

" Lint sass files using stylelint
let s:stylelint_path = dw#GetNodeModulePath('stylelint')
if !empty(s:stylelint_path)
  let b:syntastic_checkers = ["sass", "stylelint"]
  let b:syntastic_css_stylelint_exec = s:stylelint_path
  let b:syntastic_scss_stylelint_exec = s:stylelint_path
endif
