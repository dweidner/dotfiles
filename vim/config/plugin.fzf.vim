" config/plugin.fzf.vim

" Load the vim plugin shipping with fzf
if isdirectory("/usr/local/opt/fzf")
  set runtimepath+=/usr/local/opt/fzf
endif

" Custom keybindings to open fzf listings
nnoremap <Leader>f :FZF<CR>
