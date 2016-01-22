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
" -----------------------------------

" 1. General Settings --------------- {{{1

let $VIMHOME=$HOME.'/.vim'

set nocompatible                    " Break backwards compatibility with vi
set encoding=utf-8                  " Encoding used in vim
set ttyfast                         " Optimize for fast terminal connection
set hidden                          " Hide modified buffers without complaining
set autoread                        " Reload file if modified outside vim
set history=1000                    " Increase number of commands saved
set clipboard+=unnamed              " Use system clipboard by default
set fileformats=unix,dos,mac        " Enable automatic fileformat detection

set splitright                      " Split to the right of the current window
set splitbelow                      " Split to the bottom of the current window

set viminfo+=n$VIMHOME/viminfo      " Customize path of viminfo file
set backupdir=$VIMHOME/backup//     " Centralize backups
set directory=$VIMHOME/swap//       " Centralize swapfiles
set undodir=$VIMHOME/undo//         " Centralize undo history

source $VIMHOME/bundles.vimrc       " Load vim bundles
source $VIMHOME/settings.vimrc      " Load bundle configuration


" 2. User Interface ----------------- {{{1

if has('gui_running')

  set guifont=Menlo\ Regular:h15    " Select font to use
  set linespace=2                   " Increase spacing between lines
  let g:solarized_bold=0            " Turn off bold fonts

endif

set title                           " Allow vim to customize the title
set number                          " Show line numbers
set cursorline                      " Highlight current line
set ruler                           " Display cursor position
set showcmd                         " Show currently running command
set noshowmode                      " Mode is displayed in lightline already
set showmatch                       " Highlight matching parenthesis
set shortmess=aoOtI                 " Use abbreviation in messages

set laststatus=2                    " Always display the status line
set cmdheight=1                     " Avoid hit-enter prompts
set pumheight=10                    " Limit the visible entries of the popup menu

set list                            " Show invisible characters
set listchars=tab:▸\                " Show tab stops
set listchars+=trail:·              " Show trailing spaces
set listchars+=nbsp:_               " Show non breaking spaces
set listchars+=extends:»            " Line continues off-screen
set listchars+=precedes:«           " Line precedes off-screen
"set listchars+=eol:¬               " Show end of line markers
set showbreak=↪                     " Show line breaks

set mouse=a ttymouse=xterm2         " Enable mouse support. Shame on me...

set scrolloff=3                     " Min. lines to keep above/below the cursor
set sidescrolloff=5                 " Min. cols to keep left/right of the cursor

set wildmenu                        " Visual autocomplete for command menu
set wildmode=list:longest           " Set wildmenu to list choices and complete

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.tiff,*.psd
set wildignore+=*.zip,*.tar,*.tar.gz,*.dmg
set wildignore+=*.pdf,*.doc,*.docx,*.xls,*.xlsx,*.ppt,*.pptx
set wildignore+=*.mp3,*.mp4,*.mov
set wildignore+=*.gem,gems/**
set wildignore+=*/node_modules/**
set wildignore+=*/tmp/**,.DS_Store,Icon


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

" Using space as leader makes sense, as it is easy to reach and does not have a
" special meaning (in vim’s normal mode). Unfortunatly with space as leader
" nothing is displayed, when using showmode. As a workaround we simply map
" space to the default leader key.
map <Space> <Leader>

" Avoid the escape key
ino jj <Esc>
ino jk <Esc>

" Faster linewise scrolling
nn <C-e> 3<C-e>
nn <C-y> 3<C-y>

" Expand %d to the current day (e.g. 20160214)
cno %d <C-R>=strftime("%Y%m%d")<CR>

" Expand %% to directory of the current file
" See http://vimcasts.org/e/14
cno %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" b) Windows/Buffers -------- {{{2

" Split window vertically/horizontally
nn <Leader>wv <C-w>v<C-w>l
nn <Leader>ws <C-w>s<C-w>j

" Switch to alternate buffer
nn <Leader><Space> <C-^>

" Switch to next buffer
nn <Leader><Tab> :bnext<CR>

" Search in buffer list using CtrlP
nn <Leader>b :CtrlPBuffer<CR>

" c) File Searching --------- {{{2

" Search for file containing word using ag/ack
nn <Leader>a :Ack!
nn <Leader>A :Ack! <C-R>=expand('<cword>')<CR><CR>

" Search ctags (in current buffer)
nn <Leader>t :CtrlPBufTag<CR>

" Search most recent used files
nn <Leader>mru :CtrlPMRU<CR>

" d) Word Manipulation ------ {{{2

" Increment/decrement numbers
nn + <C-a>
nn - <C-x>

" Convert word to lower/uppercase
nn <Leader>u mQviwU`Q
nn <Leader>l mQviwu`Q

" Convert first character to lower/uppercase
nn <Leader>U mQgewvU`Q
nn <Leader>L mQgewvu`Q

" e) Line Manipulation ------ {{{2

" Insert blank line below/above current line
nn <silent> <Leader>o mzo<Esc>`z
nn <silent> <Leader>O mzO<Esc>`z

" Remove line, but do not write it to the erase buffer
nn <Leader>x "_dd

" Move current line up/down
nn <Leader><Up>   :<C-u>silent! move-2<CR>==
nn <Leader><Down> :<C-u>silent! move+1<CR>==
xn <Leader><Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xn <Leader><Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Move between display lines instead of numbered lines
nn <Up> gk
nn <Down> gj

" Reselect visual block after indent/outdent
xn < <gv
xn > >gv

" f) Development ------------ {{{2

" Jump to tag/subject and back
nn t <C-]>
nn <C-t> <C-O>

" g) Spell checking --------- {{{2

" Toggle spell checking
nn <silent> <Leader>ss :setlocal spell!<CR>:setlocal spell?<CR>

" Navigate spelling errors
nn <Leader>sn ]s
nn <Leader>sp [s

" Open dictionary
nn <Leader>s? z=

" Add word to dictionary
nn <Leader>sa zg

" Correct the last spelling error with the first suggestion
nn <Leader>sc [s1z=

" h) Utility ---------------- {{{2

" Toggle paste mode
set pastetoggle=<F4>

" Toggle search highlighting
nn <F5> :set hlsearch!<Bar>set hlsearch?<CR>

" Toggle numbers: No Numbers -> Absolute -> Relative
nn <silent> <F6> :let [&nu, &rnu] = [&nu+&rnu==0, &nu]<CR>

" Toggle soft wrapping of lines
nn <silent> <F7> :call <sid>ToggleWrap()<CR>

" Run the compiler of the current file type in the background
nn <F9> :Dispatch<CR>

" Insert the current date (e.g. Mon, 14. Feburary 2016)
nn <F10> "=strftime("%a %d. %B %Y")<CR>P
ino <F10> <C-R>=strftime("%a %d. %B %Y")<CR>


" 7. Custom Functions --------------- {{{1

" Toggle soft line wrapping
function! s:ToggleWrap()
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

augroup vimrc

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

augroup END


" }}}1

endif " version >= 700

" vim:foldmethod=marker:foldlevel=2
