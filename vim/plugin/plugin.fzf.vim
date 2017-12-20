" plugin/plugin.fzf.vim
"
" @file Configuration of the fuzzy finder


if !dw#IsLoaded('fzf.vim') | finish | endif

" Add a prefix to the default commands to avoid conflicts
let g:fzf_command_prefix = 'FZF'

" Customize the default layout
let g:fzf_layout = { 'down': '~50%' }

" Enable the preview window for the files command
let s:fzf_files_preview = matchlist($FZF_CTRL_T_OPTS, '--preview [''"]\(.\{-}\)[''"]')
let g:fzf_files_options = join([
      \   '--preview-window "right:50%:hidden"',
      \   '--preview "' . get(s:fzf_files_preview, 1) . '"',
      \   '--bind "?:toggle-preview"',
      \ ])

" Select the command to use for the search operation
if executable('rg')
  let s:fzf_grep_command = 'rg --column --line-number --no-heading --color=always'
elseif executable('ag')
  let s:fzf_grep_command = 'ag --column --nogroup --color'
else
  let s:fzf_grep_command = 'grep -r --line-number --color=always'
endif

" Custom keybindings for some of the FZF commands
noremap <silent> <C-t> :FZFFiles<CR>
noremap <silent> <Leader>b :FZFBuffers<CR>
noremap <silent> <Leader>r :FZFBTags<CR>
noremap <silent> <Leader>t :FZFiles<CR>

" Custom abbreviations for some of the FZF commands
cnoreabbrev F FZFFiles
cnoreabbrev G FZFGrep

" Create a custom command to search file contents by query string
command! -bang -nargs=* FZFGrep call fzf#vim#grep(join([s:fzf_grep_command, fzf#shellescape(<q-args>)]), 1)
