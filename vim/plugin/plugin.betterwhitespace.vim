" plugin/plugin.betterwhitespace.vim
"
" @file Configuration of a plugin to highlight/strip whitespace


if !dw#IsInstalled('vim-better-whitespace') | finish | endif

" The plugin is lazy loaded on command execution (via vim-plug). Unfortunatly
" the plugin requires a variable that indicates whether highlighting should
" be enabled for the current buffer. This variable is initialzed dynamically
" via an auto command when a buffer is displayed within a window (BufWinEnter).
function! s:ToggleWhitespace() abort
  if !exists('b:better_whitespace_enabled')
    let b:better_whitespace_enabled = 0
  endif

  ToggleWhitespace
endfunction

" Remove trailing whitespace
nnoremap <silent> <Leader>$ :StripWhitespace<CR>

" Toggle the highlighting of trailing whitespace
nnoremap <silent> =oW :call <SID>ToggleWhitespace()<CR>
