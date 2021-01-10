# shell/variables-zsh.sh
#
# @file ZSH-specific environment variables

export SHELL_SESSIONS_DISABLE=${SHELL_SESSIONS_DISABLE:-1}
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
