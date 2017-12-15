# shell/variables.sh
#
# @file Environment variable definitions.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Locale
# 2. User directories
# 3. User configuration
# 4. Command History
# 5. Text Editors
# 6. Pagers
# 7. Package Managers
# 8. Shell-specific
# 9. OS-specific
# -----------------------------------------------------------------------


# (1) Locale ------------------------------------------------------------ {{{1

export LANG="en_US.UTF-8"
export LC_COLLATE="C"
export LC_NUMERIC="C"
export LC_PAPER="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"

[[ -L /etc/localtime ]] && export TZ=:/etc/localtime


# (2) User directories -------------------------------------------------- {{{1

[[ -z "$XDG_CONFIG_HOME" ]]     && export XDG_CONFIG_HOME="${HOME}/.config"
[[ -z "$XDG_CACHE_HOME" ]]      && export XDG_CACHE_HOME="${HOME}/.cache"
[[ -z "$XDG_DATA_HOME" ]]       && export XDG_DATA_HOME="${HOME}/.local/share"
[[ -z "$XDG_APPLICATION_DIR" ]] && export XDG_APPLICATION_DIR="${HOME}/Applications"
[[ -z "$XDG_DOCUMENTS_DIR" ]]   && export XDG_DOCUMENTS_DIR="${HOME}/Documents"
[[ -z "$XDG_DROPBOX_DIR" ]]     && export XDG_DROPBOX_DIR="${HOME}/Dropbox"
[[ -z "$XDG_DOWNLOAD_DIR" ]]    && export XDG_DOWNLOAD_DIR="${HOME}/Downloads"

export DOTFILES="${XDG_CONFIG_HOME}/dotfiles"


# (3) User configuration ------------------------------------------------ {{{1

export INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"


# (4) Command History --------------------------------------------------- {{{1

export HISTSIZE=1000             # Number of lines saved in memory
export HISTFILESIZE=$HISTSIZE    # Number of lines saved in file
export HISTTIMEFORMAT="%F %T%t"  # Distinguish history lines by date/time
export HISTCONTROL=ignoredups    # Ignore duplicates
export HISTIGNORE="ls:cd:cd -"   # Ignore simple directory commands
export SAVEHIST=$SAVEHIST        # Enable/disable the command history


# (5) Pagers ------------------------------------------------------------ {{{1

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


# (6) Text Editors ------------------------------------------------------ {{{1

for cmd in "nvim" "vim" "vi"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    export EDITOR="$cmd"
    break
  fi
done

export VISUAL="$EDITOR"


# (7) Package Managers -------------------------------------------------- {{{1

export COMPOSER_HOME="${XDG_CONFIG_HOME}/composer"
export COMPOSER_CACHE_DIR="${XDG_CACHE_HOME}/composer"

export GEMRC="${XDG_CONFIG_HOME}/gem/gemrc"
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"

export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle"
export BUNDLE_USER_HOME="${XDG_DATA_HOME}/bundle"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle/plugin"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"


# (8) Shell-specific ---------------------------------------------------- {{{1

case "$SHELL" in
  */bash) export HISTFILE="${XDG_DATA_HOME}/bash/history" ;;
  */zsh)  export HISTFILE="${XDG_DATA_HOME}/zsh/history" ;;
esac


# (9) OS-specific ------------------------------------------------------- {{{1

case "$OSTYPE" in
  darwin*) source "${DOTFILES}/shell/variables-darwin.sh" ;;
  linux*)  source "${DOTFILES}/shell/variables-linux.sh" ;;
  bsd*)    source "${DOTFILES}/shell/variables-bsd.sh" ;;
esac


# vim:foldmethod=marker:foldlevel=2
