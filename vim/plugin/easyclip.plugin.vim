" plugin/easyclip.plugin.vim

" Save and share clipboard among vim instances
" let g:EasyClipShareYanks = 1
" let g:EasyClipShareYanksDirectory = glob(expand(g:vim_home_dir . '/tmp'))

" Enable auto formatting when pasting text
let g:EasyClipAutoFormat = 1

" Toggle between auto formatting after a paste operation
nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" Use custom binding to change text and paste register
let g:EasyClipUseSubstituteDefaults = 0
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste

" Use custom binding for the cut operations
let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

" Use custom binding for the cut operations
let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

" Automatically turn on 'paste' mode for the duration of the paste operation
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
