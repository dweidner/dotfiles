" config/keymappings.vim

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

" Ensure that InsertLeave is fired, when quiting insert mode with Ctrl-C
inoremap <C-C> <Esc>

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

" German Keyboard: Jump to the definition of the keyword under the cursor
nnoremap <Leader>+ <C-]>


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

" Delete the buffer but try to keep the split window intact
nnoremap <silent> <leader>bd :lclose<bar>b#<bar>bd #<CR>


" 5. Search/Replace ------------------- {{{1

" Search (for word under the cursor) with Ack.vim
nnoremap <Leader>f ::call inputsave()<Bar>let s=input("Search: ", expand("<cword>"))<Bar>call inputrestore()<Bar>silent exe "Ack '".s."'"<CR>

" Highlight word at cursor without changing current position
" @see <https://github.com/jasoncodes/dotfiles>
map  <silent> <Leader>h ::let view=winsaveview()<CR>*:call winrestview(view)<CR>
vmap <silent> <Leader>h ::<C-u>let view=winsaveview()<CR>gv*:<C-u>call winrestview(view)<CR>
map  <silent> <Leader>H <Leader>h:AckFromSearch!<CR>

" Hide matches from previous search
noremap <silent> <Leader>/ :nohls<CR>
noremap <silent> <Leader>- :nohls<CR>

" Shortcuts to vim's :substitute
" TIP: Using @ as a separator to allow to searching for /
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
