" plugin/plugin.ncm2.vim
"
" @file Configuration of the NeoVim Completion Framework


if !has('nvim') || !dw#IsInstalled('ncm2') | finish | endif

augroup dwncm
  autocmd!
augroup END

autocmd dwncm InsertEnter * call ncm2#enable_for_buffer()

