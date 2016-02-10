" plugin/filetypes.vim

augroup vimrc_filetypes

  au!

  " Remember cursor position, except for commit messages
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute 'normal! g`"zvzz' |
    \ endif

  " Wrap lines to improve readability of text documents
  au Filetype text,markdown,gitcommit setlocal wrap linebreak textwidth=72
  au FileType text,markdown,gitcommit setlocal spell spelllang=en_us,de_de

  " Higlight configuration files
  "au BufRead,BufNewFile,BufFilePre *.info         setfiletype dosini
  au BufRead,BufNewFile,BufFilePre .editorconfig  setfiletype dosini
  au BufRead,BufNewFile,BufFilePre .babelrc       setfiletype json
  au BufRead,BufNewFile,BufFilePre .bowerrc       setfiletype json
  au BufRead,BufNewFile,BufFilePre .eslintrc      setfiletype json
  au BufRead,BufNewFile,BufFilePre .jscrc         setfiletype json
  au BufRead,BufNewFile,BufFilePre .jshintrc      setfiletype json

  " Highlight some php files in Drupal
  "au BufRead,BufNewFile,BufFilePre *.inc          setfiletype php
  "au BufRead,BufNewFile,BufFilePre *.module       setfiletype php
  "au BufRead,BufNewFile,BufFilePre *.test         setfiletype php
  "au BufRead,BufNewFile,BufFilePre *.install      setfiletype php
  "au BufRead,BufNewFile,BufFilePre *.theme        setfiletype php

augroup END
