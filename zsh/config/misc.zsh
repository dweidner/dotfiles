# zsh/config/misc.zsh

# Autoload the run-help function for zsh builtin commands
unalias run-help
autoload -Uz run-help
alias help="run-help"
