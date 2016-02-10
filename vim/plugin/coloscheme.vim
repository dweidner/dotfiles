" plugin/coloscheme.vim

if has('gui_running')

    let g:solarized_italic = 1        " Turn on italics
    let g:solarized_bold = 0          " Turn off bold fonts in solarized

endif

if has('syntax') && !exists('g:syntax_on')

  syntax enable                       " Enable syntax processing
  colorscheme solarized               " Select color theme to use

  if match($THEME, 'Dark') != -1
    set background=dark               " Use dark variant of the theme
  else
    set background=light              " Use light variant of the theme (default)
  endif

endif
