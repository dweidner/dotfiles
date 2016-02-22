" plugin/ultisnips.plugin.vim

" Directory of private snippet definition files.
" Note: Directories named `snippets` are reserved for SnipMate.
let g:UltiSnipsSnippetsDir = g:vim_home_dir . '/usnippets'

" Load snippets only from the private directory.
let g:UltiSnipsSnippetDirectories = [ g:UltiSnipsSnippetsDir ]

" Ignore snipmate snippets. I only want to provide my custom snippets.
let g:UltiSnipsEnableSnipMate = 0
