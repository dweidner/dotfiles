" autoload/dwproject.vim

"
" A helper function used to retrieve the absolute path of
" a locally installed node module.
" @see <http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/>
"
function! dwproject#GetNodeModulePath(module)
  if !executable('npm')
    return
  endif

  " Retrieve the path using the shell command which
  silent let path = system('PATH=$(npm bin):$PATH && which ' .  shellescape(a:module))
  if v:shell_error
    return
  endif

  " Trim whitespace from the path
  return substitute(path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

"
" A helper function used to test whether the current project
" seems to be a WordPress installation.
"
function! dwproject#IsWordPressProject()
  if !exists("g:plugs['vim-rooter']")
    return 0
  endif

  " Determine the projects root directory using vim-rooter
  let dir = FindRootDirectory()

  " Check for the presence of a wp-config.php in the
  " project root
  return !empty(dir) && filereadable(dir . '/wp-config.php')
endfunction

"
" A helper function used to test whether the current project
" seems to be a WordPress installation.
"
function! dwproject#IsDrupalProject()
  if !exists("g:plugs['vim-rooter']")
    return 0
  endif

  " Determine the projects root directory using vim-rooter
  let dir = FindRootDirectory()
  if empty(dir)
    return 0
  endif

  " Ensure Drupal’s core files are available (Drupal 7/8)
  if !isdirectory(dir . '/core') && !isdirectory(dir . '/includes')
    return 0
  endif

  " Ensure Drupal’s configuration, modules and themes
  " folders are available
  for d in ['modules', 'themes', 'sites', 'sites/default']
    if !isdirectory(dir . '/' . d)
      return 0
    endif
  endfor

  return 1
endfunction

"
" A helper function used to test whether the current project
" seems to be a Laravel installation.
"
function! dwproject#IsLaravelProject()
  if !exists("g:plugs['vim-rooter']")
    return 0
  endif

  " Ensure that the laravel framework is present in the vendor folder
  let dir = FindRootDirectory()
  return !empty(dir) && isdirectory(dir . '/vendor/laravel/framework')
endfunction
