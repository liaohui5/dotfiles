#!/usr/bin/env zsh
################################################################
# define helper functions
################################################################

# MacOS language locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# keybindings
bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search
bindkey '^H' backward-char
bindkey '^L' forward-char

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

# check file exists 
function file-exists() {
    if [[ -f "$1" ]]; then
        return 0
    else
        return 1
    fi
}

# source file if file exists
function safe-source() {
    target_file="$1"
    if file-exists "$target_file"; then
        source "$target_file"
    else
        echo "File: $target_file does not exist"
    fi
}

# add local path to system path env
function append-path() {
  local new_path="$1"
  if [[ -d "$new_path" ]]; then
    case ":$PATH:" in
      *:"$new_path":*)
        ;;
      *)
        export PATH="$PATH:$new_path"
        ;;
    esac
  fi
}

# zsh scripts saved directory
ZSH_SCRIPTS_DIR="$HOME/.zsh-scripts"

# load zsh scripts
safe-source "$HOME/.zprofile"
safe-source "$ZSH_SCRIPTS_DIR/softwares.zsh"
safe-source "$ZSH_SCRIPTS_DIR/alias.zsh"
safe-source "$ZSH_SCRIPTS_DIR/proxy.zsh"
safe-source "$ZSH_SCRIPTS_DIR/ssh-manager.zsh"

# load software specific zsh scripts
if has-command VBoxManage; then
    safe-source "$ZSH_SCRIPTS_DIR/vbox-manager.zsh"
fi
if has-command brew; then
    safe-source "$ZSH_SCRIPTS_DIR/homebrew.zsh"
fi
if has-command zellij; then
    safe-source "$ZSH_SCRIPTS_DIR/zellij.zsh"
fi
