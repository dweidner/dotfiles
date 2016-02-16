# Tmux Cheat Sheet
Overview of default and custom key bindings in **TMUX**.

`Ctrl` + `Space` - Custom Prefix  
`Ctrl` + `A` - Custom Prefix2

## Sessions Management

`Prefix` + `C` - Create new *session* by name[²](#sessionist)  
`Prefix` + `$` - Rename *session*  
`Prefix` + `d` - Detach from current *session*  
`Prefix` + `X` - Kill current *session* without detaching[²](#sessionist)  
`Prefix` + `s` - Show all active *sessions*  
`Prefix` + `S` - Switch to the last *session*[²](#sessionist)  
`Prefix` + `g` - Switch to *session* via prompt[²](#sessionist)  
`Prefix` + `(` - Switch to previous *session*  
`Prefix` + `)` - Switch to next *session*

## Window Management

`Prefix` + `c` - Create new *window*  
`Prefix` + `,` - Rename *window*  
`Prefix` + `&` - Close current *window*  
`Prefix` + `p` - Switch to previous *window*  
`Prefix` + `n` - Switch to next *window*  
`Prefix` + `<` - Move current *window* one position left[³](#pain-control)  
`Prefix` + `>` - Move current *window* one position right[³](#pain-control)  

`Prefix` + `Space` - Switch to last active *window*[¹](#custom)  
`Prefix` + `0` … `9` - Switch to *window* by number  

## Pane Management

`Prefix` + `;` - Switch to last active *pane*  
`Prefix` + `%` - Split *pane* vertically  
`Prefix` + `|` - Split *pane* vertically[³](#pain-control)  
`Prefix` + `"` - Split *pane* horizontally  
`Prefix` + `-` - Split *pane* horizontally[³](#pain-control)  
`Prefix` + `{` - Move current *pane* left  
`Prefix` + `}` - Move current *pane* right  
`Prefix` + `z` - Zoom current *pane*  
`Prefix` + `x` - Close current *pane*  
`Prefix` + `!` - Convert current *pane* into a *window*  
`Prefix` + `=` - Synchronize *panes*  

`Prefix` + `h` - Select *pane* on the left[³](#pain-control)  
`Prefix` + `j` - Select *pane* below[³](#pain-control)  
`Prefix` + `k` - Select *pane* above[³](#pain-control)  
`Prefix` + `l` - Select *pane* on the right[³](#pain-control)  

`Prefix` + `H` - Resize *pane* to the left[³](#pain-control)  
`Prefix` + `J` - Resize *pane* in the up direction[³](#pain-control)  
`Prefix` + `K` - Resize *pane* in the down direction[³](#pain-control)  
`Prefix` + `L` - Resize *pane* to the right[³](#pain-control)  

## Copy Mode

`q` - Quit copy mode  
`g` - Go to top line  
`G` - Go to bottom line  

`h` - Move cursor left  
`j` - Move cursor down  
`k` - Move cursor up  
`l` - Move cursor right  

`w` - Move cursor forward one word  
`b` - Move cursor backword one word  

`o` - Open *selection* with default program[⁴](#open)  
`Ctrl`-`o` - Open *selection* with `$EDITOR`[⁴](#open)  

`Space` - Start *selection*  
`Enter` - Copy *selection*  
`Esc` - Clear *selection*  

`y` - Copy *selection* to system clipboard[⁵](#yank)  
`Y` - Copy *selection* and paste it to the command line[⁵](#yank)  

## Misc

`Prefix` + `[` - Enter *copy mode*  
`Prefix` + `Enter` - Enter *copy mode*[¹](#custom)  

`Prefix` + `:` - Enter *command mode*  

`Prefix` + `Ctrl`-`f` - Enter *copycat mode*, jump over *files*[⁶](#copycat)  
`Prefix` + `Ctrl`-`g` - Enter *copycat mode*, jump over *git status files*[⁶](#copycat)  
`Prefix` + `Ctrl`-`u` - Enter *copycat mode*, jump over *urls*[⁶](#copycat)  

`Prefix` + `r` - Reload tmux configuration  

<a name="custom">¹</a>: Via custom key binding  
<a name="sessionist">²</a>: Via [tmux-sessionist](https://github.com/tmux-plugins/tmux-sessionist)  
<a name="pain-control">³</a>: Via [tmux-pain-control](https://github.com/tmux-plugins/tmux-pain-control)  
<a name="open">⁴</a>: Via [tmux-open](https://github.com/tmux-plugins/tmux-open)  
<a name="yank">⁵</a>: Via [tmux-yank](https://github.com/tmux-plugins/tmux-yank)  
<a name="copycat">⁶</a>: Via [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)  
