" .VIMRC

if version >= 700                   " Ignore configuration on older systems

" -----------------------------------
" Table of Contents
" -----------------------------------
" 1. General Settings
" 2. User Interface
" 3. Syntax Highlighting
" 4. Text Editing and Searching
" 5. Indentation and Tabs
" 6. Keybindings
" 7. File Types and Auto Commands
" 8. Private Configuration
" -----------------------------------

" 1. General Settings --------------- {{{1

let $VIMHOME=$HOME.'/.vim'

set nocompatible                    " Break backwards compatibility with vi
set encoding=utf-8                  " Character encoding
set clipboard+=unnamed              " Use system clipboard by default
set fileformats=unix,dos,mac        " Support all newline formats
set history=1000                    " Increase number of commands saved

set viminfo+=n$VIMHOME/viminfo      " Customize path of viminfo file
set backupdir=$VIMHOME/backup/      " Centralize backups
set directory=$VIMHOME/swap/        " Centralize swapfiles

if exists("&undodir")
  set undodir=$VIMHOME/undo/        " Centralize undo history
endif

" Load plugins and plugin configuration
source $VIMHOME/plugins.vimrc


" 2. User Interface ----------------- {{{1

if has('gui_running')

  set guifont=Menlo\ Regular:h15    " Select font to use
  set linespace=2                   " Increase spacing between lines
  let g:solarized_bold=0            " Turn off bold fonts

endif

set title                           " Allow vim to customize the title
set number                          " Show line numbers
set cursorline                      " Highlight current line
set hidden                          " Hide modified buffers without complaining
set showmatch                       " Highlight matching parenthesis
set shortmess=atI                   " Shorten messages
set foldenable                      " Enable folding

set laststatus=2                    " Always display the status line
set ruler                           " Display cursor position
set showcmd                         " Show currently running command
set noshowmode                      " Mode is displayed in lightline already

set wildmenu                        " Visual autocomplete for command menu
set wildmode=list:longest           " Set wildmenu to list choices

set list                            " Show invisible characters
set listchars=tab:▸\                " Show tab stops
set listchars+=trail:·              " Show trailing spaces
set listchars+=nbsp:_               " Show non breaking spaces
set listchars+=extends:»            " Line continues off-screen
set listchars+=precedes:«           " Line precedes off-screen
"set listchars+=eol:¬               " Show end of line markers

set splitbelow                      " Split to the bottom of the current window
set splitright                      " Split to the right of the current window

set scrolloff=1                     " Min. lines to keep above/below the cursor
set sidescrolloff=5                 " Min. cols to keep left/right of the cursor
set display+=lastline               " Keep as much as possible

set mouse +=a                       " Enable mouse support. Shame on me...
if &term =~ '^screen'
  set ttymouse=xterm2               " Enable extended mouse support.
endif

" Use a bar-shaped cursor for insert mode (if supported).
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Customize the appearance of the status line
source $VIMHOME/statusline.vimrc


" 3. Syntax Highlighting ------------ {{{1

if has('syntax') && !exists('g:syntax_on')

  syntax enable                     " Enable syntax processing

  if match($THEME, 'Dark') != -1
    set background=light            " Use dark variant of the theme
    colorscheme solarized           " Select color theme to use
  else
    set background=light            " Use light variant of the theme (default)
    colorscheme solarized           " Select color theme to use
  endif

endif


" 4. Text Editing and Searching ----- {{{1

set nostartofline                   " Do not reset cursor position
set backspace=2                     " Equivalent to backspace=indent,eol,start

set incsearch                       " Highlight dynamically while typing
set ignorecase                      " Ignore case when searching
set smartcase                       " Be case-sensitive when using capitals

set nowrap                          " Avoid wrapping lines
set textwidth=80                    " Wrap lines at 80 columns (if enabled)


" 5. Indentation and Tabs ----------- {{{1

set autoindent                      " Start indentation at same cursor position
set smarttab                        " Insert blanks according to shiftwidth
set expandtab                       " Expand <Tab>s with spaces
set tabstop=2                       " For proper display of files with tabs
set shiftwidth=2                    " Spaces for each tab stop of (auto)indent
set softtabstop=2                   " Set virtual tab stop
set shiftround                      " Round indents to multiple of shiftwidth

