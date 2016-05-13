# zsh/lib/keymaps.zsh

# -------------------------------------
# Table of Contents
# -------------------------------------
# 1. Keymappings
# 2. Custom Commands
# -------------------------------------


# 1. Keymappings ---------------------- {{{1

zmodload zsh/terminfo zsh/complist

# Retrieve the actual key sequences from the terminfo databases,
# which works on almost all terminals on variaty of systems
typeset -A key
key=(
  "Ctrl"      '\C-'
  "Escape"    '\e'
  "Space"     " "
  "Home"      "$termifo[khome]"
  "End"       "$termino[kend]"
  "Insert"    "$terminfo[kich1]"
  "Delete"    "$terminfo[kdch1]"
  "Up"        "$terminfo[kcuu1]"
  "Down"      "$terminfo[kcud1]"
  "Left"      "$terminfo[kcub1]"
  "Right"     "$terminfo[kcuf1]"
  "PageUp"    "$terminfo[kpp]"
  "PageDown"  "$terminfo[knp]"
)

# Induce silent bindkey failure by binding to an invalid UTF-8 sequence.
for k in "${(k)key[@]}"; do
  [[ -z "$key[$k]" ]] && key[$k]='�'
done

# Bind the key sequences to Zsh Line Editor (ZLE) commands
bindkey "${key[Space]}"   magic-space
bindkey "${key[Home]}"    beginning-of-line
bindkey "${key[End]}"     end-of-line
bindkey "${key[Insert]}"  overwrite-mode
bindkey "${key[Delete]}"  delete-char
bindkey "${key[Left]}"    backward-char
bindkey "${key[Right]}"   forward-char

# Improve history search using Arrow Up/Down
if (( $+widgets[history-substring-search-up] )); then
  bindkey "${key[Up]}"    history-substring-search-up
  bindkey "${key[Down]}"  history-substring-search-down
else
  bindkey "${key[Up]}"    up-line-or-history
  bindkey "${key[Down]}"  down-line-or-history
fi

# Improve the behavior of the delete-word command
bindkey "${key[Ctrl]}w" slash-backward-delete-word

# Accept a completion and try to complete again via menu completion.
# Especially useful to navigate a directory hierarchy.
bindkey -M menuselect "${key[Ctrl]}o" accept-and-infer-next-history

# Insert the currently selected menu item, but keep the menu open
bindkey -M menuselect "+" accept-and-menu-complete

# Expand abbreviations
bindkey "${key[Ctrl]}x." magic-abbr-expand
bindkey "${key[Ctrl]}xa" help-magic-abbr

# Insert file path from file menu
autoload insert-files && zle -N insert-files
bindkey "${key[Ctrl]}xf" insert-files

# Insert the current date (format: YYYYmmdd)
bindkey "${key[Ctrl]}xd" insert-current-date

# Jump to the end of the first word (to add additional options)
bindkey "${key[Ctrl]}x1" jump-to-end-of-first-word


# a) EMACS mode ----------------------- {{{2

if (( $+widgets[history-substring-search-up] )); then
  bindkey -M emacs "${key[Ctrl]}P"  history-substring-search-up
  bindkey -M emacs "${key[Ctrl]}N"  history-substring-search-down
else
  bindkey -M emacs "${key[Ctrl]}P"  up-line-or-history
  bindkey -M emacs "${key[Ctrl]}N"  down-line-or-history
fi


# b) VI mode -------------------------- {{{2

if (( $+widgets[history-substring-search-up] )); then
  bindkey -M vicmd "k"  history-substring-search-up
  bindkey -M vicmd "j"  history-substring-search-down
else
  bindkey -M vicmd "k"  up-line-or-history
  bindkey -M vicmd "j"  down-line-or-history
fi


# 2. Custom Commands ------------------ {{{1

# Switch terminal into application mode when ZLE is active. This
# ensures that values from the terminfo database are valid.
function zle-line-init() {
  (( $+terminfo[smkx] )) && echoti smkx
}
zle -N zle-line-init

# Disable terminal application mode if ZLE is disabled.
function zle-line-finish() {
  (( $+terminfo[rmkx] )) && echoti rmkx
}
zle -N zle-line-finish

# Customize the behavior of backward-delete-word. This allows to delete
# a directory from a full POSIX path.
function slash-backward-delete-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
    zle backward-kill-word
}
zle -N slash-backward-delete-word

# Jump to the end of the first word (e.g. in order to add addition options)
function jump-to-end-of-first-word() {
  local words
  words=(${(z)BUFFER})

  if (( $#words <= 1 )); then
    CURSOR=${#BUFFER}
  else
    CURSOR=${#${words[1]}}
  fi
}
zle -N jump-to-end-of-first-word

# Insert the current date as timestamp
function insert-current-date() {
  LBUFFER+=${(%):-'%D{%Y%m%d}'}
}
zle -N insert-current-date


# vim:foldmethod=marker:foldlevel=2
