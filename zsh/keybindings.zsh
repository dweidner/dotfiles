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
  "STab"      "${terminfo[kcbt]}"
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

# Use emacs-like key bindings by default
bindkey -e

# Bind key sequences to Zsh Line Editor (ZLE) commands
bindkey "${key[Space]}"   magic-space
bindkey "${key[Home]}"    beginning-of-line
bindkey "${key[End]}"     end-of-line
bindkey "${key[Left]}"    backward-char
bindkey "${key[Right]}"   forward-char
bindkey "${key[Delete]}"  delete-char
bindkey "${key[STab]}"    reverse-menu-complete

# Improve the behavior of the delete-word command for POSIX paths
bindkey "${key[Ctrl]}w" slash-backward-delete-word

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
function slash-backward-delete-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N slash-backward-delete-word


# vim:foldmethod=marker:foldlevel=2
