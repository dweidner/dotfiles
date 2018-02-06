" autoload/dw/ui.vim
"
" @file Interface specific utility functions.


"
" Save the value of a vim internal option in the local storage container of
" a given buffer.
"
" @param {String} bufnr
" @param {String} var
" @param {*} value
" @return {void}
"
function! s:Store(bufnr, var, value) abort
  let l:store = dw#GetStore(a:bufnr, 'dw_ui')
  let l:store[a:var] = a:value
endfunction

"
" Retrieve the value of an option saved to the local storage container of a
" given buffer.
"
" @param {String} bufnr
" @param {String} var
" @return {*}
"
function! s:Recall(bufnr, var) abort
  let l:store = dw#GetStore(a:bufnr, 'dw_ui')
  return get(l:store, a:var, v:null)
endfunction

"
" Remove the value of an option from the storage container of a given buffer.
"
" @param {String} bufnr
" @param {String} var
" @return {void}
"
function! s:Forget(bufnr, var) abort
  let l:store = dw#GetStore(a:bufnr, 'dw_ui')

  if has_key(l:store, a:var)
    unlet l:store[a:var]
  endif
endfunction

"
" Change the value of vim internal option temporarily unti restoring it.
"
" @param {String} bufnr
" @param {String} var
" @param {*} value
" @return {*}
"
function! dw#ui#SetTemporarily(bufnr, var, value) abort
  let l:current = getbufvar(a:bufnr, '&' . a:var)

  if a:value != l:current
    call setbufvar(a:bufnr, '&' . a:var, a:value)
    call s:Store(a:bufnr, a:var, l:current)
  endif

  return l:current
endfunction

"
" Enable a vim internal option temporarily until restoring it. Only works for
" options which can be either on or off.
"
" @param {String} bufnr
" @param {String} var
" @return {Number}
"
function! dw#ui#EnableTemporarily(bufnr, var) abort
  return dw#ui#SetTemporarily(a:bufnr, a:var, 1)
endfunction

"
" Disable a vim internal option temporarily until restoring it. Only works for
" options which can be either on or off.
"
" @param {String} bufnr
" @param {String} var
" @return {Number}
"
function! dw#ui#DisableTemporarily(bufnr, var) abort
  return dw#ui#SetTemporarily(a:bufnr, a:var, 0)
endfunction

"
" Restore the value for an option that has been temporarily enabled/disabled.
"
" @param {String} bufnr
" @param {String} var
" @return {Number}
"
function! dw#ui#Restore(bufnr, var) abort
  let l:value = s:Recall(a:bufnr, a:var)

  if l:value != v:null
    call setbufvar(a:bufnr, '&' . a:var, l:value)
    call s:Forget(a:bufnr, a:var)
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
