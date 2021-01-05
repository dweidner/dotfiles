# shell/variables.sh
#
# @file Environment variable definitions.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Locale
# 2. XDG user directories
# 3. Command History
# 4. Text Editors
# 5. Pagers
# 6. Shell-specific
# 7. OS-specific
# -----------------------------------------------------------------------


# (1) Locale ------------------------------------------------------------ {{{1

export LANG="en_US.UTF-8"
export LC_COLLATE="C"
export LC_NUMERIC="C"
export LC_PAPER="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"

[[ -L /etc/localtime ]] && export TZ=:/etc/localtime


# (2) XDG user directories ---------------------------------------------- {{{1

[[ -z "$XDG_CONFIG_HOME" ]]     && export XDG_CONFIG_HOME="${HOME}/.config"
[[ -z "$XDG_CACHE_HOME" ]]      && export XDG_CACHE_HOME="${HOME}/.cache"
[[ -z "$XDG_DATA_HOME" ]]       && export XDG_DATA_HOME="${HOME}/.local/share"
[[ -z "$XDG_APPLICATION_DIR" ]] && export XDG_APPLICATION_DIR="${HOME}/Applications"
[[ -z "$XDG_DOCUMENTS_DIR" ]]   && export XDG_DOCUMENTS_DIR="${HOME}/Documents"
[[ -z "$XDG_DOWNLOAD_DIR" ]]    && export XDG_DOWNLOAD_DIR="${HOME}/Downloads"


# (3) Command History --------------------------------------------------- {{{1

export HISTSIZE=1000                # Number of lines saved in memory
export HISTFILESIZE=$HISTSIZE       # Number of lines saved in file
export HISTTIMEFORMAT="%F %T%t"     # Distinguish history lines by date
export HISTCONTROL=ignoredups       # Ignore duplicates
export HISTIGNORE="ls:ll:cd:cd -"   # Ignore simple directory commands
export SAVEHIST=$SAVEHIST           # Enable/disable the command history


# (4) Pagers ------------------------------------------------------------ {{{1

# Configure less as default pager
# -i = ignore case
# -m = long prompt
# -w = temporarily highlight line after movement
# -F = quit if one screen
# -R = raw control chars
# -X = don’t clear screen on exit
export LESS="-imwFRX"
export LESSHISTFILE="${XDG_DATA_HOME}/less/history"

export PAGER="less -X"
export MANPAGER="$PAGER"


# (5) Text Editors ------------------------------------------------------ {{{1

for cmd in "nvim" "vim" "vi"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    export EDITOR="$cmd"
    break
  fi
done

export VISUAL="$EDITOR"


# (6) Shell-specific ---------------------------------------------------- {{{1

[[ -n "$BASH_VERSION" ]] && source "${DOTFILES}/shell/variables-bash.sh"
[[ -n "$ZSH_VERSION" ]]  && source "${DOTFILES}/shell/variables-zsh.sh"


# (7) OS-specific ------------------------------------------------------- {{{1

case "$OSTYPE" in
  darwin*) source "${DOTFILES}/shell/variables-darwin.sh" ;;
  linux*)  source "${DOTFILES}/shell/variables-linux.sh" ;;
  bsd*)    source "${DOTFILES}/shell/variables-bsd.sh" ;;
esac


# vim:foldmethod=marker:foldlevel=2
