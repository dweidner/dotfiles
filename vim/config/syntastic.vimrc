" SYNTASTIC.VIMRC

let g:syntastic_error_symbol='⨯'    " Customize error symbol
let g:syntastic_warning_symbol='▴'  " Customize warning symbol
let g:syntastic_check_on_open=1     " Run syntax check when opening a file
let g:syntastic_check_on_wq=0       " Avoid running tests on close

let g:syntastic_stl_format='%E{⨯ %e}%B{ · }%W{▴ %w} '
let g:syntastic_html_tidy_ignore_errors = [
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  '<script> escaping malformed URI reference',
    \  '</head> isn''t allowed in <body> elements'
    \ ]

