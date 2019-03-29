# shell/python.sh
#
# @file Configuration of the Python environment.


# (1) Python Package Manager -------------------------------------------- {{{1

if dot::command_exists "pip"; then
  eval "$(pip -qq --disable-pip-version-check completion --bash)"
fi


# (3) Python Versions --------------------------------------------------- {{{1

alias py="python"
alias py2="python2"
alias py3="python3"


# vim:foldmethod=marker:foldlevel=2
