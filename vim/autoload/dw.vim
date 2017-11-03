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


"
" Remove starting and trailing whitespace from a string.
"
" @see {@link http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/|Use Local Eslint in Syntastic}
"
" @param {String} str
" @return {Boolean}
"
function! dw#Trim(str) abort
  return substitute(a:str, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction


"
" Run a shell command and strip trailing whitespace from the return value.
"
" @param {String}
" @return {String}
"
function! dw#RunShellCommand(cmd) abort
  silent let l:output = system(a:cmd)

  if v:shell_error
    return
  endif

  return dw#Trim(l:output)
endfunction

"
" Determine the bundle groups to include within the current environment.
"
" @param {List} list
" @return {List}
"
function! dw#GetBundles(list) abort
  let l:profile = !empty($DOTFILES_PROFILE) ? $DOTFILES_PROFILE : 0

  if l:profile =~? '^dev'
    call add(a:list, 'development')
  endif

  return a:list
endfunction
