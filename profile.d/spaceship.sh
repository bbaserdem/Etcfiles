#----------------------#
#---SPACESHIP PROMPT---#
#----------------------#

# Config: robbyrussell
export SPACESHIP_PROMPT_ORDER=(
  time     #
  user     # before prompt char
  host     #
  char
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  python
)

# USER
export SPACESHIP_USER_PREFIX="" # remove `with` before username
export SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
export SPACESHIP_HOST_PREFIX="@:("
export SPACESHIP_HOST_SUFFIX=") "

# DIR
export SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
export SPACESHIP_DIR_TRUNC='1' # show only last directory

# GIT
# Disable git symbol
export SPACESHIP_GIT_SYMBOL="" # disable git prefix
export SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
export SPACESHIP_GIT_PREFIX='git:('
export SPACESHIP_GIT_SUFFIX=") "
export SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
export SPACESHIP_GIT_STATUS_PREFIX=""
export SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE
export SPACESHIP_NODE_PREFIX="node:("
export SPACESHIP_NODE_SUFFIX=") "
export SPACESHIP_NODE_SYMBOL=""

# RUBY
export SPACESHIP_RUBY_PREFIX="ruby:("
export SPACESHIP_RUBY_SUFFIX=") "
export SPACESHIP_RUBY_SYMBOL=""

# XCODE
export SPACESHIP_XCODE_PREFIX="xcode:("
export SPACESHIP_XCODE_SUFFIX=") "
export SPACESHIP_XCODE_SYMBOL=""

# SWIFT
export SPACESHIP_SWIFT_PREFIX="swift:("
export SPACESHIP_SWIFT_SUFFIX=") "
export SPACESHIP_SWIFT_SYMBOL=""

# GOLANG
export SPACESHIP_GOLANG_PREFIX="go:("
export SPACESHIP_GOLANG_SUFFIX=") "
export SPACESHIP_GOLANG_SYMBOL=""

# DOCKER
export SPACESHIP_DOCKER_PREFIX="docker:("
export SPACESHIP_DOCKER_SUFFIX=") "
export SPACESHIP_DOCKER_SYMBOL=""

# VENV
export SPACESHIP_VENV_PREFIX="venv:("
export SPACESHIP_VENV_SUFFIX=") "

# PYENV
export SPACESHIP_PYTHON_PREFIX="python:("
export SPACESHIP_PYTHON_SUFFIX=") "
export SPACESHIP_PYTHON_SYMBOL=""
