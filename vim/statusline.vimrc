" STATUSLINE.VIMRC

" 1. Lightline ---------------------- {{{1

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'ctrlp', 'fugitive' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'syntastic', 'busy' ] ]
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
  \   'fugitive': 'LightLineFugitive',
  \   'busy': 'LightLineBusyFlag',
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

" Display indicator if processes are running in the background
function! LightLineBusyFlag()
  return exists('*gutentags#statusline') ? gutentags#statusline('...') : ''
endfunction

" Display the current git branch
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction


" 2. CtrlP -------------------------- {{{1

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPMainStatusLine',
  \ 'prog': 'CtrlPProgressStatusLine',
  \ }

" Display currently active mode
function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! CtrlPMainStatusLine(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPProgressStatusLine(str)
  return lightline#statusline(0)
endfunction


" 3. Syntastic ---------------------- {{{1

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


" vim:foldmethod=marker:foldlevel=1
