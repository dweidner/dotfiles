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

declare -A ZINIT

ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zsh/zcompdump-${HOST/.*/}-${ZSH_VERSION}"

if [[ ! -d "${ZINIT[HOME_DIR]}" ]]; then
  git clone "https://github.com/zdharma/zinit.git" "${ZINIT[HOME_DIR]}"
fi

source "${ZINIT[HOME_DIR]}/zinit.zsh"


# (2) Plugins ----------------------------------------------------------- {{{1

# (a) Themes ------------------------------------------------------------ {{{2
#  |- pure: Pretty, minimal and fast ZSH prompt
#  |- spaceship: A Zsh prompt for Astronauts

zinit for \
  light-mode if'[[ $SHELL_THEME = pure ]]' compile"(pure|async).zsh" pick"async.zsh" src"pure.zsh" \
    "sindresorhus/pure" \
  light-mode if'[[ $SHELL_THEME = spaceship ]]' src"spaceship.zsh" \
    "denysdovhan/spaceship-prompt"

# (b) Completions ------------------------------------------------------- {{{2
#  |- docker: Additional auto completion for docker and docker compose

zinit has"docker" as"completion" is-snippet for \
  "https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker" \
  "https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose"

# (c) Tools -------------------------------------------------------- {{{2
#  |- history-substring-search: History search using the up arrow
#  |- autopair: auto-closes  matching delimiters
#  |- bd: Jump back to a specific directory
#  |- cp: copy files using rsync
#  |- extract: Uncompress archive files
#  |- fast-syntax-highlighting: Feature rich syntax highlighting for zsh
#  |- completions: Additional completion definitions
#  |- autosuggestions: Fast/unobtrusive autosuggestions

zinit light-mode for \
  "zsh-users/zsh-history-substring-search"

zinit wait lucid light-mode for \
  "hlissner/zsh-autopair" \
  "tarrasch/zsh-bd" \
  "OMZP::cp" \
  "OMZP::extract"

zinit wait lucid light-mode for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    "zdharma/fast-syntax-highlighting" \
 atload"_zsh_autosuggest_start" \
    "zsh-users/zsh-autosuggestions" \
 blockf atpull"zinit creinstall -q ." \
    "zsh-users/zsh-completions"

# (3) Plugin Configuration ---------------------------------------------- {{{1

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
