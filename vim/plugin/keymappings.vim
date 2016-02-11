" plugin/keymappings.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. General Mappings
" 2. Movement
" 3. Window/Buffer Management
" 4. Word Operations
" 5. Line Operations
" 6. User Interface
" -------------------------------------


" 1. General Mappings ----------------- {{{1

" Using space as leader makes sense, as it is easy to reach and does not have a
" special meaning (in vim’s normal mode). Unfortunatly with space as leader
" nothing is displayed, when using showmode. As a workaround we simply map
" space to the default leader key.
map <Space> <Leader>

" Avoid the escape key
ino jj <Esc>

" Reselect visual block after indent/outdent
xn < <gv
xn > >gv


" 2. Movement ------------------------- {{{1

" Make [,],{,} accessible on german keyboards
map ö [
map ä ]
map Ö {
map Ä }

" Move to the beginning/end of the line (default: top/bottom window)
" @see <https://bitbucket.org/sjl/dotfiles/src>
nn H ^
nn L $
vn L g_

" Faster linewise scrolling
nn <C-e> 3<C-e>
nn <C-y> 3<C-y>

" Move between display lines instead of numbered lines
nn <Up> gk
nn <Down> gj


" 3. Window/Buffer Management --------- {{{1

" Split window vertically/horizontally
nn <Leader>wv <C-w>v<C-w>l
nn <Leader>ws <C-w>s<C-w>j

" Switch to alternate buffer
nn <Leader><Space> <C-^>

" Switch to next buffer
nn <silent> <Leader><Tab> :bnext<CR>

" Close current buffer and location list
nn <silent> <Leader>bd :lclose<CR>:bdelete<CR>


" 4. Word Operations ------------------ {{{1

" Convert word to lower/uppercase
nn <Leader>u mQviwU`Q
nn <Leader>l mQviwu`Q

" Increment/decrement numbers
nn + <C-a>
nn - <C-x>


" 5. Line Operations ------------------ {{{1

" Remove line, but do not write it to the erase buffer
nn <Leader>x "_dd

" Swap lines using vim-unimpaired
" @see <https://github.com/davidosomething/dotfiles>
nmap <special> <C-k> [e
nmap <special> <C-j> ]e
vmap <special> <C-k> [egv
vmap <special> <C-j> ]egv


" 6. User Interface ------------------- {{{1

" Toggle paste mode
set pastetoggle=<F4>

" Toggle numbers: No Numbers -> Absolute -> Relative
nn <silent> <F5> :let [&nu, &rnu] = [&nu+&rnu==0, &nu]<CR>

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
nn <silent> <F6> :call <sid>ToggleWrap()<CR>


" vim:foldmethod=marker:foldlevel=2
