# bash/fzf.sh
#
# @file Load command-line fuzzy finder


# (1) Path customization ------------------------------------------------ {{{1

export FZF_DIR="/usr/local/opt/fzf"

if [[ -d "${FZF_DIR}/bin" ]]; then
  path_add "${FZF_DIR}/bin"
fi


# (2) Auto-completion --------------------------------------------------- {{{1

if [[ -s "${FZF_DIR}/shell/completion.bash" ]]; then
  source "${FZF_DIR}/shell/completion.bash"
fi


# (3) Key bindings ------------------------------------------------------ {{{1

if [[ -s "${FZF_DIR}/shell/key-bindings.bash" ]]; then
  source "${FZF_DIR}/shell/key-bindings.bash"
fi


# (4) Configuration ----------------------------------------------------- {{{1

export FZF_DEFAULT_OPTS='
  --height 40%
  --reverse
  --color light
'


# vim:foldmethod=marker:foldlevel=2
