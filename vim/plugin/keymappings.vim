" plugin/keymappings.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. General Mappings
" 2. Movement
" 3. Window/Buffer Management
" 4. Word Operations
" 5. Line Operations
" 6. Misc
" -------------------------------------


" 1. General Mappings ----------------- {{{1

" Using space as leader makes sense, as it is easy to reach and does not have a
" special meaning (in vim’s normal mode). Unfortunatly with space as leader
" nothing is displayed, when using showmode. As a workaround we simply map
" space to the default leader key.
map <Space> <Leader>

" Avoid the escape key
inoremap jj <Esc>

" Expand %% to the same  directory of the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" Toggle paste mode
set pastetoggle=<F4>


" 2. Movement ------------------------- {{{1

" Make [,],{,} accessible on german keyboards
map ö [
map ä ]
map Ö {
map Ä }

" Jump section backward/forward
map öö [[
map ää ]]
map öä []
map äö ][

" Move to the beginning/end of the line (default: top/bottom window)
" @see <https://bitbucket.org/sjl/dotfiles/src>
nnoremap H ^
nnoremap L $
vnoremap L g_

" Faster linewise scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Move between display lines instead of numbered lines
nnoremap <Up> gk
nnoremap <Down> gj

" Quickly move between urls
" Tip: Use gx to open the highlighted url in your browser
nnoremap <silent> <buffer> [w :call util#Jump('?\(https\{-}:\/\/[^\t\n ">]*\)')<CR>
nnoremap <silent> <buffer> ]w :call util#Jump('/\(https\{-}:\/\/[^\t\n ">]*\)')<CR>


" 3. Window/Buffer Management --------- {{{1

" Split window vertically/horizontally
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s<C-w>j

" Load frequently used window layouts
nnoremap <Leader>w1 <C-w>o
nnoremap <Leader>w2 <C-w>s<C-w>k
nnoremap <Leader>w3 <C-w>s<C-w>j<C-w>v<C-w>k
nnoremap <Leader>w4 <C-w>s<C-w>v<C-w>k<C-w>v<C-w>h

" Switch to alternate buffer
nnoremap <Leader><Space> <C-^>

" Save/close/switch buffers
nnoremap <silent> <Leader>bw :w<CR>
nnoremap <silent> <Leader>bd :lc<CR>:bp<Bar>bd #<CR>
nnoremap <silent> <Leader>bN :bp<CR>
nnoremap <silent> <Leader>bn :bn<CR>

" Compare the current buffer with the staged/last saved version
nnoremap <silent> <Leader>bc :Gdiff<CR>
nnoremap <silent> <Leader>bC :DiffOrig<CR>


" 4. Word Operations ------------------ {{{1

" Increment/decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>


" 5. Line Operations ------------------ {{{1

" Remove line, but do not write it to the erase buffer
nnoremap <Leader>x "_dd

" Swap lines using vim-unimpaired
" @see <https://github.com/davidosomething/dotfiles>
nmap <special> <C-k> [e
nmap <special> <C-j> ]e
vmap <special> <C-k> [egv
vmap <special> <C-j> ]egv


" 6. Misc ----------------------------- {{{1

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Toggle distraction free writing
nnoremap <silent> <leader>z :Goyo<cr>


" vim:foldmethod=marker:foldlevel=2
