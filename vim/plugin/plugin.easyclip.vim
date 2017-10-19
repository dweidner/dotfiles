" plugin/plugin.easyclip.vim

" Use custom prefix to change text and paste from register (default: s)
let g:EasyClipUseSubstituteDefaults = 0
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
nmap gS <plug>G_SubstituteToEndOfLine
xmap gs <plug>XEasyClipPaste

" Easyclip shadows 'add mark' with the 'cut' operation. Offer custom bindings.
nnoremap gm m

" Automatically turn on 'paste' mode for the duration of the paste operation
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
