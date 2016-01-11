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
" 7. File types and Auto Commands
" 8. Functions and Helpers
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

" Customize leader key
let mapleader=","

" Avoid the escape key
ino jj <Esc>
ino jk <Esc>

" Reload configuration file
map <leader>r :so $MYVIMRC<CR>

" Fast file saving
nmap <leader>w :w!<CR>

" Switch to previous file
nmap <leader><Space> <C-^>

" Change current directory to the path of the file in the current buffer
nmap <silent> <leader>cd :lcd %:h<CR>:pwd<CR>

" Edit mode helpers
" See http://vimcasts.org/e/14
cno %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :split %%
map <leader>ev :vsplit %%
map <leader>et :tabe %%

" Spell checking
nn <silent> <leader>ss :setlocal spell!<CR>:setlocal spell?<CR>
nn <leader>sn ]s
nn <leader>sp [s
nn <leader>sa zg
nn <leader>s? z=

" Insert blank line (below|above) current line
nn <leader>o mzo<Esc>`z
nn <leader>O mzO<Esc>`z

" Convert (word|first) char to (lower|uppercase)
nn <leader>u mQviwU`Q
nn <leader>l mQviwu`Q
nn <leader>U mQgewvU`Q
nn <leader>L mQgewvu`Q

" Search in files/buffers
" 1. Search word under cursor
" 2. Search file by name
" 3. Search active buffers
nmap <leader>a :Ack! 
nmap <leader>A :Ack! <C-R>=expand('<cword>')<CR><CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlPTag<CR>

" Toggle: Paste Mode
set pastetoggle=<F4>

" Toggle: Search highlighting
nn <F5> :set hlsearch!<Bar>set hlsearch?<CR>

" Toggle: Numbers
nn <silent> <F6> :let [&nu, &rnu] = [&nu+&rnu==0, &nu]<CR>

" OSX: Copy and paste to/from clipboard
if has('clipboard') && has('mac')
  vn <C-c> "*y
  vn <C-v> "*p
  vn <C-x> "*c
endif

" Run the compiler of the current file type in the background
nn <F9> :Dispatch<CR>

" Generate ctags
map <leader>ct :!ctags -R --exclude=.git --exclude=.svn --exclude=.hg --verbose=yes *<CR>

" Remove search highlighting when clearing
if maparg('<C-L>', 'n') ==# ''
  nn <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


" 7. File Types and Auto Commands ---- {{{1

augroup vimrc_autocmds

  " Remove all existing commands in this group
  au!

  " Remember cursor position, except for commit messages
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")| exe "normal! g`\"" | endif"`'")"'")

  " Text Writing:
  " 1. Wrap lines characters
  " 2. Enable spell checking by default
  au BufNewFile,BufReadPost *.md set filetype=markdown
  au Filetype text,markdown,gitcommit setlocal wrap textwidth=72
  au FileType text,markdown,gitcommit setlocal spell spelllang=en_us,de_de

  " Development:
  " 1. Use tab to expand emmet abbreviation.
  " 2. Remove trailing spaces.
  let g:user_emmet_install_global = 0
  au FileType html,html.twig,php,css,scss,sass EmmetInstall
  au FileType html,php,css,scss,sass,js autocmd BufWritePre <buffer> :call RemoveTrailingWhitespace()

augroup END


" 8. Functions and Helpers ---------- {{{1

" Helper function to remove all trailing spaces in a buffer
function! RemoveTrailingWhitespace()
  let l:cursor_pos = getpos('.')
  silent! %s/\s\+$//
  call setpos('.', l:cursor_pos)
endfunc

" Load local vimrc if available
if filereadable($VIMHOME.'/local.vimrc')
  source $VIMHOME/local.vimrc
endif

" }}}1

endif " version >= 700

" vim:foldmethod=marker:foldlevel=1
