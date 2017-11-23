" plugin/plugin.fzf.vim
"
" @file Configuration of the fuzzy finder


if !dw#IsLoaded('fzf.vim') | finish | endif

" Add a prefix to the default commands to avoid conflicts
let g:fzf_command_prefix = 'FZF'

" Custom keybindings for some of the FZF commands
nnoremap <silent> <C-t> :<C-U>execute 'FZF' . get(['', 'History', 'Buffer', 'BTags'], v:count, '')<CR>
nmap <silent> <Leader>t <C-t>
nmap <silent> <Leader>b 2<C-t>

" Custom abbreviations for some of the FZF commands
cnoreabbrev F FZFFiles
cnoreabbrev G FZFGrep

" Select the command to use for the search operation
if executable('rg')
  let s:command = 'rg --column --line-number --no-heading --color=always'
elseif executable('ag')
  let s:command = 'ag --column --nogroup --color'
else
  let s:command = 'grep -r --line-number --color=always'
endif

" Cuszomize the display settings used to present the search results
let s:preview_full = fzf#vim#with_preview('up:60%')
let s:preview_hidden = fzf#vim#with_preview('right:50%:hidden', '?')

" Create a custom command to search file contents by query string
function! s:Grep(query, ...) abort
  let l:query = empty(a:query) ? expand('<cword>') : a:query
  let l:command = s:command . ' ' . fzf#shellescape(l:query)

  let l:bang = (a:0 > 0) ? a:1 : 0
  let l:options = l:bang ? s:preview_full : s:preview_hidden

  return fzf#vim#grep(l:command, 1, l:options, l:bang)
endfunction

command! -bang -nargs=* FZFGrep call s:Grep(<q-args>, <bang>0)
