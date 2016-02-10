" filetype.vim

" Runs on `filetype on`
" @see <http://vimdoc.sourceforge.net/htmldoc/filetype.html>

if exists('g:did_load_filetypes') | finish | endif

augroup filetypedetect

  au!

  " Correctly higlight configuration files
  au BufRead,BufNewFile,BufFilePre *.info         setfiletype dosini
  au BufRead,BufNewFile,BufFilePre .editorconfig  setfiletype dosini
  au BufRead,BufNewFile,BufFilePre .babelrc       setfiletype json
  au BufRead,BufNewFile,BufFilePre .bowerrc       setfiletype json
  au BufRead,BufNewFile,BufFilePre .eslintrc      setfiletype json
  au BufRead,BufNewFile,BufFilePre .jscrc         setfiletype json
  au BufRead,BufNewFile,BufFilePre .jshintrc      setfiletype json

  " Correctly highlight php files in Drupal
  au BufRead,BufNewFile,BufFilePre *.inc          setfiletype php
  au BufRead,BufNewFile,BufFilePre *.module       setfiletype php
  au BufRead,BufNewFile,BufFilePre *.test         setfiletype php
  au BufRead,BufNewFile,BufFilePre *.install      setfiletype php
  au BufRead,BufNewFile,BufFilePre *.theme        setfiletype php

augroup END
