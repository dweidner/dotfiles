" BUNDLES.VIMRC

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()                        " Load plugins from directory
call pathogen#helptags()                      " Generate help tags for bundles

" -----------------------------------
" NOTE:
" Plugins are listed solely for
" documentation purposes
" -----------------------------------
"
" Improve syntax highlighting
" Plugin "hail2u/vim-css3-syntax"
" Plugin "cakebaker/scss-syntax.vim"
" Plugin "pangloss/vim-javascript"
" Plugin "evidens/vim-twig"
" Plugin "tpope/vim-markdown"
"
" Language extensions
" Plugin "othree/html5.vim"                   " HTML5 & SVG omnicomplete
" Plugin "shawncplus/phpcomplete.vim"         " PHP omnicomplete
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
" Plugin "rizzatti/dash.vim"                  " Search docset in Dash.app
"
" Misc
" Plugin "airblade/vim-rooter"                " Smart working directory
" Plugin "tpope/vim-dispatch"                 " Async commands
" Plugin "tpope/vim-eunuch"                   " Unix utilities in vim
" Plugin "tpope/vim-repeat"                   " Repeat plugin commands
" Plugin "benmills/vimux"                     " Run commands in tmux pane
" Plugin "christoomey/vim-tmux-navigator"     " Navigate between tmux and vim
" Plugin "tmux-plugins/vim-tmux-focus-events" " Fix focus events in tmux
"
" -----------------------------------
