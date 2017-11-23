" plugin/plugin.fugitive.vim
"
" @file Configuration of the Fugitive plugin


" Custome keybindings for the Git wrapper
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpull<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>

if dw#IsLoaded('fzf.vim')
  nnoremap <Leader>gl :FZFBCommits<CR>
else
  nnoremap <Leader>gl :Glog<CR>
endif
