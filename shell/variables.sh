# shell/variables.sh
#
# @file Environment variable definitions.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Locale
# 2. Directories
# 3. Command History
# 4. Text Editor
# 5. Pager
# 6. Misc
# -----------------------------------------------------------------------


# (1) Locale ------------------------------------------------------------ {{{1

export LANG="en_US.UTF-8"
export LC_COLLATE="C"
export LC_NUMERIC="C"
export LC_PAPER="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"

[[ -L /etc/localtime ]] && export TZ=:/etc/localtime


# (2) System directories ------------------------------------------------ {{{1

export DOTFILES="${HOME}/.dotfiles"

[[ -z "$XDG_CONFIG_HOME" ]]     && export XDG_CONFIG_HOME="${HOME}/.config"
[[ -z "$XDG_CACHE_HOME" ]]      && export XDG_CACHE_HOME="${HOME}/.cache"
[[ -z "$XDG_DATA_HOME" ]]       && export XDG_DATA_HOME="${HOME}/.local/share"
[[ -z "$XDG_APPLICATION_DIR" ]] && export XDG_APPLICATION_DIR="${HOME}/Applications"
[[ -z "$XDG_DOCUMENTS_DIR" ]]   && export XDG_DOCUMENTS_DIR="${HOME}/Documents"
[[ -z "$XDG_DROPBOX_DIR" ]]     && export XDG_DROPBOX_DIR="${HOME}/Dropbox"
[[ -z "$XDG_DOWNLOAD_DIR" ]]    && export XDG_DOWNLOAD_DIR="${HOME}/Downloads"


# (3) Command History -------------------------------------------------- {{{1

export HISTSIZE=1000             # Number of lines saved in memory
export HISTFILESIZE=$HISTSIZE    # Number of lines saved in file
export HISTTIMEFORMAT="%F %T%t"  # Distinguish history lines by date/time
export HISTCONTROL=ignoredups    # Ignore duplicates
export HISTIGNORE="ls:cd:cd -"   # Ignore simple directory commands
export SAVEHIST=$SAVEHIST        # Enable/disable the command history


# (4) Text Editor ------------------------------------------------------ {{{1

for cmd in "nvim" "vim" "vi"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    export EDITOR="$cmd"
    break
  fi
done

export VISUAL="$EDITOR"


# (5) Pagers ----------------------------------------------------------- {{{1

# Configure less as default pager
# -i = ignore case
# -m = long prompt
# -w = temporarily highlight line after movement
# -F = quit if one screen
# -R = raw control chars
# -X = don’t clear screen on exit
export LESS="-imwFRX"
export LESSHISTFILE=/dev/null

export PAGER="less -X"
export MANPAGER="$PAGER"


# (5) Misc ------------------------------------------------------------- {{{1

export COMPOSER_HOME="${XDG_CONFIG_HOME}/composer"
export COMPOSER_CACHE_DIR="${XDG_CACHE_HOME}/composer"


# vim:foldmethod=marker:foldlevel=2
