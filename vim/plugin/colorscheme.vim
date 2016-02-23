" plugin/coloscheme.vim

" Enable syntax highlighting if supported by the current version
if has('syntax') && !exists('g:syntax_on')

  syntax enable                       " Enable syntax processing
  colorscheme solarized               " Select color theme to use

endif

" Customize color scheme for terminal-vim
if !has('gui_running')

  " Improve styling of concealed text in html/markdown
  hi link htmlBold Question
  hi link htmlItalic Question

endif
