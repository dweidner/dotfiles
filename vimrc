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

set nocompatible                    " Break backwards compatibility with vi
set encoding=utf-8                  " Character encoding
set ttyfast                         " Optimize for fast terminal connections
set clipboard+=unnamed              " Yank and paste to/from the * register
set fileformats=unix,dos,mac        " Support all newline formats
set history=1000                    " Increase number of commands saved

set viminfo+=n$HOME/.vim/viminfo    " Customize path of viminfo file
set backupdir=$HOME/.vim/backup/    " Centralize backups
set directory=$HOME/.vim/swap/      " Centralize swapfiles

if exists("&undodir")
  set undodir=$HOME/.vim/undo/      " Centralize undo history
endif

" Load plugins and plugin configuration
let s:pluginsrc=expand('~/.vim/plugins.vimrc')
if filereadable(s:pluginsrc)
  exec ':so ' . s:pluginsrc
endif


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
set foldmethod=marker               " Enable fold markers

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

" Customize the appearance of the status line
let s:statuslinerc=expand('~/.vim/statusline.vimrc')
if has('statusline') && filereadable(s:statuslinerc)
  exec ':so ' . s:statuslinerc
endif


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

set textwidth=80                    " Wrap lines at 80 columns (if enabled)


" 5. Indentation and Tabs ----------- {{{1

set autoindent                      " Start indentation at same cursor position
set smarttab                        " Insert blanks according to shiftwidth
set expandtab                       " Expand <Tab>s with spaces
set tabstop=4                       " For proper display of files with tabs
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

" Fast file saving
nmap <leader>w :w!<CR>

" Edit mode helpers
cno %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :split %%
map <leader>ev :vsplit %%
map <leader>et :tabe %%

" Change current directory to the path of the file in the current buffer
nmap <silent> <leader>cd :lcd %:h<CR>:pwd<CR>

" Toggle paste mode
nn <silent> <F4> :set invpaste<CR>:set paste?<CR>
ino <silent> <F4> :set <Esc>:set invpaste<CR>:set paste?<CR>

" Toggle text wrapping
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Remove trailing white space
nmap <leader>rtw :call RemoveTrailingWhitespace()<CR>

" Spell checking
nn <silent> <leader>ss :setlocal spell!<CR>:setlocal spell?<CR>
nn <leader>sn ]s
nn <leader>sp [s
nn <leader>sa zg
nn <leader>s? z=

" Convert (word|first) char to (lower|uppercase)
nn <leader>u mQviwU`Q
nn <leader>l mQviwu`Q
nn <leader>U mQgewvU`Q
nn <leader>L mQgewvu`Q

" Remove search highlighting
if maparg('<C-L>', 'n') ==# ''
  nn <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" OSX: Copy and paste to/from clipboard
if has('clipboard') && has('mac')
  vn <C-c> "*y
  vn <C-v> "*p
  vn <C-x> "*c
endif

" CtrlP: Custom key bindings
" 1. Search word under cursor
" 2. Search file by name
" 3. Search active buffers
nmap <leader>ag :Ack! <C-R>
nmap <leader>agk :Ack! <C-R>=expand('<cword>')<CR><CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>


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
let s:localrc = expand('~/.vim/local.vimrc')
if filereadable(s:localrc)
  exec ':so ' . s:localrc
endif

" }}}1

endif " version >= 700

" vim:foldmethod=marker:foldlevel=1
