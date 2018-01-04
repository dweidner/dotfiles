# shell/ruby.sh
#
# @file Configuration of the Ruby environment.


# (1) Ruby Configuration ------------------------------------------------ {{{1

if [[ -r "${HOMEBREW_PREFIX}/opt/openssl" ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${HOMEBREW_PREFIX}/opt/openssl"
fi


# (2) Ruby Version Manager ---------------------------------------------- {{{1

export RVM_PATH="${XDG_DATA_HOME}/rvm"

if [[ -r "${RVM_PATH}/scripts/rvm" ]]; then
  source "${RVM_PATH}/scripts/rvm"
fi

if [[ -r "${RVM_PATH}/scripts/completion" ]]; then
  source "${RVM_PATH}/scripts/completion"
fi


# (3) Ruby Bundler ------------------------------------------------------ {{{1

alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bu="bundle update"


# vim:foldmethod=marker:foldlevel=2
