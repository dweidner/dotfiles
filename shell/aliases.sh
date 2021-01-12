# shell/alias.sh
#
# @file Shell aliases for frequently used commands.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Command abbreviations
# 2. Switch directories
# 3. Error prevention
# 4. List directory contents
# 5. File pattern searching
# 6. File comparison
# 7. System specific aliases
# -----------------------------------------------------------------------


# (1) Command abbreviations --------------------------------------------- {{{1

alias b="bookmark"               # Manage a users bookmarks
alias e="${EDITOR:-vi}"          # Open file in default editor
alias o="${BROWSER:-open}"       # Open file in default file browser
alias f="find"                   # Easily access the find command
alias g="git"                    # Easily access the git command
alias h="history"                # Easily access the command history


# (2) Switch directories ------------------------------------------------ {{{1

alias -- ..="cd .."                # Switch to the parent directory
alias -- --="cd - >/dev/null 2>&1" # Switch to the previous directory


# (3) Error prevention -------------------------------------------------- {{{1

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"


# (4) List directory contents ------------------------------------------- {{{1

# Test whether the ls command supports a given option
dot::ls_supports() {
  command ls "$@" >/dev/null 2>&1
}

declare -a ls_options

if dot::ls_supports --color=auto; then
  ls_options+=( --color=auto )
elif dot::ls_supports -G; then
  ls_options+=( -G )
fi

alias ls="command ls ${ls_options[*]}"

alias l1="ls -1"    # Short list, one entry per row
alias ll="ls -lhF"  # Long list, human readable sizes
alias la="ll -A"    # Long list including hidden files
alias lt="ll -t"    # By date, most recent first
alias lz="ll -S"    # By size, largest first

alias tree="tree -CF"
alias t="tree -a --noreport --dirsfirst -I '.git|node_modules|.DS_Store'"


# (5) File pattern searching -------------------------------------------- {{{1

# Test whether grep supports a given option
dot::grep_supports() {
  grep "$1" "?" >/dev/null 2>&1 <(echo "?" 2>&1)
}

declare -a grep_options

if dot::grep_supports --color=auto; then
  grep_options+=( --color=auto )
fi

alias grep="grep ${grep_options[*]}"
alias fgrep="fgrep ${grep_options[*]}"
alias egrep="egrep ${grep_options[*]}"

alias rg="rg --hidden --smart-case"

if dot::command_exists "rg"; then
  alias ag="rg"
elif dot::command_exists "ag"; then
  alias ag="ag --hidden --smart-case"
fi


# (6) File comparison --------------------------------------------------- {{{1

if dot::command_exists "bat"; then
  alias c="bat"
elif dot::command_exists "pygmentize"; then
  alias c="pygmentize -g"
elif dot::command_exists "highlight"; then
  alias c="highlight -O ansi"
else
  alias c="cat"
fi

if dot::command_exists "delta"; then
  alias d="delta"
elif dot::command_exists "icdiff"; then
  alias d="icdiff --tabsize=4 --numlines=8"
else
  alias d="diff --side-by-side --width=\$(( COLUMNS - 2 ))"
fi

case "$EDITOR" in
  *nvim) alias vd="nvim -dR" ;;
  *vim)  alias vd="vimdiff" ;;
esac


# (7) System specific aliases ------------------------------------------- {{{1

case "$OSTYPE" in
  darwin*) source "${DOTFILES}/shell/aliases-darwin.sh" ;;
  linux*)  source "${DOTFILES}/shell/aliases-linux.sh" ;;
  bsd*)    source "${DOTFILES}/shell/aliases-bsd.sh" ;;
esac


# vim:foldmethod=marker:foldlevel=2
