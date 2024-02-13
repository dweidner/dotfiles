" plugin/plugin.textobj.vim
"
" @file Lazy load user defined text objects
" @see  {@link https://github.com/davidosomething/dotfiles|David O'Trakoun}


if !dw#IsLoaded('vim-textobj-user') | finish | endif

" A utility function used to map a given key to the corresponding interface
" of a text object plugin
function! s:MapTextObject(key, interface) abort
  execute 'omap a' . a:key . ' <Plug>(textobj-' . a:interface . '-a)'
  execute 'xmap a' . a:key . ' <Plug>(textobj-' . a:interface . '-a)'
  execute 'omap i' . a:key . ' <Plug>(textobj-' . a:interface . '-i)'
  execute 'xmap i' . a:key . ' <Plug>(textobj-' . a:interface . '-i)'
endfunction

" A map of individual keys to for a text object and their corresponding
" plugin interfaces
let s:plugins = {
      \   'i': 'indent',
      \   'l': 'line',
      \ }

" Add the mapping provided mapping for each plugin in the dictionary
for [s:key, s:plugin_interface] in items(s:plugins)
  let s:plugin_name = matchstr(s:plugin_interface, '\a*')

  if dw#IsInstalled('vim-textobj-' . s:plugin_name)
    call s:MapTextObject(s:key, s:plugin_interface)
  endif
endfor

" Cleanup used variables
unlet s:key s:plugin_name s:plugin_interface s:plugins
