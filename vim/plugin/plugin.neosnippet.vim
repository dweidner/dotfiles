" plugin/plugin.neosnippet.vim
"
" @file Configuration of the Neosnippet plugin


if !dw#IsLoaded('neosnippet') | finish | endif

augroup dwneosnippet
  autocmd!
augroup END

" Customize the path to the user directory containing snippet definitions
let g:neosnippet#snippets_directory = g:vim_home . '/snippets'

" Disable default snippets and only use our custom ones
let g:neosnippet#disable_runtime_snippets = { '_': 1 }

" Disable the use of conceal markers
let g:neosnippet#enable_conceal_markers = 0

" Expand snippets using neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Remove remaining markers when leaving insert mode
autocmd dwneosnippet InsertLeave * NeoSnippetClearMarkers
