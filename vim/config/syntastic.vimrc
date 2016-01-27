" SYNTASTIC.VIMRC

" 1. Configuration -------------------------- {{{1

let g:syntastic_error_symbol='⨯'            " Customize error symbol
let g:syntastic_warning_symbol='▴'          " Customize warning symbol
let g:syntastic_style_error_symbol='◦'      " Customize style error symbol
let g:syntastic_style_warning_symbol='◦'    " Customize style error symbol
let g:syntastic_check_on_open=1             " Run syntax check when opening a file
let g:syntastic_check_on_wq=0               " Avoid running tests on close
let g:syntastic_always_populate_loc_list=1  " Populate location list with errors

" Customize the message displayed in the status bar
let g:syntastic_stl_format='%E{⨯ %e}%B{ · }%W{▴ %w} '


" 2. Syntax Checkers ------------------------ {{{1

" Start syntastic in passiv mode. Enable only for specific file types.
let g:syntastic_mode_map = {
  \   'mode': 'passiv',
  \   'active_filetypes': [ 'php', 'javascript', 'sass', 'css', 'sh', 'zsh' ],
  \ }

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


" vim:foldmethod=marker:foldlevel=2
