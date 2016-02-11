# Vim Cheat Sheet
Overview of default and custom key bindings in **VIM**.

## Cursor movement

`h` - move left  
`j` - move down  
`k` - move up  
`l` - move right

`gg` - move to the beginning of do the *document*  
`5G` - move to line *5* of the *document*  
`G` - move to the end of the *document*

`H` - move to the top of the *window*  
`M` - move to the middle of the *window*  
`L` - move to the bottom of the *window*

`w` - move forwards to the beginning of a *word*  
`W` - move forwards to the beginning of a *word* (including punctuation)  
`e` - move forwards to the end of a *word*  
`E` - move forwards to the end of a *word* (including punctuation)  
`b` - move backwards to the beginning of a *word*  
`B` - move backwards to the beginning of a *word* (including punctuation)

`0` - move the beginning of the *line*  
`^` - move to the first character of the *line*  
`$` - move to the end of the *line*

`{` - move to previous *paragraph*/*function*/*block*  
`}` - move to next *paragraph*/*function*/*block*  
`Ö` - move to previous *paragraph*/*function*/*block*[¹](#custom)  
`Ä` - move to next *paragraph*/*function*/*block*[¹](#custom)  

`f{char}` - move cursor to next occurrence of *char*   
`F{char}` - move cursor to previous occurrence of *char*  
`t{char}` - move cursor before next occurrence of *char*  
`T{char}` - move cursor after next occurrence of *char*  

`;` - Repeat latest `f`, `F`, `t`, `T`  
`,` - Repeat latest `f`, `F`, `t`, `T` in opposite direction  

## Editing

`r` - replace *character* under cursor  
`s` - delete *character* and substitute text  
`x` - delete *character*  

`cc` - replace entire *line*  
`cw` - replace to the end of the *word*  
`c$` - replace to the end of the *line*  

`D` - delete to the end of the *line*  
`d$` - delete to the end of the *line*  
`dd` - delete entire *line*  
`dw` - delete *word*  

`gc{motion}` - comment or uncomment lines that *motion* moves over[²](#commentary)  
`gcc` - comment or uncomment lines[²](#commentary)  

`Leader`+`x` - delete line without writing to the erase buffer[¹](#custom)  
`Leader`+`o` - insert new *line* below, stay in normal mode[¹](#custom)  
`Leader`+`O` - insert new *line* above, stay in normal mode[¹](#custom)  

`y$` - copy to the end of the *line*  
`yy` - copy a *line*  
`yw` - copy word  

`p` - paste from clipboard after cursor  
`P` - paste from clipboard before cursor  

`.` - repeat last *command*  

`u` - undo last *command*  
`Ctrl`+`r` - redo last *command*  

`Leader`+`Up` - Move current *line* up[¹](#custom)  
`Leader`+`Down` - Move current *line* down[¹](#custom)  

`Leader`+`l` - convert *word* to lowercase[¹](#custom)  
`Leader`+`u` - convert *word* to uppercase[¹](#custom)  
`Leader`+`L` - convert *first letter* of word to lowercase[¹](#custom)  
`Leader`+`U` - convert *first letter* of word to uppercase[¹](#custom)  

## Insert Mode

`i` - insert before the cursor  
`I` - insert at the beginning of the *line*  
`a` - insert after the cursor  
`A` - insert at the end of the *line*  
`o` - append a new *line* below the current  
`O` - append a new *line* above the current  
`ea` - insert at the end of the *word*  

`jj` - exit *insert mode*[¹](#custom)  
`jk` - exit *insert mode*[¹](#custom)  

## Visual Mode

`v` - start *visual mode*  
`V` - start linewise *visual mode*  
`Ctrl`+`v` - start v*isual block mode*  

`aw` - mark *word*  
`ab` - mark *block* ()  
`aB` - mark *block* {}  
`ib` - mark inner *block* ()  
`iB` - mark inner *block* {}  

`>` - shift *selection* right  
`<` - shift *selection* left  
`y` - copy *selection*  
`d` - delete *selection*  
`~` - switch case  

`gc` - comment or uncomment *selection*[²](#commentary)  

## Buffer Management

`Leader`+`Tab` - switch to next buffer[¹](#custom)  
`Leader`+`Space` - switch to alternate buffer[¹](#custom)  

## Window Management

`Ctrl`+`ws` - split window horizontally  
`Ctrl`+`wv` - split window vertically  
`Ctrl`+`ww` - switch window  
`Ctrl`+`wq` - close window  

`Leader`+`ws` - split window horizontally and move to new window[¹](#custom)  
`Leader`+`wv` - split window vertically and move to new window[¹](#custom)  

`Ctrl`+`wh` - switch to window on the left  
`Ctrl`+`wj` - switch to window below  
`Ctrl`+`wk` - switch to window above  
`Ctrl`+`wl` - switch to window on the right  

`Ctrl`+`e` - scroll window 3 lines down[¹](#custom)  
`Ctrl`+`y` - scroll window 3 lines up[¹](#custom)  

## [Unimpaired](https://github.com/tpope/vim-unimpaired)

`[a` - Edit previous file in argument list (`:previous`)  
`]a` - Edit next file in argument list (`:next`)  
`[A` - Edit first file in argument list (`:first`)  
`]A` - Edit last file in argument list (`:last`)  

`[b` - Go to the previous buffer in buffer list (`:bprevious`)  
`]b` - Go to the next buffer in buffer list (`:bnext`)  
`[B` - Go to the first buffer in buffer list (`:bfirst`)  
`]B` - Go to the last buffer in buffer list (`:blast`)  

`[l` - Display previous entry in the location list (`:lprevious`)  
`]l` - Display next entry in the location list (`:lnext`)  
`[L` - Display first entry in the location list (`:lfirst`)  
`]L` - Display last entry in the location list (`:llast`)  

`[q` - Display previous entry in the quickfix window (`:lprevious`)  
`]q` - Display next entry in the quickfix window (`:lnext`)  
`[Q` - Display first entry in the quickfix window (`:lfirst`)  
`]Q` - Display last entry in the quickfix window (`:llast`)  

`[t` - Jump to the previous matching tag (`:tprevious`)  
`]t` - Jump to the next matching tag (`:tnext`)  
`[T` - Jump to the first matching tag (`:tfirst`)  
`]T` - Jump to the last matching tag (`:tlast`)  

`[Space` - Add blank line above the cursor  
`]Space` - Add blank line below the cursor  
`[e` - Exchange the current line with the line above  
`]e` - Exchange the current line with the line below  

`cob` - Toggle background of the colorscheme (`background`)  
`coc` - Toggle highlighting of the current line (`cursorline`)  
`coh` - Toggle search higlighting (`hlsearch`)  
`cor` - Toggle relative numbers (`relativenumber`)  
`cos` - Toggle spell checker (`spell`)  
`cow` - Toggle line wrapping (`wrap`)  

**TIP:**  
In order to make the `[` and `]` mappings accessible on german keyboards you can use `ö` or `ä` respectively.  

## [CtrlP Mode](https://github.com/ctrlpvim/ctrlp.vim)

`Ctrl`+`p` - open *CtrlP*  
`Ctrl`+`c` - exit *CtrlP*  

`Ctrl`+`f` - scroll to the *next search mode* in the sequence  
`Ctrl`+`b` - scroll to the *previous search mode* in the sequence  
`Ctrl`+`j` - move *selection* down  
`Ctrl`+`k` - move *selection* up  
`Ctrl`+`d` - search by *filename* instead of *full path*  

`Ctrl`+`t` - open selected file in a new *tab*  
`Ctrl`+`v` - open file in a *vertical split*  
`Ctrl`+`s` - open file in a *horizontal split*  
`Ctrl`+`y` - create *new file* and its parent directories  

`Ctrl`+`z` - mark file  
`Ctrl`+`o` - open marked files  

# [Ack Quickfix Window](https://github.com/mileszs/ack.vim)

`o` - open file  
`O` - open file and close quickfix window  
`t` - open file in a new tab  
`h` - open file in horizontal split  
`v` - open file in a vertical split  
`q` - close quickfix window  
`go` - preview file, keep focus on quickfix window  

## System Integration

`Leader`+`d` - search for the word under the cursor in Dash.app  

---
<a name="custom">¹</a>: Via custom key binding  
<a name="commentary">²</a>: Via [vim-commentary](https://github.com/tpope/vim-commentary.git)  
