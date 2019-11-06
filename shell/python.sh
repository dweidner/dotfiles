# shell/python.sh
#
# @file Configuration of the Python environment.


# (1) Python Package Manager -------------------------------------------- {{{1

if dot::command_exists "pip3"; then
  case "$SHELL_NAME" in
    bash) eval "$(pip3 completion --bash)" ;;
    zsh)  eval "$(pip3 completion --zsh)" ;;
  esac
fi


# (3) Python Versions --------------------------------------------------- {{{1

alias py="python3"
alias py2="python2"
alias py3="python3"


# vim:foldmethod=marker:foldlevel=2
