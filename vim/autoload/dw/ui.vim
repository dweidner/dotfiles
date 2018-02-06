" autoload/dw/ui.vim
"
" @file Interface specific utility functions.


"
" Enable a vim internal option temporarily until restoring it. Only works for
" options which can be either on or off.
"
" @param {String} var
" @return {Number}
"
function! dw#ui#EnableTemporarily(var) abort
  let l:value = getbufvar('%', '&' . a:var)

  if type(l:value) == v:t_number
    call setbufvar('%', '&' . a:var, 1)
    call setbufvar('%', 'dw_ui_' . a:var, l:value)
  endif

  return l:value
endfunction

"
" Disable a vim internal option temporarily until restoring it. Only works for
" options which can be either on or off.
"
" @param {String} var
" @return {Number}
"
function! dw#ui#DisableTemporarily(var) abort
  let l:value = getbufvar('%', '&' . a:var)

  if type(l:value) == v:t_number
    call setbufvar('%', '&' . a:var, 0)
    call setbufvar('%', 'dw_ui_' . a:var, l:value)
  endif

  return l:value
endfunction

"
" Restore the value for an option that has been temporarily enabled/disabled.
"
" @param {String} var
" @return {Number}
"
function! dw#ui#Restore(var) abort
  let l:value = getbufvar('%', 'dw_ui_' . a:var)

  if type(l:value) == v:t_number
    call setbufvar('%', '&' . a:var, l:value)
    call setbufvar('%', 'dw_ui_' . a:var, v:null)
  endif

  return l:value
endfunction

"
" Toggle the visibility of the color column.
"
" @return {void}
"
function! dw#ui#ToggleColorColumn() abort
  if match(&colorcolumn, '+1') >= 0
    set colorcolumn-=+1
  else
    set colorcolumn+=+1
  endif
endfunction
