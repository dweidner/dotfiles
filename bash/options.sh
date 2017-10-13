# bash/options.sh
#
# @file Customizes shell options.


# Sensible Defaults ----------------------------------------------------- {{{1

stty -ixon                # Disable start/stop output control

set -o notify             # Notify about terminating backround jobs

shopt -s cdspell          # Correct typos in directory names when using cd
shopt -s cdable_vars 	  # Change to a directory saved in a variable
shopt -s checkwinsize     # Ensure LINES and COLUMNS match the window size
shopt -s cmdhist 	  # Join multi-line commands into one
shopt -s dotglob          # Expand filenames starting with a dot
shopt -s extglob          # Enable extended pattern matching for path expansion
shopt -s histappend 	  # Append to history when the shell exits
shopt -s hostcomplete   # Perform host completion for words containing @
shopt -s nocaseglob       # Enable case-insensitive globbing


# Version specifc options ----------------------------------------------- {{{1

if (( BASH_VERSINFO[0] >= 4 )); then
  shopt -s dirspell       # Correct typos in directory names during completion
  shopt -s globstar       # Allow the use of ** to match subdirectories
fi


# vim:foldmethod=marker:foldlevel=2
