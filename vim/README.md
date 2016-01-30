# Vim Cheat Sheet
Overview of default and custom key bindings in **VIM**.

## Cursor movement
j
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

`fx` - move to the next occurrence of *x*

`0` - move the beginning of the *line*  
`^` - move to the first character of the *line*  
`$` - move to the end of the *line*

`}` - move to next *paragraph*/*function*/*block*[¹](#todo)  
`{` - move to previous *paragraph*/*function*/*block*[¹](#todo)  

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

`Leader`+`x` - delete line without writing to the erase buffer[²](#custom)  
`Leader`+`o` - insert new *line* below, stay in normal mode[²](#custom)  
`Leader`+`O` - insert new *line* above, stay in normal mode[²](#custom)..

`y$` - copy to the end of the *line*  
`yy` - copy a *line*  
`yw` - copy word  

`p` - paste from clipboard after cursor  
`P` - paste from clipboard before cursor  

`.` - repeat last *command*  

`u` - undo last *command*  
`Ctrl`+`r` - redo last *command*  

`Leader`+`Up` - Move current *line* up  
`Leader`+`Down` - Move current *line* down  

`Leader`+`l` - convert *word* to lowercase  
`Leader`+`u` - convert *word* to uppercase  
`Leader`+`L` - convert *first letter* of word to lowercase  
`Leader`+`U` - convert *first letter* of word to uppercase  

## Insert Mode

`i` - insert before the cursor  
`I` - insert at the beginning of the *line*  
`a` - insert after the cursor  
`A` - insert at the end of the *line*  
`o` - append a new *line* below the current  
`O` - append a new *line* above the current  
`ea` - insert at the end of the *word*  

`jj` - exit *insert mode*[²](#custom)  
`jk` - exit *insert mode*[²](#custom)  

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

## Buffer Management

`Leader`+`Tab` - switch to next buffer[²](#custom)  
`Leader`+`Space` - switch to alternate buffer[²](#custom)  

## Window Management

`Ctrl`+`ws` - split window horizontally  
`Ctrl`+`wv` - split window vertically  
`Ctrl`+`ww` - switch window  
`Ctrl`+`wq` - close window  

`Leader`+`ws` - split window horizontally and move to new window[²](#custom)  
`Leader`+`wv` - split window vertically and move to new window[²](#custom)  

`Ctrl`+`wh` - switch to window on the left  
`Ctrl`+`wj` - switch to window below  
`Ctrl`+`wk` - switch to window above  
`Ctrl`+`wl` - switch to window on the right  

`Ctrl`+`e` - scroll window 3 lines down[²](#custom)  
`Ctrl`+`y` - scroll window 3 lines up[²](#custom)  

---
<a name="todo">¹</a>: In search of a better binding for a better key binding on a german keyboard  
<a name="custom">²</a>: Via custom key binding  
