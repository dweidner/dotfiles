" plugin/plugin.textobj.vim
"
" @file User defined text objects


if !dw#IsLoaded('vim-textobj-user') | finish | endif

" Lazy load plugins for user defined text objects on first invocation
" @see {@link https://github.com/davidosomething/dotfiles|David O'Trakoun}
function! s:MapTextObject(key, plugin) abort
  execute 'omap a' . a:key . ' <Plug>(textobj-' . a:plugin . '-a)'
  execute 'xmap a' . a:key . ' <Plug>(textobj-' . a:plugin . '-a)'
  execute 'omap i' . a:key . ' <Plug>(textobj-' . a:plugin . '-i)'
  execute 'xmap i' . a:key . ' <Plug>(textobj-' . a:plugin . '-i)'
endfunction

let s:plugins = {
      \   'u': 'url',
      \   'x': 'xmlattr',
      \ }

for [key, name] in items(s:plugins)
  if dw#IsInstalled('vim-textobj-' . name)
    call s:MapTextObject(key, name)
  endif
endfor
