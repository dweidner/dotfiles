" PLUGINS.VIMRC

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()              " Load plugins in bundle directory
call pathogen#helptags()            " Generate help tags for bundles


" -----------------------------------
" NOTE:
" Plugins are listed solely for
" documentation purposes
" -----------------------------------
"
" Improve syntax highlighting
" Plugin "othree/html5.vim"
" Plugin "hail2u/vim-css3-syntax"
" Plugin "jelera/vim-javascript-syntax"
" Plugin "evidens/vim-twig"
" Plugin "cakebaker/scss-syntax"
"
" File searching
" Plugin "mileszs/ack.vim"                    " Search file contents
" Plugin "ctrlpvim/ctrlp.vim"                 " Navigate files/buffers
"
" User Interface Improvements
" Plugin "altercation/vim-colors-solarized"   " Color scheme of choice
" Plugin "itchyny/lightline.vim"              " Customize vim's statusline
" Plugin "ervandew/supertab"                  " Tab or Auto-Complete
"
" [Web] Development
" Plugin "scrooloose/syntastic.git"           " Check file syntax
" Plugin "mattn/emmet-vim"                    " Writing html markup
" Plugin "ludovicchabant/vim-gutentags"       " Auto-generate ctags
" Plugin "tpope/vim-fugitive"                 " Git integration
" Plugin "airblade/vim-gitgutter"             " Check for file changes
" Plugin "cohama/vim-lexima"                  " Auto close brackets
" Plugin "tpope/vim-surround"                 " Wrap text objects
" Plugin "tpope/vim-commentary"               " Toggle comments
" Plugin "itspriddle/vim-stripper"            " Remove trailing spaces
"
" Misc
" Plugin "airblade/vim-rooter"                " Smart working directory
" Plugin "tpope/vim-dispatch"                 " Async commands
" Plugin "tpope/vim-eunuch"                   " Unix utilities in vim
" Plugin "christoomey/vim-tmux-navigator"     " Navigate between tmux and
" Plugin "tmux-plugins/vim-tmux-focus-events" " Fix focus events in tmux
"
" -----------------------------------


" 1. Ack settings ------------------- {{{1

if executable('ag')
  let g:ackprg='ag --vimgrep'
  let g:ack_use_dispatch=1
endif


" 2. NetRW settings ----------------- {{{1

let g:netrw_banner=0                " Hide the banner in netrw
let g:netrw_altv=1                  " Split window to the right
let g:netrw_alto=1                  " Split window to the bottom


" 3. CtrlP settings ----------------- {{{1

let g:ctrlp_line_prefix=''          " Avoid adding a prefix to each file in the list

" Use `The Silver Searcher` if available
if executable('ag')
  let g:ctrlp_user_command = 'ag %s
    \ --nocolor --nogroup -g ""
    \ --files-with-matches
    \ --ignore=".git"
    \ --ignore=".svn"
    \ --ignore=".hg"
    \ --ignore="node_modules"'
endif


" 4. Syntastic settings ------------- {{{1

let g:syntastic_error_symbol='⨯'    " Customize error symbol
let g:syntastic_warning_symbol='▴'  " Customize warning symbol
let g:syntastic_check_on_open=1     " Run syntax check when opening a file
let g:syntastic_check_on_wq=0       " Avoid running tests on close

let g:syntastic_html_tidy_ignore_errors = [
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  '<script> escaping malformed URI reference',
    \  '</head> isn''t allowed in <body> elements'
    \ ]


" 5. Gutentags settings ------------- {{{1

let g:gutentags_tagfile='.tags'


" 6. MatchIt ------------------------ {{{1

" Load matchit.vim which is shipped with vim
if !exists('g:loaded_matchit') && findfile('bundle/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" vim:foldmethod=marker:foldlevel=1
