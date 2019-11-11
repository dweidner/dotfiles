# zsh/misc.zsh
#
# @file Various other settings not matching a particular group
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Abbreviations
# 2. Online Help
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


# (2) Suffix Aliases ---------------------------------------------------- {{{1

alias -s log="tail -f" # Open log files with tail
alias -s md="c"        # Display the contents of a markdown file in bat/cat
alias -s txt="c"       # Display the contents of a text file in bat/cat


# (2) Online Help ------------------------------------------------------- {{{1

unalias run-help
autoload run-help

alias help="run-help"


# vim:foldmethod=marker:foldlevel=2
