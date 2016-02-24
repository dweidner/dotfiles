# Daniel’s vimrc

These are my vim configuration files focused on Web Development in PHP and JavaScript.

![vim screenshot](http://dweidner.github.io/dotfiles/images/screenshot-vim.png)
> Screenshot of a vim instance running in Terminal.app

## Vim Cheat Sheet
Overview of default and custom key bindings in **VIM**.

### Cursor movement

`h` - move left  
`j` - move down  
`k` - move up  
`l` - move right

`gg` - move to the beginning of do the *document*  
`5G` - move to line *5* of the *document*  
`G` - move to the end of the *document*

`w` - move forwards to the beginning of a *word*  
`W` - move forwards to the beginning of a *word* (including punctuation)  
`e` - move forwards to the end of a *word*  
`E` - move forwards to the end of a *word* (including punctuation)  
`b` - move backwards to the beginning of a *word*  
`B` - move backwards to the beginning of a *word* (including punctuation)  
`ge` - move backwards to the end of a *word*  

`0` - move the beginning of the *line*  
`^` - move to the first character of the *line*  
`$` - move to the end of the *line*
`H` - move the beginning of the *line*[¹](#custom)  
`L` - move to the end of the *line*[¹](#custom)  

`{` - move to previous *paragraph*/*function*/*block*  
`}` - move to next *paragraph*/*function*/*block*  
`Ö` - move to previous *paragraph*/*function*/*block*[¹](#custom)  
`Ä` - move to next *paragraph*/*function*/*block*[¹](#custom)  

`f{char}` - move cursor to next occurrence of *char*   
`F{char}` - move cursor to previous occurrence of *char*  
`t{char}` - move cursor before next occurrence of *char*  
`T{char}` - move cursor after next occurrence of *char*  

### Operators & Text objects

```
[operator][count][modifier][action]
                 |________________|
                         |
                    [text-object]
```

**Operator:**  
`d` - delete  
`c` - change  
`y` - yank  
`~` - swap case  
`!` - filter through an external program  

**Modifier:**  
`i` - inner (exclude the boundaries)  
`a` - a (include the boundaries)  

**Action:**  
`p` - paragraph  
`s` - sentence  
`w` - word  
`t` - tag block  
`"` - double quoted string  
`'` - single quited string  
`[` - from *[* to *]* (same as `]`)  
`b` - block from *(* to *)* (same as `(`, `)`)  
`B` - block from *{* to *}* (same as `{`, `}`)  

### Editing

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

`g~{motion}` - swap case of text  
`gu{motion}` - make text lowercase  
`gU{motion}` - make text uppercase  

`[Space` - add blank line above the cursor[³](#unimpaired)  
`]Space` - add blank line below the cursor[³](#unimpaired)  
`[e` - exchange the current line with the line above[³](#unimpaired)  
`]e` - exchange the current line with the line below[³](#unimpaired)  

`Leader`+`x` - delete line without writing to the erase buffer[¹](#custom)  

### File Navigation

`gf` - edit the file whose name is under the cursor  

`[i` - show first line in current file and all included files that contain the word under the cursor  
`[I` - list all lines in current file and all included files that contain the word under the cursor  

`gd` - go to definition of word under the cursor in current file  
`g]` - list all tags that match the word under the cursor  

### Undo & Redo

`u` - undo last *command*  
`Ctrl`+`r` - redo last *command*  

`.` - repeat last *command*  
`g&` - repeat last `:s` on all lines  

`;` - repeat latest `f`, `F`, `t`, `T`  
`,` - repeat latest `f`, `F`, `t`, `T` in opposite direction  

### Copy & Paste

`y$` - copy to the end of the *line*  
`yy` - copy a *line*  
`yw` - copy word  

`p` - paste from clipboard after cursor  
`P` - paste from clipboard before cursor  

`[p` - paste from clipboard before cursor but adjust indent to current line  
`]p` - paste from clipboard after cursor but adjust indent to current line  

### Spell checking

`cos` - Toggle spell checking[³](#unimpaired)  

`[s` - move to the previous spelling mistake  
`]s` - move to the next spelling mistake  

`z=` - give spelling suggestions  
`zg` - mark word as correct  
`zw` - mark word as wrong  

`zug` - undo `zg`  
`zuw` - undo `zw`  

### Folding

`zf{motion}` - create a fold  

`zo` - open one fold under the cursor  
`zc` - close one fold under the cursor  
`zR` - Open all folds  
`zM` - close all folds  

`zj` - Move downwards to the start of the next fold  
`zk` - Move upwards to the end of the previous fold  

### Insert Mode

`i` - insert before the cursor  
`I` - insert at the beginning of the *line*  
`a` - insert after the cursor  
`A` - insert at the end of the *line*  
`o` - append a new *line* below the current  
`O` - append a new *line* above the current  
`ea` - insert at the end of the *word*  

`jj` - exit *insert mode*[¹](#custom)  

### Visual Mode

`v` - start *visual mode*  
`V` - start linewise *visual mode*  
`Ctrl`+`v` - start *visual block mode*  

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

`gv` - reselect previous selection  
`gn` - find next match of last search pattern and visual select it  
`gN` - find previous match of last search pattern and visual select it  

### Buffer Management

`Leader`+`Space` - switch to alternate buffer[¹](#custom)  

`[b` - Go to the previous buffer in buffer list (`:bprevious`)[³](#unimpaired)  
`]b` - Go to the next buffer in buffer list (`:bnext`)[³](#unimpaired)  
`[B` - Go to the first buffer in buffer list (`:bfirst`)[³](#unimpaired)  
`]B` - Go to the last buffer in buffer list (`:blast`)[³](#unimpaired)  

### Window Management

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

### [Surround](https://github.com/tpope/vim-surround)

**Normal Mode:**  
`ds` - delete a surrounding  
`cs` - change a surrounding  
`ys{motion}` - add a surrounding  
`yS{motion}` - add a surrounding and place the affected text on a new line  
`yss` - add a surrounding to the whole line  
`ySS` - add a surrounding to the whole line and place it on a new line  

**Visual Mode:**  
`s` - add a surrounding  
`S` - add a surrounding and place the selected text on a new line  

**Insert Mode**  
`Ctrl`+`s` - add a surrounding  

### [Unimpaired](https://github.com/tpope/vim-unimpaired)

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
In order to make it easier to access the `[` and `]` mappings on german keyboards `ö` or `ä` are mapped as custom binding.  

### [CtrlP](https://github.com/ctrlpvim/ctrlp.vim)

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

### [(Ack) Quickfix Window](https://github.com/mileszs/ack.vim)

`o` - open file  
`O` - open file and close quickfix window  
`t` - open file in a new tab  
`h` - open file in horizontal split  
`v` - open file in a vertical split  
`q` - close quickfix window  
`go` - preview file, keep focus on quickfix window  

---
<a name="custom">¹</a>: Via custom key binding  
<a name="commentary">²</a>: Via [vim-commentary](https://github.com/tpope/vim-commentary.git)  
<a name="unimpaired">³</a>: Via [vim-unimpaired](https://github.com/tpope/vim-unimpaired)  
