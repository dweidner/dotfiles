" plugin/vimux.plugin.vim

" Prefix to use for the command prompt
let g:VimuxPromptString = ':! '

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
