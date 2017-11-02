" autoload/dw.vim
"
" @file Utility functions.

if exists('g:loaded_dw') | finish | endif
let g:loaded_dw = 1


"
" Print each path in the &runtimepath to the current buffer.
"
" @see {@link https://github.com/davidosomething/dotfiles}
"
function! dw#Runtimepath() abort
  put! =split(&runtimepath, ',', 0)
endfunction


"
" Determine whether a plugin has been installed via vim-plug.
"
" @see {@link https://git.io/vddp4|API for testing if plugin is installed?}
"
" @param {String} plugin
" @return {Boolean}
"
function! dw#IsInstalled(plugin) abort
  return has_key(g:plugs, a:plugin) && isdirectory(g:plugs[a:plugin].dir)
endfunction

"
" Determine whether a plugin has been loaded via vim-plug.
"
" @see {@link https://git.io/vddp4|API for testing if plugin is installed?}
"
" @param {String} plugin
" @return {Boolean}
"
function! dw#IsLoaded(plugin) abort
  return has_key(g:plugs, a:plugin) && stridx(&rtp, g:plugs[a:plugin].dir) >= 0
endfunction
