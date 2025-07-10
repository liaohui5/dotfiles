#!/usr/bin/env zsh

# zellij: https://zellij.dev/
function zj () {
  if ! has-command 'zellij'; then
    echo 'Error: Not found "zellij" command' >&2
    exit 1
  fi

  if ! has-command 'fzf'; then
    echo 'Error: Not found "fzf" command' >&2
    exit 1
  fi

  session=$(zellij ls -n -s | fzf --reverse --prompt="attach zellij session> ")
  zellij attach "$session"
}
