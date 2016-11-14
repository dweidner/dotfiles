" after/ftplugin/php.vim

" Use syntax completion in insert mode
setlocal omnifunc=phpcomplete#CompletePHP

" Syntax highlighting in phpdoc blocks
hi! def link phpDocTags  phpDefine
hi! def link phpDocParam phpType

" Generate PHPDoc Block and ensure UltiSnips is already loaded
function! s:GeneratePHPDocBlock()
  if !exists('b:did_autoload_ultisnips')
    call plug#load('ultisnips')
  endif
  call pdv#DocumentWithSnip()
endfunction

" Custom keybindings to generate PHPDoc blocks
nnoremap <silent> <buffer> <Leader>pd :call <sid>GeneratePHPDocBlock()<CR>

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
