" after/ftplugin/php.vim
"
" @file Configuration applied for PHP files


" Change the comment string used (default: /* %s */)
setlocal commentstring=//\ %s

" A list of default makers to use for php files
let b:neomake_enabled_makers = ['php', 'phpmd']

" Use the PHP Code Sniffer only if the current project has a local
" ruleset defined
let s:ruleset = dw#FindProjectFile('phpcs.xml.dist')

if filereadable(s:ruleset)
  let b:neomake_enabled_makers += ['phpcs']
endif

" Auto format the current php file using the PHP code sniffer with its
" standard configuration
if executable('phpcbf')
  nnoremap <buffer><silent><special> <Leader>= :silent %!phpcbf<CR>:redraw!<CR>
endif
