# zsh/lib/abbr.zsh

# Abbreviations Expansion
# @see <http://zshwiki.org/home/examples/zleiab>

typeset -gA abbreviations
abbreviations=(
  "C"   "| wc -l"
  "G"   "| grep"
  "L"   "| less"
  "H"   "| head"
  "T"   "| tail"
  "V"   "| ${VISUAL:-$EDITOR}"
  "X"   "| xargs"
)

# Custom ZLE command used to expand abbreviations
function magic-abbr-expand() {
  local MATCH
  setopt extendedglob
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
}
zle -N magic-abbr-expand

# Custom ZLE command used to display available abbreviations
function help-magic-abbr() {
  zle -M "$(
    print "Abbreviation Expansion:";
    print -a -C 2 ${(kv)abbreviations}
  )"
}
zle -N help-magic-abbr
