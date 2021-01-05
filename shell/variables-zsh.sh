# shell/variables-zsh.sh
#
# @file ZSH-specific environment variables

export SHELL_NAME="zsh"
export SHELL_VERSION="${ZSH_VERSION}"
export SHELL_THEME="${SHELL_THEME:-pure}"
export SHELL_SESSIONS_DISABLE=${SHELL_SESSIONS_DISABLE:-1}

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
