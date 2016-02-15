" plugin/ultisnips.plugin.vim

" Load custom snippets from the following directory.
" Note: Directories named `snippets` are reserved for SnipMate
let g:UltiSnipsSnippetDirectories = [ g:vim_home_dir . '/usnippets' ]

" Ignore snipmate snippets. I only want to provide my custom snippets.
let g:UltiSnipsEnableSnipMate = 0
