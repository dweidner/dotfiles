" plugin/plugin.neosnippet.vim
"
" @file Configuration of the Neosnippet plugin


if !dw#IsLoaded('neosnippet') | finish | endif

augroup dwneosnippet
  autocmd!
augroup END

" Customize the path to the user directory containing snippet definitions
let g:neosnippet#snippets_directory = g:vimrc_home . '/snippets'

" Disable default snippets and only use our custom ones
let g:neosnippet#disable_runtime_snippets = { '_': 1 }

" Disable the use of conceal markers
let g:neosnippet#enable_conceal_markers = 0

" Expand snippets using neosnippet
imap <C-l> <Plug>(neosnippet_expand)
smap <C-l> <Plug>(neosnippet_expand)
xmap <C-l> <Plug>(neosnippet_expand_target)

" Jump to the next placeholder
imap <C-k> <Plug>(neosnippet_jump)
smap <C-k> <Plug>(neosnippet_jump)

" Insert JSDoc/PHPDoc (fix indentation)
nnoremap <silent><special> <Leader>pd O<Esc>a<C-r>=neosnippet#expand('doc')<CR><Esc>[/v]/=jA

" Remove remaining markers when leaving insert mode
autocmd dwneosnippet InsertLeave * NeoSnippetClearMarkers
