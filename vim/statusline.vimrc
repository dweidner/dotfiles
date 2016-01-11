" STATUSLINE.VIMRC

" Customize information displayed in status line
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'ctrlp' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'syntastic', 'ctags' ] ]
  \ },
  \ 'mode_map': {
  \   'n': ' N ',
  \   'i': ' I ',
  \   'R': ' R ',
  \   'v': ' V ',
  \   'V': 'V-L',
  \   'c': ' C ',
  \   "\<C-v>": 'V-B',
  \   's': ' S ',
  \   'S': 'S-L',
  \   "\<C-s>": 'S-B',
  \   '?': '      '
  \ },
  \ 'component_function': {
  \   'ctrlp': 'CtrlPMark',
  \   'ctags': 'GutenTagsStatusLineFlag',
  \   'fileformat': 'LightLineFileFormat',
  \   'fileencoding': 'LightLineFileEncoding'
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'subseparator': { 'left': '', 'right': '·' }
  \ }

" Show file format only if it differs from the default (unix)
function! LightLineFileFormat()
  return &fileformat !=? 'unix' ? &fileformat : ''
endfunction

" Show file encoding only if it differs from the default (utf-8)
function! LightLineFileEncoding()
  let fenc = strlen(&fileencoding) ? &fileencoding : &encoding
  return fenc !=? 'utf-8' ? fenc : ''
endfunction

" Display indicator if gutentags is (re)generating ctags file
function! GutenTagsStatusLineFlag()
  return gutentags#statusline(' Generating ctags... ')
endfunction

" Customize status line of CtrlP
let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusMain',
  \ 'prog': 'CtrlPStatusProg',
  \ }

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! CtrlPStatusMain(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusProg(str)
  return lightline#statusline(0)
endfunction

" Customize the text displayed by syntastic in the status line
let g:syntastic_stl_format='%E{E:%e}%B{ · }%W{W: %w}'

" Update Syntastic status, will be triggered by autocmd
function! s:UpdateSyntasticStatus()
  SyntasticCheck
  call lightline#update()
endfunction

" Trigger syntastic status update, when buffer is saved
augroup syntastic_update
  au!
  au BufWritePost *.php,*.css,*.scss,*.js call s:UpdateSyntasticStatus()
augroup END
