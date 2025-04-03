#!/usr/bin/env zsh
#######################################################################
## ssh connection manager
## sshs: https://github.com/quantumsheep/sshs
#######################################################################
function sshmgr() {
  # if sshs command exists, use it
  if has-command 'sshs'; then
    sshs
    return 0
  fi

  if has-command 'grep' -eq '0' || has-command 'fzf' -eq '0'; then
    echo 'Error: Not found "grep" and "fzf" command' >&2
    return 0
  fi
  host=$(grep -e "^Host " "$HOME/.ssh/config" | awk '{print $2}' | fzf)
  echo "SSH session started, connecting to $host"
  ssh "$host"
}
