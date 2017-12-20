" plugin/colorscheme.vim
"
" @file Configuration of the color scheme


" Enable true colors if supported by the current environment
if dw#IsSupported('truecolors')
  set termguicolors
endif

" Enable the first of the given color schemes available on the current system.
function s:EnableColorScheme(dict) abort
  for [l:plugin, l:scheme] in items(a:dict)
    if dw#IsLoaded(l:plugin)
      execute 'colorscheme ' . l:scheme
    endif
  endfo
endfunction

" Customize the Atom One color scheme
function! s:CustomizeAtomOne() abort
  let g:fzf_colors = {
        \   'fg': ['fg', 'Normal'],
        \   'bg': ['bg', 'Normal'],
        \   'hl': ['fg', 'IncSearch'],
        \   'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \   'bg+': ['bg', 'CursorLine', 'CursorColumn'],
        \   'hl+': ['fg', 'IncSearch'],
        \   'info': ['fg', 'Comment'],
        \   'border': ['fg', 'Ignore'],
        \   'prompt': ['fg', 'Special'],
        \   'pointer': ['fg', 'Special'],
        \   'marker': ['fg', 'Comment'],
        \   'spinner': ['fg', 'Label'],
        \   'header': ['fg', 'Comment'],
        \ }

  if $TERM_PROGRAM ==# 'Apple_Terminal'
    hi Normal ctermbg=NONE
    hi link NeomakeError SpellBad
    hi link NeomakeWarning SpellCap
    hi link ExtraWhitespace SpellCap
    hi SignifySignAdd ctermbg=255 guibg=#fafafa
    hi SignifySignChange ctermbg=255 guibg=#fafafa
    hi SignifySignDelete ctermbg=255 guibg=#fafafa
  endif
endfunction

" Register auto commands used to customize color schemes
autocmd vimrc ColorScheme one call s:CustomizeAtomOne()

" Load one of the listed color schemes
call s:EnableColorScheme({
      \   'vim-one': 'one',
      \   'vim-colors-solarized': 'solarized',
      \ })
