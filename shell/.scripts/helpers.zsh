#!/usr/bin/env zsh

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
