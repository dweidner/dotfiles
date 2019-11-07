# shell/variables-bash.sh
#
# @file BASH-specific environment variables

export SHELL_NAME="bash"
export SHELL_VERSION="${BASH_VERSION}"
export SHELL_THEME="${SHELL_THEME:-pure}"

export INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc"
export HISTFILE="${XDG_DATA_HOME}/bash/history"

