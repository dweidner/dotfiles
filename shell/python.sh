# shell/python.sh
#
# @file Configuration of the Python environment.


# (1) Python Version Manager -------------------------------------------- {{{1

export PYENV_ROOT="${XDG_CONFIG_HOME}/pyenv"

if dot::command_exists "pyenv"; then
  dot::eval pyenv init --path
fi


# vim:foldmethod=marker:foldlevel=2
