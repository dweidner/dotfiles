" plugin/plugin.easyclip.vim
"
" @file Configuration of the Easyclip Plugin


" Use custom prefix to change text and paste from register (default: s)
let g:EasyClipUseSubstituteDefaults = 0
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste

" Easyclip shadows 'add mark' with the 'cut' operation. Offer custom bindings.
nnoremap gm m
