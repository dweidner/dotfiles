" plugin/keymappings.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. General Mappings
" 2. Window/Buffer Management
" 3. Word Operations
" 4. Line Operations
" 5. User Interface
" -------------------------------------

" 1. General Mappings ----------------- {{{1

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

" Move between display lines instead of numbered lines
nn <Up> gk
nn <Down> gj

" Reselect visual block after indent/outdent
xn < <gv
xn > >gv


" 2. Window/Buffer Management --------- {{{1

" Split window vertically/horizontally
nn <Leader>wv <C-w>v<C-w>l
nn <Leader>ws <C-w>s<C-w>j

" Switch to alternate buffer
nn <Leader><Space> <C-^>

" Switch to next buffer
nn <Leader><Tab> :bnext<CR>


" 3. Word Operations ------------------ {{{1

" Convert word to lower/uppercase
nn <Leader>u mQviwU`Q
nn <Leader>l mQviwu`Q

" Convert first character to lower/uppercase
nn <Leader>U mQgewvU`Q
nn <Leader>L mQgewvu`Q

" Increment/decrement numbers
nn + <C-a>
nn - <C-x>


" 4. Line Operations ------------------ {{{1

" Remove line, but do not write it to the erase buffer
nn <Leader>x "_dd

" Insert blank line below/above current line
nn <silent> <Leader>o mzo<Esc>`z
nn <silent> <Leader>O mzO<Esc>`z

" Move current line up/down
nn <Leader><Up>   :<C-u>silent! move-2<CR>==
nn <Leader><Down> :<C-u>silent! move+1<CR>==
xn <Leader><Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xn <Leader><Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv


" 5. User Interface ------------------- {{{1

" Toggle paste mode
set pastetoggle=<F4>

" Toggle search highlighting
nn <F5> :set hlsearch!<Bar>set hlsearch?<CR>

" Toggle numbers: No Numbers -> Absolute -> Relative
nn <silent> <F6> :let [&nu, &rnu] = [&nu+&rnu==0, &nu]<CR>

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
nn <silent> <F7> :call <sid>ToggleWrap()<CR>


" vim:foldmethod=marker:foldlevel=2
