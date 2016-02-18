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

map öö [[
map ää ]]

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
nnoremap <silent> <buffer> [w :call jump#Jump('?\(https\{-}:\/\/[^\t\n ">]*\)')<CR>
nnoremap <silent> <buffer> ]w :call jump#Jump('/\(https\{-}:\/\/[^\t\n ">]*\)')<CR>


" 3. Window/Buffer Management --------- {{{1

" Split window vertically/horizontally
nnoremap <Leader>wv <C-w>v<C-w>l
nnoremap <Leader>ws <C-w>s<C-w>j

" Switch to alternate buffer
nnoremap <Leader><Space> <C-^>

" Open file in new buffer/split
" @see <http://vimcasts.org/e/14>
map <silent> <Leader>ew :edit %%
map <silent> <Leader>es :split %%
map <silent> <Leader>ev :vsplit %%

" Save current buffer
nnoremap <silent> <F2> :w<CR>
inoremap <silent> <F2> <C-o>:w<CR>

" Close current buffer and location list
nnoremap <silent> <Leader>bd :lclose<CR>:bdelete<CR>


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


" vim:foldmethod=marker:foldlevel=2
