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
          \ hi Normal guibg=NONE ctermbg=NONE |
          \ hi SignifySignAdd guibg=#fafafa ctermbg=255 |
          \ hi SignifySignChange guibg=#fafafa ctermbg=255 |
          \ hi SignifySignDelete guibg=#fafafa ctermbg=255
  endif

  colorscheme one
endif
