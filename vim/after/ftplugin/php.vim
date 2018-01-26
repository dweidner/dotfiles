" after/ftplugin/php.vim
"
" @file Configuration applied for PHP files


" Change the comment string used (default: /* %s */)
setlocal commentstring=//\ %s

" A list of default makers to use for php files
let b:neomake_enabled_makers = ['php']

" Use the PHP Code Sniffer only if the current project has a local
" ruleset defined
let s:phpcs_ruleset = dw#project#FindFile(['phpcs.xml', 'phpcs.xml.dist'])

if filereadable(s:phpcs_ruleset)
  let b:neomake_enabled_makers += ['phpcs']
endif

" Use the PHP Mess Detector only if the current project has a local
" ruleset defined
let s:phpmd_ruleset = dw#project#FindFile(['phpmd.xml', 'phpmd.xml.dist'])

if filereadable(s:phpmd_ruleset)
  let b:neomake_enabled_makers += ['phpmd']
endif

" Auto format the current php file using the PHP code sniffer with its
" standard configuration
if executable('phpcbf')
  nnoremap <buffer><silent><special> <Leader>= :silent %!phpcbf<CR>:redraw!<CR>
endif
