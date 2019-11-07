# zsh/plugins.zsh
#
# @file Load zsh plugins.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Plugin Manager
# 2. Plugins
# 3. Plugin Configuration
# -----------------------------------------------------------------------


# (1) Plugin Manager ---------------------------------------------------- {{{1

export ZPLUG_HOME="${XDG_DATA_HOME}/zplug"
export ZPLUG_CACHE_DIR="${XDG_CACHE_HOME}/zplug"

if [[ ! -d "${ZPLUG_HOME}" ]]; then
  git clone "https://github.com/zplug/zplug" "${ZPLUG_HOME}"
fi

source "${ZPLUG_HOME}/init.zsh"


# (2) Plugins ----------------------------------------------------------- {{{1

# (a) Essentials -------------------------------------------------------- {{{2
#  |- zplug: Manage zplug itself like other packages
#  |- async: Perform tasks asynchronously
#  |- completions: Additional completion definitions

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "mafredri/zsh-async", from:"github"
zplug "zsh-users/zsh-completions", from:"github"

# (b) Tools ------------------------------------------------------------- {{{2
#  |- bd: Jump back to a specific directory
#  |- extract: Uncompress archive files
#  |- fzf: A command-line fuzzy finder

zplug "tarrasch/zsh-bd", from:"github"
zplug "plugins/extract", from:"oh-my-zsh"
zplug "plugins/fzf", from:"oh-my-zsh"

# (c) Themes ------------------------------------------------------------ {{{2
#  |- pure: Pretty, minimal and fast ZSH prompt
#  |- spaceship: A Zsh prompt for Astronauts

zplug "sindresorhus/pure", from:"github", as:"theme", use:"pure.zsh", if:"[[ \$SHELL_THEME = pure ]]"
zplug "denysdovhan/spaceship-prompt", from:"github", as:"theme", use:"spaceship.zsh", if:"[[ \$SHELL_THEME = spaceship ]]"


# (3) Plugin Configuration ---------------------------------------------- {{{1

zplug check || zplug install
zplug load

# (a) FZF --------------------------------------------------------------- {{{2

export FZF_BASE="/usr/local/opt/fzf"

# (b) Pure Theme -------------------------------------------------------- {{{2

export PURE_PROMPT_SYMBOL="${PROMPT_SYMBOL:-❯}"

zstyle ":prompt:pure:prompt:success" "${PROMPT_COLOR_SUCCESS:-magenta}"
zstyle ":prompt:pure:prompt:error" "${PROMPT_COLOR_ERROR:-red}"
zstyle ":prompt:pure:path" "${PROMPT_COLOR_PATH:-blue}"

# (c) Spaceship Theme --------------------------------------------------- {{{2

export SPACESHIP_CHAR_SYMBOL="${PROMPT_SYMBOL:-❯}"
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_CHAR_COLOR_SUCCESS="${PROMPT_COLOR_SUCCESS:-magenta}"
export SPACESHIP_CHAR_COLOR_FAILURE="${PROMPT_COLOR_ERROR:-red}"
export SPACESHIP_DIR_COLOR="${PROMPT_COLOR_PATH:-blue}"
export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_DIR_TRUNC_REPO=0


# vim:foldmethod=marker:foldlevel=2
