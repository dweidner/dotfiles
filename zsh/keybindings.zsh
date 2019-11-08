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
# [Ctrl]+[x]+[b|f|i|j|k|l|o|p|q|v|w|x|y| |,|.|-]
bindkey -s "${key[Ctrl]}x." "^U..^M"
bindkey -s "${key[Ctrl]}x:" "^Ucdl ..^M"
bindkey -s "${key[Ctrl]}x-" "^Upo^M"
bindkey -s "${key[Ctrl]}x_" "^Udirs -v^M"
bindkey -s "${key[Ctrl]}xb" "^Ufb^M"
bindkey -s "${key[Ctrl]}xi" "^Ug ll^M"
bindkey -s "${key[Ctrl]}xI" "^Ug l^M"
bindkey -s "${key[Ctrl]}xs" "^Ug ss^M"
bindkey -s "${key[Ctrl]}xS" "^Ug s^M"
bindkey -s "${key[Ctrl]}xl" "^Uls^M"
bindkey -s "${key[Ctrl]}xL" "^Ull^M"
bindkey -s "${key[Ctrl]}xo" "^Ufe^M"

# Expand global abbreviations
bindkey "${key[Ctrl]}x " dotfiles-expand-abbreviation

# Improve the behavior of the kill-word widgets for POSIX paths
bindkey "${key[Ctrl]}w" dotfiles-backward-kill-word

# Improve history search using [Arrow Up/Down]
if (( $+widgets[history-substring-search-up] )); then
  bindkey "${key[Up]}"    history-substring-search-up
  bindkey "${key[Down]}"  history-substring-search-down
else
  bindkey "${key[Up]}"    up-line-or-history
  bindkey "${key[Down]}"  down-line-or-history
fi


# (a) Completion Menu --------------------------------------------------- {{{2

# Insert the currently selected menu item, but keep the menu open
bindkey -M menuselect "+" accept-and-menu-complete

# Accept a completion and try to complete again via menu completion.
bindkey -M menuselect "${key[Ctrl]}o" accept-and-infer-next-history


# (b) EMACS mode -------------------------------------------------------- {{{2

# Search history with [Ctrl]+[P/N] in EMACS mode
if (( $+widgets[history-substring-search-up] )); then
  bindkey -M emacs "${key[Ctrl]}P"  history-substring-search-up
  bindkey -M emacs "${key[Ctrl]}N"  history-substring-search-down
else
  bindkey -M emacs "${key[Ctrl]}P"  up-line-or-history
  bindkey -M emacs "${key[Ctrl]}N"  down-line-or-history
fi


# (c) VI mode ----------------------------------------------------------- {{{2

# Search history with [j/k] in VIM mode
if (( $+widgets[history-substring-search-up] )); then
  bindkey -M vicmd "k"  history-substring-search-up
  bindkey -M vicmd "j"  history-substring-search-down
else
  bindkey -M vicmd "k"  up-line-or-history
  bindkey -M vicmd "j"  down-line-or-history
fi


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

# Delete a directory from a full POSIX path.
function dotfiles-backward-kill-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N dotfiles-backward-kill-word

# Custom ZLE command used to expand abbreviations
function dotfiles-expand-abbreviation() {
  local MATCH
  setopt EXTENDED_GLOB
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  LBUFFER+=${abbreviations[${MATCH}]:-${MATCH}}
}
zle -N dotfiles-expand-abbreviation


# vim:foldmethod=marker:foldlevel=2
