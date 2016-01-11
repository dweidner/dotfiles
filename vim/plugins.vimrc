" PLUGINS.VIMRC

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()              " Load plugins in bundle directory
call pathogen#helptags()            " Generate help tags for bundles


" -----------------------------------------------------
"
" NOTE:
" Plugins are listed solely for documentation purposes
"
" Improve syntax highlighting
" Plugin "othree/html5.vim"
" Plugin "hail2u/vim-css3-syntax"
" Plugin "jelera/vim-javascript-syntax"
" Plugin "evidens/vim-twig"
" Plugin "cakebaker/scss-syntax"
"
" File searching
" Plugin "mileszs/ack.vim"
" Plugin "ctrlpvim/ctrlp.vim"
"
" User Interface Improvements
" Plugin "altercation/vim-colors-solarized"
" Plugin "itchyny/lightline.vim"
" Plugin "ervandew/supertab"
"
" [Web] Development
" Plugin "airblade/vim-gitgutter"
" Plugin "scrooloose/syntastic.git"
" Plugin "ludovicchabant/vim-gutentags"
" Plugin "mattn/emmet-vim"
" Plugin "cohama/vim-lexima"
" Plugin "tpope/vim-surround"
" Plugin "itspriddle/vim-stripper"
"
" Misc
" Plugin "tpope/vim-dispatch"
" Plugin "christoomey/vim-tmux-navigator"
" Plugin "tmux-plugins/vim-tmux-focus-events"
"
" -----------------------------------------------------


" The Silver Searcher settings
if executable('ag')
  let g:ackprg='ag --vimgrep'
  let g:ack_use_dispatch=1
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  " let g:ctrlp_use_caching=0
endif


" NetRW settings
let g:netrw_banner=0                " Hide the banner in netrw
let g:netrw_altv=1                  " Split window to the right
let g:netrw_alto=1                  " Split window to the bottom


" Syntastic settings
let g:syntastic_error_symbol='•'    " Customize error symbol
let g:syntastic_warning_symbol='!'  " Customize warning symbol
let g:syntastic_check_on_open=1     " Run syntax check when opening a file
let g:syntastic_check_on_wq=0       " Avoid running tests on close

let g:syntastic_html_tidy_ignore_errors = [
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  '<script> escaping malformed URI reference',
    \  '</head> isn''t allowed in <body> elements'
    \ ]


" Gutentags settings
let g:gutentags_tagfile='.tags'


" Load matchit.vim which is shipped with vim
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

