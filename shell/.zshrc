#!/usr/bin/env zsh
################################################################
# execute zprofile
# zshrc -> zprofile -> .scripts/main.zsh
################################################################

# zsh profile
source "${HOME}/.zprofile"

# bashrc & bash profile
[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"
[[ -f "${HOME}/.bashrc" ]] && source "${HOME}/.bashrc"

# alias
source "${HOME}/.scripts/main.zsh"
