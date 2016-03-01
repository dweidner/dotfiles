" plugin/keymappings.vim

" -------------------------------------
" Table of Contents
" -------------------------------------
" 1. General Mappings
" 2. Localization
" 3. Movement
" 4. Window/Buffer Management
" 5. Search/Replace
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

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Toggle paste mode
set pastetoggle=<F4>


" 2. Localization --------------------- {{{1

" German Keyboard: Square/curly bracket commands/vim-unimpaired
map ü [
map + ]
noremap Ü {
noremap * }

" German Keyboard: Section forward/backward
map üü [[
map ++ ]]
map ü+ []
map +ü ][

" German Keyboard: Make the shadowed star operator accessible via ö/Ö
noremap ö *
noremap Ö #

" German Keyboard: Single/double quotes
noremap ä '
noremap Ä "

" German Keyboard: Search forward/backward
noremap - /
noremap _ ?


" 3. Movement ------------------------- {{{1

" Move to the beginning/end of the line (default: top/bottom window)
" @see <https://bitbucket.org/sjl/dotfiles/src>
nnoremap H ^
nnoremap L $
vnoremap L g_

" Faster linewise scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" 4. Window/Buffer Management --------- {{{1

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


" 5. Search/Replace ------------------- {{{1

" Search (for word under the cursor) with Ack.vim
nnoremap <C-f> :call ack#Ack('grep<bang>', input('Search: ', expand('<cword>')))<CR>

" Search vor visually higlighted text in the current buffer
" TIP: Once highlighted you can replace the text simply with: %s//<replacement>
vnoremap <C-f> y<ESC>/<C-r>"<CR>

" Easier access to vim's :substitute
" TIP: Using @ as a separator to allow to search for /
nnoremap <Leader>s :%s@@@gc<Left><Left><Left><Left>
nnoremap <Leader>S :%s@@@g<Left><Left><Left>
vnoremap <Leader>s :<C-u>%s@\%V@@gc<Left><Left><Left><Left>
vnoremap <Leader>S :<C-u>%s@\%V@@g<Left><Left><Left>


" 6. Misc ----------------------------- {{{1

" Swap lines using vim-unimpaired
" @see <https://github.com/davidosomething/dotfiles>
nmap <special> <C-k> [e
nmap <special> <C-j> ]e
vmap <special> <C-k> [egv
vmap <special> <C-j> ]egv

" Toggle distraction free writing using Goyo
nnoremap <silent> <Leader>z :Goyo<cr>


" vim:foldmethod=marker:foldlevel=2
