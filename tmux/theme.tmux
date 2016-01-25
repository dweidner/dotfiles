# THEME.TMUX

# 1. Status Bar Information ----------- {{{1

set -g status-utf8 on
set -g status-justify left
set -g status-position top

set -g status-left ""
set -g status-left-length 0
set -g status-right "#{prefix_highlight} #[fg=default,underscore]#{session_name}#[fg=default,nounderscore] "
set -g status-right-length 25

setw -g window-status-format " #{window_index} #{window_name} "
setw -g window-status-current-format " #{window_index} #{window_name}#{?window_zoomed_flag, ⌕,} "


# 2. Theme: Solarized Light ----------- {{{1

set -g status-style fg=default,bg=white
set -g pane-border-style fg=default
set -g pane-active-border-style fg=blue,bright
set -g message-style fg=blue,bg=white
setw -g window-status-style fg=default
setw -g window-status-current-style fg=black,bg=brightwhite
setw -g mode-style fg=default,bg=white
setw -g clock-mode-colour blue
setw -g clock-mode-style 24


# 3. Theme: Solarized Dark ------------ {{{1

# set -g status-style fg=default,bg=black
# set -g pane-border-style fg=default
# set -g pane-active-boder-style fg=blue,bright
# set -g message-style fg=blue,bg=black
# setw -g window-status-style fg=default
# setw -g window-status-current-style fg=white,bg=brightblack
# setw -g mode-style fg=default,bg=black
# setw -g clock-mode-colour blue
# setw -g clock-mode-style 24


# vim:foldmethod=marker:foldlevel=2
