" plugin/plugin.ncm.vim
"
" @file Configuration of the NeoVim Completion Manager


if !has('nvim') || !dw#IsInstalled('nvim-completion-manager') | finish | endif

augroup dwncm
  autocmd!
augroup END

" Lazy load NeoVim Completion Manager (@see https://git.io/vF33S)
function! s:LoadNCM() abort
  silent! doautocmd User CmBefore
  call plug#load('nvim-completion-manager')
  autocmd! dwncm InsertEnter
endfunction

autocmd dwncm InsertEnter * call s:LoadNCM()
