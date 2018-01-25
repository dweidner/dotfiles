" autoload/dw.vim
"
" @file Utility functions
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

" A list of project root markers
let s:markers = [
      \   'composer.json',
      \   'Gemfile',
      \   'package.json',
      \ ]


" (2) Environment ------------------------------------------------------- {{{1

"
" Print each path in the &runtimepath to the current buffer.
"
" @see {@link https://github.com/davidosomething/dotfiles}
"
function! dw#Runtimepath() abort
  put! =split(&runtimepath, ',', 0)
endfunction

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
  return has_key(g:plugs, a:plugin) && stridx(&rtp, g:plugs[a:plugin].dir) >= 0
endfunction


" (4) Editor ------------------------------------------------------------ {{{1

"
" Switch easily between indentation styles.
"
" @param {String} style
" @return {void}
"
function! dw#IndentStyle(style, ...) abort
  if a:style == 'spaces'
    setlocal expandtab shiftwidth=2 softtabstop=2
  elseif a:style == 'tabs'
    setlocal noexpandtab shiftwidth=2 softtabstop=0
  endif
endfunction

"
" Find the to path to the root directory of the current project.
"
" @param {Number} bufnr
" @return {String}
"
function! dw#ProjectRoot(...) abort
  let l:bufnr = a:0 > 0 && type(a:1) == v:t_number ? a:1 : '%'

  let l:project_dir = getbufvar(l:bufnr, 'project_root')
  if !empty(l:project_dir)
    return l:project_dir
  endif

  let l:project_dir = dw#FindMarker(s:markers)
  if !empty(l:project_dir)
    let b:project_root = l:project_dir
    return b:project_root
  endif

  let l:git_dir = getbufvar(l:bufnr, 'git_dir')
  if !empty(l:git_dir)
    let b:project_root = fnamemodify(l:git_dir, ':p:h:h')
    return b:project_root
  endif

  let b:project_root = ''
  return b:project_root
endfunction

"
" Find one of the given project markers by traversing the project tree.
"
" @param {List} markers
" @return {String}
"
function! dw#FindMarker(markers) abort
  for l:marker in a:markers
    let l:path = findfile(l:marker, '.;')

    if !empty(l:path)
      return fnamemodify(resolve(expand(l:path)), ':p:h')
    endif
  endfor

  return ''
endfunction


" (5) Support ----------------------------------------------------------- {{{1

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


" vim:foldmethod=marker:foldlevel=2
