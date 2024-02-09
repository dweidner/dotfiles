# zsh/plugins.zsh
#
# @file Load zsh plugins.
#
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Plugin Manager
# 3. Plugin Configuration
# 2. Plugins
# -----------------------------------------------------------------------


# (1) Plugin Manager ---------------------------------------------------- {{{1

declare -A ZINIT

ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
ZINIT[COMPINIT_OPTS]=-C

if [[ ! -d "${ZINIT[HOME_DIR]}" ]]; then
  git clone "ihttps://github.com/zdharma-continuum/zinit.git" "${ZINIT[HOME_DIR]}"
fi

source "${ZINIT[HOME_DIR]}/zinit.zsh"


# (2) Plugin Configuration ---------------------------------------------- {{{1

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

# (c) Forgit ------------------------------------------------------------ {{{2

export FORGIT_NO_ALIASES=1

alias fgl="forgit::log"
alias fgd="forgit::diff"
alias fga="forgit::add"
alias fgi="forgit::ignore"

# (c) Pure Theme -------------------------------------------------------- {{{2

PURE_PROMPT_SYMBOL="${PROMPT_SYMBOL:-❯}"

zstyle ":prompt:pure:prompt:success" "${PROMPT_COLOR_SUCCESS:-magenta}"
zstyle ":prompt:pure:prompt:error" "${PROMPT_COLOR_ERROR:-red}"
zstyle ":prompt:pure:path" "${PROMPT_COLOR_PATH:-blue}"


# (3) Plugins ----------------------------------------------------------- {{{1

# (a) Prompt ------------------------------------------------------------ {{{2

zinit ice compile"(pure|async).zsh" pick"async.zsh" src"pure.zsh" notify
zinit load "sindresorhus/pure"

# (b) Tools -------------------------------------------------------- {{{2

zinit wait lucid for \
   "hlissner/zsh-autopair" \
   "tarrasch/zsh-bd" \
   "OMZP::cp" \
   "OMZP::extract" \
   "OMZP::ssh"

zinit has"fzf" wait lucid for \
  "wfxr/forgit"

# (c) Widgets ----------------------------------------------------------- {{{2

zinit ice wait lucid atload"
  bindkey -M emacs '\C-p' history-substring-search-up
  bindkey -M emacs '\C-n' accept-or-history-substring-search-down
  bindkey -M vicmd 'k'    history-substring-search-up
  bindkey -M vicmd 'j'    accept-or-history-substring-search-down
  bindkey '^[[A'          history-substring-search-up
  bindkey '^[[B'          history-substring-search-down
"
zinit load "zsh-users/zsh-history-substring-search"

# (d) Completions ------------------------------------------------------- {{{2

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit load "zsh-users/zsh-autosuggestions"

zinit ice wait lucid blockf atpull"zinit creinstall -q ."
zinit load "zsh-users/zsh-completions"

zinit ice lucid atinit"zicompinit; zicdreplay"
zinit load "zdharma/fast-syntax-highlighting"

# vim:foldmethod=marker:foldlevel=2
