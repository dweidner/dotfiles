" plugin/plugin.ultisnips.vim

" Ignore snipmate snippets. Only use my custom snippets.
let g:UltiSnipsEnableSnipMate = 0

" Directory of private snippet definition files.
" Note: Directories named `snippets` are reserved for SnipMate.
let g:UltiSnipsSnippetsDir = g:vim_home . '/usnippets'

" Load snippets only from the private directory.
let g:UltiSnipsSnippetDirectories = [ g:UltiSnipsSnippetsDir ]

" Custom keybindings to expand snippets (avoids collision with YCM)
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
