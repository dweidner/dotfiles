" after/ftplugin/php.vim

" Use syntax completion in insert mode
setlocal omnifunc=phpcomplete#CompletePHP

" Use PHP CodeSniffer for Drupal and WordPress projects
if executable('phpcs') && exists("g:plugs['syntastic']")
  if dwproject#IsDrupalProject()
    let g:syntastic_php_checkers = ['php', 'phpcs']
    let g:syntastic_php_phpcs_args = '--report=csv --standard Drupal --extensions=php,module,inc.install,test,profile,theme'
  elseif dwproject#IsWordPressProject()
    let g:syntastic_php_checkers = ['php', 'phpcs']
    let g:syntastic_php_phpcs_args = '--report=csv --standard WordPress'
  else
    let g:syntastic_php_checkers = ['php']
  endif
endif
