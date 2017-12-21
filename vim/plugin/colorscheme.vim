" plugin/colorscheme.vim
"
" @file Configuration of the color scheme


function! s:EnableColorScheme(dict) abort
  if dw#IsSupported('truecolors')
    set termguicolors
  endif

  for [l:plugin, l:scheme] in items(a:dict)
    if dw#IsLoaded(l:plugin)
      execute 'colorscheme ' . l:scheme
    endif
  endfo
endfunction

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

  if $TERM_PROGRAM ==# 'Apple_Terminal'
    hi Normal ctermbg=NONE
    hi SignifySignAdd ctermbg=255 guibg=#fafafa
    hi SignifySignChange ctermbg=255 guibg=#fafafa
    hi SignifySignDelete ctermbg=255 guibg=#fafafa
  endif
endfunction

autocmd vimrc ColorScheme one call s:CustomizeAtomOne()

call s:EnableColorScheme({
      \   'vim-one': 'one',
      \   'gruvbox': 'gruvbox',
      \   'vim-colors-solarized': 'solarized',
      \ })
