# zsh/misc.zsh
#
# @file Various other settings not matching a particular group
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Abbreviations
# 2. Online Help
# 3. Suffix Aliases
# -----------------------------------------------------------------------

# (1) Abbreviations ----------------------------------------------------- {{{1

typeset -gA abbreviations
abbreviations=(
  "C"  "| wc -l"
  "G"  "| grep"
  "L"  "| less"
  "H"  "| head"
  "T"  "| tail"
  "X"  "| xargs"
)


# (2) Online Help ------------------------------------------------------- {{{1

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
