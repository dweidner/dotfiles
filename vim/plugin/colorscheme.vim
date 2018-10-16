" plugin/colorscheme.vim
"
" @file Configuration of the color scheme


"
" Run through a list of color schemes and enable the first one installed on
" the current system.
"
" @param {Dictionary} dict
" @return {String}
"
function! s:EnableColorScheme(dict) abort
  if dw#IsSupported('truecolors')
    set termguicolors
  endif

  for [l:plugin, l:scheme] in items(a:dict)
    if dw#IsLoaded(l:plugin)
      execute 'colorscheme ' . get(l:scheme, 0)
      execute 'set background=' . get(l:scheme, 1)
      return l:plugin
    endif
  endfor

  return ''
endfunction

"
" Customize the highlighting groups of rakr/vim-one.
"
" @return {void}
"
function! s:CustomizeAtomOne() abort
  let g:fzf_colors = {
        \   'fg': ['fg', 'Normal'],
        \   'bg': ['bg', 'Normal'],
        \   'hl': ['fg', 'IncSearch'],
        \   'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \   'bg+': ['bg', 'CursorLine', 'CursorColumn'],
        \   'hl+': ['fg', 'IncSearch'],
        \   'info': ['fg', 'Comment'],
        \   'border': ['fg', 'Comment'],
        \   'prompt': ['fg', 'Special'],
        \   'pointer': ['fg', 'Special'],
        \   'marker': ['fg', 'Comment'],
        \   'spinner': ['fg', 'Label'],
        \   'header': ['fg', 'Comment'],
        \ }

  hi link NeomakeError SpellBad
  hi link NeomakeWarning SpellCap
  hi link ExtraWhitespace SpellCap
  hi link phpDocTags jsDocTags
  hi link phpDocIdentifier jsDocParam

  if &background ==# 'light'
    if $TERM_PROGRAM ==# 'Apple_Terminal'
      hi Normal ctermbg=NONE
      hi SignifySignAdd ctermbg=255 guibg=#fafafa
      hi SignifySignChange ctermbg=255 guibg=#fafafa
      hi SignifySignDelete ctermbg=255 guibg=#fafafa
    endif
  endif
endfunction

" Register functions used to customize the individual color schemes
autocmd vimrc ColorScheme one call s:CustomizeAtomOne()

" Enable the first color scheme available in the current system
let s:color_scheme = s:EnableColorScheme({
      \   'vim-one': ['one', 'dark'],
      \   'gruvbox': ['gruvbox', 'dark'],
      \   'vim-colors-solarized': ['solarized', 'dark'],
      \ })
