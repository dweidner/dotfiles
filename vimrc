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
" 6. Key bindings
" 7. Custom Functions
" 8. File Types and Auto Commands
" 9. Private Configuration
" -----------------------------------

" 1. General Settings --------------- {{{1

let $VIMHOME=$HOME.'/.vim'

set nocompatible                    " Break backwards compatibility with vi
set encoding=utf-8                  " Character encoding
set ttyfast                         " Optimize for fast terminal connection
set clipboard+=unnamed              " Use system clipboard by default
set fileformats=unix,dos,mac        " Support all newline formats
set history=1000                    " Increase number of commands saved

set viminfo+=n$VIMHOME/viminfo      " Customize path of viminfo file
set backupdir=$VIMHOME/backup//     " Centralize backups
set directory=$VIMHOME/swap//       " Centralize swapfiles

if exists("&undodir")
  set undodir=$VIMHOME/undo//       " Centralize undo history
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
set pumheight=10                    " Limit the visible entries of the popup menu

set wildmenu                        " Visual autocomplete for command menu
set wildmode=list:longest           " Set wildmenu to list choices

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.tiff,*.psd
set wildignore+=*.zip,*.tar,*.tar.gz,*.dmg
set wildignore+=*.pdf,*.doc,*.docx,*.xls,*.xlsx,*.ppt,*.pptx
set wildignore+=*.mp3,*.mp4,*.mov
set wildignore+=*.gem,gems/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
set wildignore+=*/tmp/**,.DS_Store,Icon

set list                            " Show invisible characters
set listchars=tab:▸\                " Show tab stops
set listchars+=trail:·              " Show trailing spaces
set listchars+=nbsp:_               " Show non breaking spaces
set listchars+=extends:»            " Line continues off-screen
set listchars+=precedes:«           " Line precedes off-screen
"set listchars+=eol:¬               " Show end of line markers

set fillchars-=fold                 " Remove fillchars for folds
set showbreak=↪                     " Show line breaks

set splitbelow                      " Split to the bottom of the current window
set splitright                      " Split to the right of the current window

set scrolloff=3                     " Min. lines to keep above/below the cursor
set sidescrolloff=5                 " Min. cols to keep left/right of the cursor
set display+=lastline               " Keep as much as possible

set mouse=a ttymouse=xterm2         " Enable mouse support. Shame on me...

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

set nowrap                          " No line wrapping by default
set textwidth=0                     " Avoid line breaks when pasting

set completeopt=longest,menuone     " Do not select the first entry in popup menu
set spelllang=en_us,de_de           " Languages to use for spell checks


" 5. Indentation and Tabs ----------- {{{1

set autoindent                      " Start indentation at same cursor position
set smarttab                        " Insert blanks according to shiftwidth
set expandtab                       " Expand <Tab>s with spaces
set tabstop=2                       " For proper display of files with tabs
set shiftwidth=2                    " Spaces for each tab stop of (auto)indent
set softtabstop=2                   " Set virtual tab stop
set shiftround                      " Round indents to multiple of shiftwidth

filetype plugin indent on           " Load plugins/indentation per file type


" 6. Key bindings -------------------- {{{1

" a) General ---------------- {{{2

" Customize leader key
let mapleader=","

" Avoid the escape key
ino jj <Esc>
ino jk <Esc>

" Expand %% to directory of the current file
" See http://vimcasts.org/e/14
cno %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" Edit in window/split/vsplit/tab
nmap <leader>ew :e %%
nmap <leader>es :split %%
nmap <leader>ev :vsplit %%
nmap <leader>et :tabe %%

" Reload/edit configuration file
nn <leader>r :so $MYVIMRC<CR>

" Write buffer to file
nn <leader>w :w!<CR>

" b) Movement --------------- {{{2

" Switch to previous buffer
nn <leader><Space> <C-^>

" Search in buffer list using CtrlP
nn <leader>b :CtrlPBuffer<CR>

" Move between display lines instead of numbered lines
nn <Up> gk
nn <Down> gj

" Jump to tag/subject and back
nn t <C-]>
nn <C-t> <C-O>

" c) File Searching --------- {{{2

" Search for file containing word using ag/ack
nn <leader>a :Ack!
nn <leader>A :Ack! <C-R>=expand('<cword>')<CR><CR>

" Search files in project
nn <leader>f :CtrlP<CR>

" Search most recent used files
nn <leader>F :CtrlPMRU

" Search ctags (in current buffer)
nn <leader>t :CtrlPTag<CR>
nn <leader>T :CtrlPBufTag<CR>

" Clear cache
nn <silent> <leader>cc :CtrlPClearAllCaches<CR>

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
vn <leader>mj :m '>+1<CR>gv=gv
vn <leader>mk :m '<-2<CR>gv=gv

" f) Spell checking --------- {{{2

" Toggle spell checking
nn <silent> <leader>ss :setlocal spell!<CR>:setlocal spell?<CR>

" Navigate spelling errors
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

" Toggle soft wrapping of lines
nn <silent> <F7> :call ToggleWrap()<CR>

" Run the compiler of the current file type in the background
nn <F9> :Dispatch<CR>

" Toggle comments. German keyboard... u know? :(
nn <silent> <leader>7 :Commentary<CR>


" 7. Custom Functions --------------- {{{1

" Toggle soft line wrapping
function! ToggleWrap()
  if &wrap
    " Disable soft wrapping
    set nowrap nolinebreak list
    echo "nowrap"
  else
    " Enable soft wrapping
    set wrap linebreak nolist
    echo "  wrap"
  endif
endfunction


" 8. File Types and Auto Commands --- {{{1

augroup vimrc_autocmds

  " a) General -------------- {{{2

  " Avoid binding commands twice when sourcing vimrc
  au!

  " Remember cursor position, except for commit messages
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")| exe "normal! g`\"" | endif"`'")"'")

  " b) Text Writing --------- {{{2

  " Wrap lines to improve readability of text documents
  au BufNewFile,BufReadPost *.md set filetype=markdown
  au Filetype text,markdown,gitcommit setlocal wrap linebreak textwidth=72
  au FileType text,markdown,gitcommit setlocal spell spelllang=en_us,de_de

  " c) (Web) Development ---- {{{2

  " Enable emmet for specific file types only
  let g:user_emmet_install_global = 0
  au FileType html,html.twig,php,css,scss,sass EmmetInstall

augroup END


" 9. Private Configuration ---------- {{{1

" Load local vimrc if available
if filereadable($VIMHOME.'/local.vimrc')
  source $VIMHOME/local.vimrc
endif

" }}}1

endif " version >= 700

" vim:foldmethod=marker:foldlevel=2
