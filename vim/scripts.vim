" scripts.vim

if did_filetype() | finish | endif

" Runs before the default checks for file types
" @see <http://vimdoc.sourceforge.net/htmldoc/change.html#D>

" ---------------------------------------------------------
" Example:
" if getline(1) =~# '^#!/bin/(sh|bash)$'
"   set filetype=sh
" endif
" ---------------------------------------------------------
