# shell/ruby.sh
#
# @file Configuration of the Ruby environment.


# (1) Ruby Configuration ------------------------------------------------ {{{1

if [[ -r "${HOMEBREW_PREFIX}/opt/openssl" ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${HOMEBREW_PREFIX}/opt/openssl"
fi


# (2) Ruby Version Manager ---------------------------------------------- {{{1

export rvm_path="${XDG_DATA_HOME}/rvm"

if [[ -r "${rvm_path}/scripts/rvm" ]]; then
  source "${rvm_path}/scripts/rvm"
fi

if [[ -r "${rvm_path}/scripts/completion" ]]; then
  source "${rvm_path}/scripts/completion"
fi


# (3) Ruby Bundler ------------------------------------------------------ {{{1

alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bu="bundle update"


# vim:foldmethod=marker:foldlevel=2
