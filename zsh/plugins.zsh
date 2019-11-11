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
#  |- autosuggestions: Fast/unobtrusive autosuggestions
#  |- history-substring-search: History search using the up arrow

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "mafredri/zsh-async", from:"github"
zplug "zsh-users/zsh-completions", from:"github"
zplug "zsh-users/zsh-autosuggestions", from:"github"
zplug "zsh-users/zsh-history-substring-search", from:"github"

# (b) Tools ------------------------------------------------------------- {{{2
#  |- bd: Jump back to a specific directory
#  |- extract: Uncompress archive files

zplug "tarrasch/zsh-bd", from:"github"
zplug "plugins/extract", from:"oh-my-zsh"

# (c) Themes ------------------------------------------------------------ {{{2
#  |- pure: Pretty, minimal and fast ZSH prompt
#  |- spaceship: A Zsh prompt for Astronauts

zplug "sindresorhus/pure", from:"github", as:"theme", use:"pure.zsh", if:"[[ \$SHELL_THEME = pure ]]"
zplug "denysdovhan/spaceship-prompt", from:"github", as:"theme", use:"spaceship.zsh", if:"[[ \$SHELL_THEME = spaceship ]]"


# (3) Plugin Configuration ---------------------------------------------- {{{1

zplug check || zplug install
zplug load

# (a) Autosuggestions --------------------------------------------------- {{{2

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=145"
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+="accept-or-history-substring-search-down"
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+="accept-or-down-line"

# (b) History Search ---------------------------------------------------- {{{2

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=black,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=red"

# (c) Pure Theme -------------------------------------------------------- {{{2

PURE_PROMPT_SYMBOL="${PROMPT_SYMBOL:-❯}"

zstyle ":prompt:pure:prompt:success" "${PROMPT_COLOR_SUCCESS:-magenta}"
zstyle ":prompt:pure:prompt:error" "${PROMPT_COLOR_ERROR:-red}"
zstyle ":prompt:pure:path" "${PROMPT_COLOR_PATH:-blue}"

# (d) Spaceship Theme --------------------------------------------------- {{{2

SPACESHIP_CHAR_SYMBOL="${PROMPT_SYMBOL:-❯}"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_COLOR_SUCCESS="${PROMPT_COLOR_SUCCESS:-magenta}"
SPACESHIP_CHAR_COLOR_FAILURE="${PROMPT_COLOR_ERROR:-red}"
SPACESHIP_DIR_COLOR="${PROMPT_COLOR_PATH:-blue}"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=0


# vim:foldmethod=marker:foldlevel=2
