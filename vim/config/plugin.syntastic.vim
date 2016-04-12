" config/plugin.syntastic.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. Start Behavior
" 2. Appearance
" 3. Syntax Checkers
" 4. PHP Coding Standards
" -------------------------------------


" 1. Start Behavior ------------------------ {{{1

let g:syntastic_check_on_open=1             " Run syntax check when opening a file
let g:syntastic_check_on_wq=0               " Avoid running tests on close
let g:syntastic_always_populate_loc_list=1  " Populate location list with errors

" Start syntastic in passiv mode. Enable only for specific file types.
let g:syntastic_mode_map = {
  \   'mode': 'passiv',
  \   'active_filetypes': [ 'php', 'javascript', 'sass', 'css', 'sh', 'zsh' ],
  \ }


" 2. Appearance ---------------------------- {{{1

let g:syntastic_error_symbol='⨯'            " Customize error symbol
let g:syntastic_warning_symbol='▴'          " Customize warning symbol
let g:syntastic_style_error_symbol='◦'      " Customize style error symbol
let g:syntastic_style_warning_symbol='◦'    " Customize style error symbol

" Customize the message displayed in the status bar
let g:syntastic_stl_format='%E{⨯ %e}%B{ · }%W{▴ %w} '


" 3. Syntax Checkers ----------------------- {{{1

" Disable style checkers for php
let g:syntastic_php_checkers = ['php']

" Use eslint instead of jshint
let g:syntastic_javascript_checkers = ['eslint']

" Ignore some of the errors displayed by html5-tidy
let g:syntastic_html_tidy_ignore_errors = [
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  '<script> escaping malformed URI reference',
    \  '</head> isn''t allowed in <body> elements'
    \ ]


" 4. PHP Coding Standards ------------------ {{{1

" Currently active coding standard
let s:php_coding_standard='none'

" Get a list of available coding standards
function! s:GetPHPCodingStandards()
  return ['None', 'PSR1', 'PSR2', 'WordPress', 'Drupal']
endfunction

" Select a specific php coding standards
function! s:SelectPHPCodingStandard(key)
  let idx=index(g:syntastic_php_checkers, 'phpcs')
  let args=''

  if a:key ==? 'psr1'
    let args='--standard=PSR1'
  elseif a:key ==? 'psr2'
    let args='--standard=PSR2'
  elseif a:key ==? 'wordpress'
    let args='--standard=WordPress'
  elseif a:key ==? 'drupal'
    let args='--standard=Drupal --extensions=php,module,inc,install,test,profile,theme'
  endif

  if !empty(args)
    if idx < 0
      call add(g:syntastic_php_checkers, 'phpcs')
    endif
    let g:syntastic_php_phpcs_args='--report=csv '.args
    let s:php_coding_standard=tolower(a:key)
  else
    if idx >= 0
      call remove(g:syntastic_php_checkers, idx)
    endif
    let g:syntastic_php_phpcs_args=''
    let s:php_coding_standard='none'
  endif

  call SyntasticCheck()
  echo 'php_coding_standard='.s:php_coding_standard
endfunction

" Toggle between available coding standards
function! s:TogglePHPCodingStandard()
  let options=s:GetPHPCodingStandards()
  let idx=match(options, s:php_coding_standard)
  let next=(idx + 1) % len(options)
  call s:SelectPHPCodingStandard(options[next])
endfunction

" Suggestions for AutoCompletion
function! s:CompletePHPCodingStandard(ArgLead, CmdLine, CursorPos)
  return s:GetPHPCodingStandards()
endfunction

" Custom command to select coding standard
com -nargs=1 -complete=customlist,s:CompletePHPCodingStandard PHPCodingStandard :call s:SelectPHPCodingStandard(<q-args>)

" Toggle between coding standards in the following order:
" 1. None, 2. PSR1, 3. PSR2, 4. WordPress, 5. Drupal
nnoremap <F10> :call <SID>TogglePHPCodingStandard()<CR>


" vim:foldmethod=marker:foldlevel=2
