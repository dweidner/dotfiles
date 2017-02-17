" plugin/plugin.easyclip.vim

" Save and share clipboard among vim instances
let g:EasyClipShareYanks = 1
let g:EasyClipShareYanksDirectory = g:vim_home . '/tmp'

" Enable auto formatting when pasting text
let g:EasyClipAutoFormat = 1

" Toggle between auto formatting after a paste operation
nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" Go forward/backward in the yank buffer (default: <C-p>, <C-n>)
let g:EasyClipUsePasteToggleDefaults = 0
nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-d> <plug>EasyClipSwapPasteBackwards

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
