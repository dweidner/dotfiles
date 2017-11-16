# Tmux Cheat Sheet
Overview of default and custom key bindings in **TMUX**.

`Ctrl` + `Space` - Custom Prefix  
`Ctrl` + `A` - Custom Prefix2

## Sessions Management

`Prefix` + `$` - Rename *session*  
`Prefix` + `d` - Detach from current *session*  
`Prefix` + `s` - Show all active *sessions*  
`Prefix` + `(` - Switch to previous *session*  
`Prefix` + `)` - Switch to next *session*

## Window Management

`Prefix` + `c` - Create new *window*  
`Prefix` + `,` - Rename *window*  
`Prefix` + `&` - Close current *window*  
`Prefix` + `p` - Switch to previous *window*  
`Prefix` + `n` - Switch to next *window*  

`Prefix` + `Space` - Switch to last active *window*[¹](#custom)  
`Prefix` + `0` … `9` - Switch to *window* by number  

## Pane Management

`Prefix` + `;` - Switch to last active *pane*  
`Prefix` + `%` - Split *pane* vertically  
`Prefix` + `v` - Split *pane* vertically[¹](#custom)  
`Prefix` + `"` - Split *pane* horizontally  
`Prefix` + `s` - Split *pane* horizontally[¹](#custom)  
`Prefix` + `{` - Move current *pane* left  
`Prefix` + `}` - Move current *pane* right  
`Prefix` + `z` - Zoom current *pane*  
`Prefix` + `x` - Close current *pane*  
`Prefix` + `!` - Convert current *pane* into a *window*  
`Prefix` + `=` - Synchronize *panes*  

`Prefix` + `h` - Select *pane* on the left[¹](#custom)  
`Prefix` + `j` - Select *pane* below[¹](#custom)  
`Prefix` + `k` - Select *pane* above[¹](#custom)  
`Prefix` + `l` - Select *pane* on the right[¹](#custom)  

`Prefix` + `H` - Resize *pane* to the left[¹](#custom)  
`Prefix` + `J` - Resize *pane* in the up direction[¹](#custom)  
`Prefix` + `K` - Resize *pane* in the down direction[¹](#custom)  
`Prefix` + `L` - Resize *pane* to the right[¹](#custom)  

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

`o` - Open *selection* with default program[²](#open)  
`Ctrl`-`o` - Open *selection* with `$EDITOR`[²](#open)  

`Space` - Start *selection*  
`Enter` - Copy *selection*  
`Esc` - Clear *selection*  

`y` - Copy *selection* to system clipboard[³](#yank)  
`Y` - Copy *selection* and paste it to the command line[³](#yank)  

## Misc

`Prefix` + `[` - Enter *copy mode*  
`Prefix` + `:` - Enter *command mode*  
`Prefix` + `r` - Reload tmux configuration  

<a name="custom">¹</a>: Via custom key binding  
<a name="open">²</a>: Via [tmux-open](https://github.com/tmux-plugins/tmux-open)  
<a name="yank">³</a>: Via [tmux-yank](https://github.com/tmux-plugins/tmux-yank)  
