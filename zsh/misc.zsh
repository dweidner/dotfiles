# zsh/misc.zsh
#
# @file Various other settings not matching a particular group
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Online Help
# 2. Suffix Aliases
# -----------------------------------------------------------------------


# (1) Online Help ------------------------------------------------------- {{{1

unalias run-help
autoload run-help

alias help="run-help"


# (3) Suffix Aliases ---------------------------------------------------- {{{1

# Preview text documents using cat/bat
for ft in markdown md txt; do
  alias -s "${ft}"="c"
done

# Display log files using tail
alias -s log="tail -f"

# List contents of zip files
alias -s zip="unzip -l"
alias -s tar="tar -tf"


# vim:foldmethod=marker:foldlevel=2