filetype plugin indent on           " Load plugins/indentation per file type


" 6. Keybindings -------------------- {{{1

" a) General ---------------- {{{2

" Customize leader key
let mapleader=","

" Avoid the escape key
ino jj <Esc>
ino jk <Esc>

" Reload configuration file
map <leader>r :so $MYVIMRC<CR>

" Expand %% to directory containing the current file
" See http://vimcasts.org/e/14
cno %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" b) Buffers ---------------- {{{2

" Switch to previous buffer
nmap <leader><Space> <C-^>

" Search in buffer list using CtrlP
nmap <leader>b :CtrlPBuffer<CR>

" Write current buffer to file
nmap <leader>w :w!<CR>

" c) File Searching --------- {{{2

" Ack: Search for file containing word
map <leader>a :Ack!
map <leader>A :Ack! <C-R>=expand('<cword>')<CR><CR>

" Search files in project
map <leader>f :CtrlP<CR>

" Search ctags (in current buffer)
map <leader>t :CtrlPTag<CR>
map <leader>T :CtrlPBufTag<CR>

" Search most recent used files
map <leader>mr :CtrlPMRU<CR>

" d) Word Manipulation ------ {{{2

" Convert word to lower/uppercase
nn <leader>u mQviwU`Q
nn <leader>l mQviwu`Q

" Convert first character to lower/uppercase
nn <leader>U mQgewvU`Q
nn <leader>L mQgewvu`Q

" e) Line Manipulation ------ {{{2

" Insert blank line below/above current line
nn <leader>o mzo<Esc>`z
nn <leader>O mzO<Esc>`z

" Remove line, but do not write it to the erase buffer
nn <leader>x "_dd

" Move current line up/down
nn <leader>mj :m .+1<CR>==
nn <leader>mk :m .-2<CR>==
ino <leader>mj <Esc>:m .+1<CR>==gi
ino <leader>mk <Esc>:m .-2<CR>==gi

" f) Spell checking --------- {{{2

" Toggle spell checking
nn <silent> <leader>ss :setlocal spell!<CR>:setlocal spell?<CR>

" Navigate spelling erros
nn <leader>sn ]s
nn <leader>sp [s

" Open dictionary
nn <leader>s? z=

" Add word to dictionary
nn <leader>sa zg

" g) Clipboard -------------- {{{2

" Copy to clipboard
if has('clipboard') && has('mac')
  vn <C-c> "*y
  vn <C-v> "*p
  vn <C-x> "*c
endif

" h) Misc ------------------- {{{2

" Toggle paste mode
set pastetoggle=<F4>

" Toggle search highlighting
nn <F5> :set hlsearch!<Bar>set hlsearch?<CR>

" Toggle numbers: No Numbers -> Absolute -> Relative
nn <silent> <F6> :let [&nu, &rnu] = [&nu+&rnu==0, &nu]<CR>

" Run the compiler of the current file type in the background
nn <F9> :Dispatch<CR>


" 7. File Types and Auto Commands ---- {{{1

augroup vimrc_autocmds

  " a) General -------------- {{{2

  " Avoid binding commands twice when sourcing vimrc
  au!

  " Remember cursor position, except for commit messages
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")| exe "normal! g`\"" | endif"`'")"'")

  " b) Text Writing --------- {{{2

  " Wrap lines to improve readability of text documents
  au BufNewFile,BufReadPost *.md set filetype=markdown
  au Filetype text,markdown,gitcommit setlocal wrap textwidth=72
  au FileType text,markdown,gitcommit setlocal spell spelllang=en_us,de_de

  " c) Development ---------- {{{2

  " Enable emmet for specifc file types only
  let g:user_emmet_install_global = 0
  au FileType html,html.twig,php,css,scss,sass EmmetInstall

augroup END

" 8. Private Configuration ----------- {{{1

" Load local vimrc if available
if filereadable($VIMHOME.'/local.vimrc')
  source $VIMHOME/local.vimrc
endif

" }}}1

endif " version >= 700

" vim:foldmethod=marker:foldlevel=1
