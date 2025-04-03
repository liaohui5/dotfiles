#!/usr/bin/env zsh

# check if file is exists and load it
function load-module() {
  local module_path="${HOME}/.scripts/$1"
  if [ -f "$module_path" ]; then
    source "${module_path}"
  else
    echo "[load-module]Error: ${module_path} not found"
  fi
}

# check command exists
function has-command() {
  if command -v "$1" >/dev/null; then
    return 0
  else
    return 1
  fi
}

# check command exists and alias it
# safe-alias <alias> <cmd>
function safe-alias() {
  local alias="$1"
  local cmd="$2"
  if command -v "$cmd" >/dev/null; then
    alias "$alias"="$cmd"
  fi
}

# load modules
load-module 'profile.zsh'
load-module 'alias.zsh'
load-module 'set-proxy.zsh'
load-module 'set-brew-mirrors.zsh'
load-module 'ssh-manager.zsh'
