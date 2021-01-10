# shell/python.sh
#
# @file Configuration of the Python environment.


# (1) Python Package Manager -------------------------------------------- {{{1

if dot::command_exists "python3"; then
  case "${SHELL}" in
    */bash) dot::eval python3 -m pip completion --bash;;
    */zsh)  dot::eval python3 -m pip completion --zsh;;
  esac
fi


# (2) Python Versions --------------------------------------------------- {{{1

alias py="python3"
alias py2="python2"
alias py3="python3"


# vim:foldmethod=marker:foldlevel=2
