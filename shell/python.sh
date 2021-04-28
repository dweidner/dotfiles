# shell/python.sh
#
# @file Configuration of the Python environment.


# (1) Python Version Manager -------------------------------------------- {{{1

export PYENV_ROOT="${XDG_CONFIG_HOME}/pyenv"

if dot::command_exists "pyenv"; then
  dot::eval pyenv init -
fi


# (2) Python Package Manager -------------------------------------------- {{{1

if dot::command_exists "python"; then
  case "${SHELL}" in
    */bash) dot::eval python -m pip completion --bash;;
    */zsh)  dot::eval python -m pip completion --zsh;;
  esac
fi


# vim:foldmethod=marker:foldlevel=2
