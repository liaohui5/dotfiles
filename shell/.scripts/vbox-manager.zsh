#!/usr/bin/env zsh

# alias
safe-alias 'vbox' 'VBoxManage'

# selected vm uuid
vmid=""

local function check-commands() {
  if ! has-command 'VBoxManage'; then
    echo 'Error: Not found "VBoxManage" command' >&2
    return 1
  fi
  if ! has-command 'fzf'; then
    echo 'Error: Not found "fzf" command' >&2
    return 1
  fi
}

local function pick_vmid_use_fzf() {
  local prompt_title="$1"
  vmid=$(VBoxManage list vms | fzf --reverse --prompt="${prompt_title}> " | awk -F"[{}]" '{print $2}')
}

function vbox-start() {
  check-commands
  pick_vmid_use_fzf "select vm to start on background"
  if [[ -z "$vmid" ]]; then
     echo "Error: No VM selected"
     return 1
  fi
  VBoxManage startvm "$vmid" --type=headless
}

function vbox-stop() {
  check-commands
  pick_vmid_use_fzf "select vm to stop"
  if [[ -z "$vmid" ]]; then
     echo "Error: No VM selected"
     return 1
  fi
  VBoxManage controlvm "$vmid" poweroff
}

function vbox-snapshot() {
  check-commands

  # select vm to make snapshot
  pick_vmid_use_fzf "select vm to make snapshot"
  if [[ -z "$vmid" ]]; then
     echo "Error: No VM selected"
     return 1
  fi

  # input snapshot name and description
  echo "please input snapshot name:"
  read -r snapshot_name

  if [[ -z "$snapshot_name" ]]; then
    echo "snapshot name cannot be empty"
    return 1
  fi

  # input snapshot description
  echo "please input snapshot description:"
  read -r snapshot_desc

  # make snapshot
  VBoxManage snapshot "$vmid" take "$snapshot_name" -description="$snapshot_desc"
}



