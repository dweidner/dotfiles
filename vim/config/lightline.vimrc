" LIGHTLINE.VIMRC

" 1. Components ----------------------- {{{1

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'ctrlp', 'fugitive' ] ],
  \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'busy', 'syntastic', 'fileformat', 'fileencoding' ] ]
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
  \ 'subseparator': { 'left': '', 'right': '｜' }
  \ }


" 2. VIM ------------------------------ {{{1

" Display indicator if processes are running in the background
function! LightLineBusyFlag()
  return exists('*gutentags#statusline') ? gutentags#statusline(' ··· ') : ''
endfunction


" 3. File/Buffer ---------------------- {{{1

" Show file format only if it differs from the default (unix)
function! LightLineFileFormat()
  return &fileformat !=? 'unix' ? &fileformat : ''
endfunction

" Show file encoding only if it differs from the default (utf-8)
function! LightLineFileEncoding()
  let fenc = strlen(&fileencoding) ? &fileencoding : &encoding
  return fenc !=? 'utf-8' ? fenc : ''
endfunction


" 4. Git ------------------------------ {{{1

" Display the current git branch
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction


" 5. CtrlP ---------------------------- {{{1

" Use custom status functions
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

" Remember the currently active mode
function! CtrlPMainStatusLine(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

" Do nothing
function! CtrlPProgressStatusLine(str)
  return lightline#statusline(0)
endfunction


" 6. Syntastic ------------------------ {{{1

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


" vim:foldmethod=marker:foldlevel=2

