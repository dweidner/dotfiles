" plugin/colorscheme.vim
"
" @file Configuration of the color scheme


" Enable true colors if supported by the current environment
if dw#IsSupported('truecolors')
  set termguicolors
endif

" Use Atom One Light color scheme if installed via package manager
if dw#IsInstalled('vim-one')
  if $TERM_PROGRAM ==# 'Apple_Terminal'
    autocmd vimrc ColorScheme one
          \ hi Normal ctermbg=NONE |
          \ hi link NeomakeError SpellBad |
          \ hi link NeomakeWarning SpellCap |
          \ hi SignifySignAdd ctermbg=255 guibg=#fafafa |
          \ hi SignifySignChange ctermbg=255 guibg=#fafafa |
          \ hi SignifySignDelete ctermbg=255 guibg=#fafafa
  endif

  colorscheme one
endif
