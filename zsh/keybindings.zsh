# zsh/keybindings.zsh
#
# @file Customizes zsh keybindings.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Keymappings
# 2. ZLE Commands
# -----------------------------------------------------------------------


# (1) Key Bindings ------------------------------------------------------ {{{1

zmodload zsh/terminfo zsh/complist

# Retrieve the actual key sequences from the terminfo databases,
# which works on almost all terminals on variaty of systems
typeset -A key
key=(
  "Ctrl"      '\C-'
  "Escape"    '\e'
  "Space"     ' '
  "Tab"       "${terminfo[ht]}"
  "ShiftTab"  "${terminfo[kcbt]}"
  "Home"      "${terminfo[khome]}"
  "End"       "${terminfo[kend]}"
  "Insert"    "${terminfo[kich1]}"
  "Delete"    "${terminfo[kdch1]}"
  "Up"        "${terminfo[kcuu1]}"
  "Down"      "${terminfo[kcud1]}"
  "Left"      "${terminfo[kcub1]}"
  "Right"     "${terminfo[kcuf1]}"
  "PageUp"    "${terminfo[kpp]}"
  "PageDown"  "${terminfo[knp]}"
)

# Induce silent bindkey failure by binding to an invalid UTF-8 sequence.
for k in "${(k)key[@]}"; do
  [[ -z "$key[$k]" ]] && key[$k]='�'
done

# Bind key sequences to standard Zsh Line Editor (ZLE) widgets
bindkey "${key[Space]}"     magic-space
bindkey "${key[Home]}"      beginning-of-line
bindkey "${key[End]}"       end-of-line
bindkey "${key[Left]}"      backward-char
bindkey "${key[Right]}"     forward-char
bindkey "${key[Delete]}"    delete-char
bindkey "${key[ShiftTab]}"  reverse-menu-complete

# Bind key sequences to frequently used commands
# [Ctrl]+[x]+[b|l|o|.]
bindkey -s "${key[Ctrl]}x." "^U..^M"
bindkey -s "${key[Ctrl]}xb" "^Ufb^M"
bindkey -s "${key[Ctrl]}xl" "^Ull^M"
bindkey -s "${key[Ctrl]}xo" "^Ufe^M"

# Improve history search using [Arrow Up/Down]
bindkey "${key[Up]}"    up-line-or-history
bindkey "${key[Down]}"  down-line-or-history


# (a) Keymap: Completion Menu ------------------------------------------- {{{2

# Insert the currently selected menu item, but keep the menu open
bindkey -M menuselect "+" accept-and-menu-complete

# Accept a completion and try to complete again via menu completion.
bindkey -M menuselect "${key[Ctrl]}o" accept-and-infer-next-history


# (b) Keymap: EMACS ----------------------------------------------------- {{{2

# Search history with [Ctrl]+[P/N] in EMACS mode
bindkey -M emacs "${key[Ctrl]}p"  up-line-or-history
bindkey -M emacs "${key[Ctrl]}n"  accept-or-down-line

# Select a file using fzf
if (( $+widgets[fzf-file-widget] )); then
  bindkey -M emacs "${key[Ctrl]}t" fzf-file-widget
fi

# Search command history with fzf
if (( $+widgets[fzf-history-widget] )); then
  bindkey -M emacs "${key[Ctrl]}r" fzf-history-widget
fi

# Change current working directory using fzf
if (( $+widgets[fzf-cd-widget] )); then
  bindkey -M emacs "${key[Escape]}c" fzf-cd-widget
fi

# (c) Keymap: VI -------------------------------------------------------- {{{2

# Search history with [j/k] in VIM mode
bindkey -M vicmd "k"  up-line-or-history
bindkey -M vicmd "j"  accept-or-down-line


# (2) ZLE Commands ------------------------------------------------------ {{{1

# Switch terminal into application mode when ZLE is active. This ensures
# that values from the terminfo database are valid.
function zle-line-init() {
  (( $+terminfo[smkx] )) && echoti smkx
}
zle -N zle-line-init

# Disable terminal application mode if ZLE is disabled.
function zle-line-finish() {
  (( $+terminfo[rmkx] )) && echoti rmkx
}
zle -N zle-line-finish

# Accept suggestion or search history down
function accept-or-history-substring-search-down() {
  if (( $#POSTDISPLAY )) && (( $+widgets[autosuggest-accept] )); then
    zle autosuggest-accept
  else
    zle history-substring-search-down
  fi
}
zle -N accept-or-history-substring-search-down

# Accept suggestion or move down one line in the current buffer
function accept-or-down-line() {
  if (( $#POSTDISPLAY )) && (( $+widgets[autosuggest-accept] )); then
    zle autosuggest-accept
  else
    zle down-line-or-history
  fi
}
zle -N accept-or-down-line


# vim:foldmethod=marker:foldlevel=2
