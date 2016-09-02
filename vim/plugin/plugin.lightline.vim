" plugin/plugin.lightline.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. Lightline
" 2. Git/Fugitive
" 3. CtrlP
" 4. Syntastics
" -------------------------------------


" 1. Lightline ------------------------ {{{1

" Customize the statusline with lightline
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

" Display indicator if processes are running in the background
function! LightLineBusyFlag()
  return exists('*gutentags#statusline') ? gutentags#statusline(' ··· ') : ''
endfunction

" Show file format only if it differs from the default (unix)
function! LightLineFileFormat()
  return &fileformat !=? 'unix' ? &fileformat : ''
endfunction

" Show file encoding only if it differs from the default (utf-8)
function! LightLineFileEncoding()
  let fenc = strlen(&fileencoding) ? &fileencoding : &encoding
  return fenc !=? 'utf-8' ? fenc : ''
endfunction

" Change the lightline colorscheme on the fly
" @see |:help lightline-problem-13|
function! s:LightLineColorSchemeUpdate()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow'
      let g:lightline.colorscheme =
            \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
            \ (g:colors_name ==# 'solarized' ? '_' . &background : '')
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endif
  catch
  endtry
endfunction

" Refresh lightline colors when the colorscheme changes
au vimrc ColorScheme * call s:LightLineColorSchemeUpdate()


" 2. Git/Fugitive --------------------- {{{1

" Display the current git branch
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction


" 3. CtrlP ---------------------------- {{{1

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


" 4. Syntastics ----------------------- {{{1

" Update Syntastic status, will be triggered by autocmd
function! s:SyntasticStatusUpdate()
  SyntasticCheck
  call lightline#update()
endfunction

" Trigger syntastic status update, when buffer is saved
au vimrc BufWritePost *.php,*.css,*.scss,*.js call s:SyntasticStatusUpdate()


" vim:foldmethod=marker:foldlevel=2
