" plugin/plugin.fzf.vim
"
" @file Configuration of the fuzzy finder
"
" -----------------------------------------------------------------------
" Table of Contents
" -----------------------------------------------------------------------
"  1. Configuration
"  2. Keybindings
"  3. Actions
"  4. Commands
" -----------------------------------------------------------------------

if !dw#IsLoaded('fzf.vim') | finish | endif


" (1) Configuration ----------------------------------------------------- {{{1

" Add a prefix to the default commands to avoid conflicts
let g:fzf_command_prefix = 'FZF'

" Customize the default layout of the FZF windows
let g:fzf_layout = { 'down': '~50%' }

" A map of key bindings available within the fzf window
let g:fzf_action = {
      \   'ctrl-t': 'tab split',
      \   'ctrl-v': 'vsplit',
      \   'ctrl-x': 'split',
      \ }

" Define the positon and size of the preview window
let s:fzf_preview = 'right:50%:hidden'

" Determine the command to use for search operations
if executable('rg')
  let s:fzf_grep_command = 'rg --column --line-number --no-heading --color=always'
elseif executable('ag')
  let s:fzf_grep_command = 'ag --column --nogroup --color'
else
  let s:fzf_grep_command = 'grep -r --line-number --color=always'
endif


" (2) Keybindings ------------------------------------------------------- {{{1

" Custom keybindings for some of the FZF commands
noremap <silent> <C-t> :FZFFiles<CR>
noremap <silent> <Leader>b :FZFBuffers<CR>
noremap <silent> <Leader>c :FZFGrep<CR>
noremap <silent> <Leader>e :FZFFiles<CR>
noremap <silent> <Leader>E :FZFHistory<CR>
noremap <silent> <Leader>r :FZFTags<CR>
noremap <silent> <Leader>R :FZFBTags<CR>


" (3) Actions ----------------------------------------------------------- {{{1

" Add the selected lines in the fzf window to the location window.
function! s:AddToLocationWindow(lines) abort
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'), 'a')
  lopen
endfunction

" Add the selected lines in the fzf window to the quickfix window.
function! s:AddToQuickfixWindow(lines) abort
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'), 'a')
  copen
endfunction

let g:fzf_action = extend(g:fzf_action, {
      \   'ctrl-l': function('s:AddToLocationWindow'),
      \   'ctrl-q': function('s:AddToQuickfixWindow'),
      \ })


" (4) Commands ---------------------------------------------------------- {{{1

" Overwrite the default Files command to add a preview window
command! -bang -nargs=? -complete=dir FZFFiles
      \ call fzf#vim#files(
      \   <q-args>,
      \   fzf#vim#with_preview(s:fzf_preview),
      \   <bang>0
      \ )

" Create a custom command to search file contents by query string
command! -bang -nargs=* FZFGrep
      \ call fzf#vim#grep(
      \   join([
      \     s:fzf_grep_command,
      \     shellescape(<q-args>)
      \   ]),
      \   1,
      \   fzf#vim#with_preview(
      \     {
      \       'options': [
      \         '--delimiter=:',
      \         '--nth=2..',
      \         '--with-nth=1,4..'
      \       ],
      \     },
      \     s:fzf_preview
      \   ),
      \   <bang>0
      \ )

" Create a custom command to open a file from the users bookmark list
command! FZFBookmark
      \ call fzf#run(
      \   fzf#wrap(
      \     'Bookmark',
      \     fzf#vim#with_preview(
      \       {
      \         'source': dw#Bookmarks(),
      \         'options': [
      \           '--multi',
      \           '--prompt=Bm> ',
      \         ],
      \       },
      \       s:fzf_preview
      \     )
      \   )
      \ )


" vim:foldmethod=marker:foldlevel=2
