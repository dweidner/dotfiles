" autoload/tmux.vim

if exists('g:did_tmux_vim') || &cp || version < 700
  finish
endif
let g:did_tmux_vim = 1

if !exists("g:tmux_plugin_directory")
  let g:tmux_plugin_directory = fnamemodify(resolve(expand('$HOME/.tmux/plugins')), ':p:h')
endif

" Get the path of the tmux theme plugin
function! s:GetPluginPath()
  return g:tmux_plugin_directory . "/tmux-theme/theme.tmux"
endfunction

" Test if the tmux plugin is readable
function! s:IsTmuxPluginInstalled()
  return filereadable(expand(s:GetPluginPath()))
endfunction

" Change the value for a global tmux option
function! tmux#SetOption(key, value)
  call system("tmux set -g @" . a:key . " " . shellescape(a:value))
endfunction

" Change the currently applied tmux color scheme
function! tmux#ApplyColorScheme(scheme, variation)
  if !executable("tmux") || has("gui_running") || !s:IsTmuxPluginInstalled()
    return
  endif

  let sessions = split(system("tmux list-sessions -F '#S'"), "\n")
  if empty(sessions)
    return
  endif

  call tmux#SetOption("theme", a:scheme)
  call tmux#SetOption("theme-background", a:variation)
  call system("tmux run-shell -b " . shellescape(s:GetPluginPath()))
endfunction

" Update the currently applied tmux color scheme based on
" the current vim settings
function! tmux#UpdateColorScheme()
  call tmux#ApplyColorScheme(g:colors_name, &background)
endfunction
