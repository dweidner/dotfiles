" autoload/dw.vim
"
" @file Vim script utility functions
"
" -----------------------------------------------------------------------
" Table of Contents
" -----------------------------------------------------------------------
"  1. Script variables
"  2. Environment
"  3. Plugins
"  4. Editor
"  5. Support
" -----------------------------------------------------------------------


" (1) Script variables -------------------------------------------------- {{{1

" Loading guard
if exists('g:loaded_dw') | finish | endif
let g:loaded_dw = 1

" Determine the currently running terminal emulator
let s:terminal_app  = $TERM_PROGRAM ==# 'Apple_Terminal'
let s:iterm         = $TERM_PROGRAM ==# 'iTerm.app'

" A map of supported editor features
let s:features = {
      \   'clipboard':  has('unnamed') || has('nvim'),
      \   'completion': has('nvim') && has('python3'),
      \   'conceal':    has('conceal'),
      \   'truecolors': has('termguicolors') && !s:terminal_app
      \ }


" (2) Environment ------------------------------------------------------- {{{1

"
" Determine whether a given feature is supported.
"
" @param {String} feature...
" @return {Boolean}
"
function! dw#IsSupported(...) abort
  for feature in a:000
    if !get(s:features, feature) | return 0 | endif
  endfor

  return 1
endfunction

"
" Print each path in the &runtimepath to the current buffer.
"
" @see {@link https://github.com/davidosomething/dotfiles}
" @return {List}
"
function! dw#Runtimepath() abort
  return split(&runtimepath, ',', 0)
endfunction

"
" Retrieve a list of locales supported by the current system.
"
" @return {List}
"
function! dw#Languages() abort
  redir => l:languages
    silent! language
  redir END

  let l:languages = substitute(dw#Trim(l:languages), '^.*\"\(.*\)\"', '\1', '')
  let l:languages = split(l:languages, '/')
  let l:languages = filter(l:languages, 'len(v:val) >= 4')
  let l:languages = uniq(sort(l:languages))
  let l:languages = map(l:languages, 'split(v:val, "\\.")[0]')

  return l:languages
endfunction

"
" Get all files added to the users bookmark list.
"
" @return {List}
"
function! dw#Bookmarks() abort
  let l:files = systemlist('bookmark list')
  let l:files = filter(l:files, 'filereadable(v:val)')

  return l:files
endfunction

"
" Reveal the given file in Finder.
"
" @param {String} file
" @return {String}
"
function! dw#OpenFinder(...) abort
  let l:file = expand(a:0 > 0 ? a:1 : '%:p')

  if filereadable(l:file)
    execute 'silent !open -R ' . shellescape(l:file)
    redraw!
  endif

  return l:file
endfunction

"
" Open the given file in Visual Studio Code.
"
" @param {String} file
" @return {String}
"
function! dw#OpenVSCode(...) abort
  if a:0 > 0
    execute "silent !code --goto '" . expand(a:1) . "'" | redraw!
    return expand(a:1)
  endif

  execute "silent !code --goto '" . expand("%") . ":" . line(".") . ":" . col(".") . "'" | redraw!
  return expand("%")
endfunction


" (3) Plugins ----------------------------------------------------------- {{{1

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
  return has_key(g:plugs, a:plugin) && stridx(&rtp, dw#Rtrim(g:plugs[a:plugin].dir, '/')) >= 0
endfunction


" (4) Editor ------------------------------------------------------------ {{{1

"
" Switch easily between indentation styles.
"
" @param {String} style
" @return {void}
"
function! dw#IndentStyle(style) abort
  if a:style == 'spaces'
    setlocal expandtab shiftwidth=2 softtabstop=2
  elseif a:style == 'tabs'
    setlocal noexpandtab shiftwidth=2 softtabstop=0
  endif
endfunction

"
" Fill the current line with a given character.
"
" @see {@link https://stackoverflow.com/a/3400528|How to fill a line…}
"
" @param {String} char
" @return {void}
"
function! dw#FillLine(char) abort
  let l:cursor = getcurpos()
  let l:suffix = getbufvar('%', 'current_line_suffix', '')

  let l:tw = getbufvar('%', '&textwidth', 78)
  let l:tw = l:tw ? l:tw : 78

  let l:fdm = getbufvar('%', '&foldmethod')

  if l:fdm == 'marker'
    let l:fdl = max([1, foldlevel('.')])
    let l:suffix = ' {{{' . l:fdl
  endif

  .s/[[:space:]]*$//

  let l:offset = col('$') + len(l:suffix)
  let l:count = float2nr(floor((l:tw - l:offset) / len(a:char)))

  if l:count > 0
    .s/$/\=(' ' . repeat(a:char, l:count) . l:suffix)/
  endif

  call setpos('.', l:cursor)
endfunction


" (5) Support ----------------------------------------------------------- {{{1

"
" Get a local dictionary by name. Create one if it does not exist yet.
"
" @param {String} bufnr
" @param {String} name
" @return {Dictionary}
"
function! dw#GetStore(bufnr, name) abort
  let l:store = getbufvar(a:bufnr, a:name)

  if empty(l:store)
    let l:store = {}
    call setbufvar(a:bufnr, a:name, l:store)
  endif

  return l:store
endfunction

"
" If the given value is not of type list, wrap it in one.
"
" @param {*} list
" @return {List}
"
function! dw#Wrap(list) abort
  return type(a:list) == v:t_list ? a:list : [ a:list ]
endfunction

"
" Remove starting and trailing whitespace from a string.
"
" @see {@link http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/|Use Local Eslint in Syntastic}
"
" @param {String} str
" @return {Boolean}
"
function! dw#Trim(str, ...) abort
  if a:0 > 0
    return substitute(a:str, '\V\^' . escape(a:2, '/\') . '\*\(\.\{-\}\)' . escape(a:2, '/\'). '\*\$', '\1', '')
  endif

  return substitute(a:str, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

"
" Remove whitespace from the beginning of a string.
"
" @param {String} str
" @return {Boolean}
"
function! dw#Ltrim(str, ...) abort
  if a:0 > 0
    return substitute(a:str, '\V\^' . escape(a:1, '/\') . '\*', '', '')
  endif

  return substitute(a:str, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

"
" Remove whitespace from the end of a string.
"
" @param {String} str
" @return {Boolean}
"
function! dw#Rtrim(str, ...) abort
  if a:0 > 0
    return substitute(a:str, '\V' . escape(a:1, '/\') . '\*\$', '', '')
  endif

  return substitute(a:str, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction


" vim:foldmethod=marker:foldlevel=2
