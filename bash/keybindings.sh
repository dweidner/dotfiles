# bash/keybindings.sh
#
# @file Customizes bash keybindings.


# (1) FZF Bindings ------------------------------------------------------ {{{1

# Load keybindings shipping with fzf
if [[ -r "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.bash" ]]; then
  source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.bash"
fi


# vim:foldmethod=marker:foldlevel=2
