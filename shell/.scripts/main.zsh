#!/usr/bin/env zsh

# check if file is exists and load it
function load-module() {
  local module_path="${HOME}/.scripts/$1"
  if [[ -f "$module_path" ]]; then
    source "${module_path}"
  else
    echo "[load-module]Error: ${module_path} not found"
  fi
}

# load modules
load-module 'helpers.zsh'
load-module 'alias.zsh'
load-module 'set-proxy.zsh'
load-module 'set-brew-mirrors.zsh'
load-module 'ssh-manager.zsh'
load-module 'zellij-session-manager.zsh'
