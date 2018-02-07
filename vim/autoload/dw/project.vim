" autoload/dw/project.vim
"
" @file Project specific utility functions


" Entity types to search within the project root
let s:t_file = 'f'
let s:t_directory = 'd'

" A list of project root markers
let s:markers = [
      \   'composer.json',
      \   'package.json',
      \ ]


"
" Find a directory that contains at least one of the given file candidates by
" traversing the filesystem upwards.
"
" @param {String|List} name
" @return {String}
"
function! s:FindMarker(name) abort
  let l:candidates = dw#Wrap(a:name)

  for l:candidate in l:candidates
    let l:file = findfile(l:candidate, '.;')

    if !empty(l:file)
      return fnamemodify(resolve(expand(l:file)), ':p')
    endif
  endfor

  return ''
endfunction

"
" Get the root directory of the current project.
"
" @param {Number} bufnr
" @return {String}
"
function! dw#project#GetRoot(...) abort
  let l:bufnr = a:0 > 0 && type(a:1) == v:t_number ? a:1 : '%'
  let l:project_dir = getbufvar(l:bufnr, 'project_root')

  if !empty(l:project_dir)
    return l:project_dir
  endif

  let l:marker = s:FindMarker(s:markers)

  if !empty(l:marker)
    let b:project_root = fnamemodify(l:marker, ':p:h')
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
" Change the current directory for the current window to the root of the
" current project. If a relative path is given the current directory is
" changed to that instead.
"
" @param {String} path
" @return {String}
"
function! dw#project#Cd(...) abort
  let l:path = a:0 > 0 ? a:1 : ''
  let l:root = dw#project#GetRoot()

  let l:target = simplify(l:root . '/' . l:path)

  if empty(l:root) || !isdirectory(l:target)
    return ''
  endif

  execute 'lcd ' . l:target
  pwd

  return l:target
endfunction

"
" Find the given file type within the current project tree.
"
" @param {String} type
" @param {String|List} name
" @return {String}
"
function! dw#project#Find(type, name) abort
  let l:root = dw#project#GetRoot()

  if empty(l:root)
    return ''
  endif

  let l:Find = a:type == s:t_directory ? function('finddir') : function('findfile')

  let l:candidates = dw#Wrap(a:name)
  let l:directory = expand('%:p:h')

  if l:directory == l:root || stridx(l:directory, l:root) == -1
    let l:path = l:root
  else
    let l:path = l:directory . ';' . l:root
  endif

  for l:candidate in l:candidates
    let l:file = l:Find(l:candidate, l:path)

    if !empty(l:file)
      return fnamemodify(resolve(expand(l:file)), ':p')
    endif
  endfor

  return ''
endfunction

"
" Find the given file in the current project.
"
" @param {String|List} name
" @return {String}
"
function! dw#project#FindFile(name) abort
  return dw#project#Find(s:t_file, a:name)
endfunction

"
" Find the given directory in the current project.
"
" @param {String|List} name
" @return {String}
"
function! dw#project#FindDir(name) abort
  return dw#project#Find(s:t_directory, a:name)
endfunction
