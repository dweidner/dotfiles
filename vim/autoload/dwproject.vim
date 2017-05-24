" autoload/dwproject.vim

"
" Find the root of the current project using the vim-rooter
" plugin.
"
function! dwproject#FindProjectRoot()
  if (!exists("g:plugs['vim-rooter']"))
    return 0
  endif

  return FindRootDirectory()
endfunction

"
" Run a shell command and strip any whitespace from the
" return value.
"
function! dwproject#RunShellCommand(cmd)
  silent let stdout = system(a:cmd)

  if v:shell_error
    return
  endif

  return dw#StrTrim(stdout)
endfunction

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
  return dw#RunShellCommand('PATH=$(npm bin):$PATH && which ' .  shellescape(a:module))
endfunction

"
" A helper function used to retrieve the absolute path of
" a dependency installed via composer.
"
function! dwproject#GetComposerBinaryPath(binary)
  if !executable('composer')
    return
  endif

  " Retrieve the path using the shell command
  silent let path = dw#RunShellCommand('composer config --absolute bin-dir')

  if executable(path . '/' . a:binary)
    return path . '/' . a:binary
  endif

  return
endfunction

"
" A helper function used to test whether the current project
" seems to be a WordPress installation.
"
function! dwproject#IsWordPressProject()
  " Determine the projects root directory using vim-rooter
  let dir = dwproject#FindProjectRoot()

  " Check for the presence of a wp-config.php in the
  " project root
  return !empty(dir) && filereadable(dir . '/wp-config.php')
endfunction

"
" A helper function used to test whether the current project
" seems to be a WordPress installation.
"
function! dwproject#IsDrupalProject()
  " Determine the projects root directory using vim-rooter
  let dir = dwproject#FindProjectRoot()

  " Ensure Drupal’s core files are available (Drupal 7/8)
  if empty(dir) || !isdirectory(dir . '/core') || !isdirectory(dir . '/includes')
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
  " Determine the projects root directory using vim-rooter
  let dir = dwproject#FindProjectRoot()

  " Ensure that the laravel framework is present in the vendor folder
  return !empty(dir) && isdirectory(dir . '/vendor/laravel/framework')
endfunction
