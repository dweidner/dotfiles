" VIMUX.VIMRC

" 1. Configuration -------------------- {{{1

let g:VimuxPromptString=':! '           " Prefix to use for the command prompt


" 2. Key bindings --------------------- {{{1

" Prompt for a command to run
nmap <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nmap <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
nmap <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
nmap <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
nmap <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
nmap <Leader>vz :call VimuxZoomRunner()<CR>


" vim:foldmethod=marker:foldlevel=2
