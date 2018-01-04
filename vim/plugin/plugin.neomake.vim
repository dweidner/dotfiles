" plugin/plugin.neomake.vim
"
" @file Configuration of the Neomake linting plugin


if !dw#IsLoaded('neomake') | finish | endif

augroup dwneomake
  autocmd!
augroup END

noremap <silent> <special> <F6> :<C-U>:Neomake<CR>
noremap <silent> <special> <F7> :<C-U>:Neomake<CR>
noremap <silent> <special> =oN  :NeomakeToggleTab<CR>

let g:neomake_info_sign = {
      \  'text': 'ℹ︎',
      \  'texthl': 'NeomakeInfoSign',
      \}

let g:neomake_message_sign = {
      \  'text': '○',
      \  'texthl': 'NeomakeMessageSign',
      \}

let g:neomake_warning_sign = {
      \  'text': '△',
      \  'texthl': 'NeomakeWarningSign',
      \}

let g:neomake_error_sign = {
      \  'text': '✕',
      \  'texthl': 'NeomakeErrorSign',
      \}

autocmd dwneomake BufWritePost * Neomake
