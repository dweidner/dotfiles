" scripts.vim

if did_filetype() | finish | endif

" Runs before the default checks for file types
" @see <http://vimdoc.sourceforge.net/htmldoc/change.html#D>

" Detect shell scripts without extension
if getline(1) =~# '^#!.*/bin/sh'
  set filetype=sh
endif
