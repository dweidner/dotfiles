" plugin/easyclip.plugin.vim

" Save and share clipboard among vim instances
let g:EasyClipShareYanks = 1
let g:EasyClipShareYanksDirectory = glob(expand(g:vim_home_dir . '/tmp'))

" Enable auto formatting when pasting text
let g:EasyClipAutoFormat = 1

" Toggle between auto formatting after a paste operation
nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" Use custom binding to change text and paste from register
let g:EasyClipUseSubstituteDefaults = 0
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
nmap gS <plug>G_SubstituteToEndOfLine
xmap gs <plug>XEasyClipPaste

" Easyclip shadows 'add mark' with the 'cut' operation. Offer a custom binding
nnoremap gm m

" Automatically turn on 'paste' mode for the duration of the paste operation
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste