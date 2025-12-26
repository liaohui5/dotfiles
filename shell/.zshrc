#!/usr/bin/env zsh
################################################################
# execute zprofile
# zshrc -> zprofile -> .scripts/main.zsh
################################################################

# zsh profile
# 存放一些软件的初始化信息, 如: uv/mise/fnm 等
source "${HOME}/.zprofile"

# bash profile: 可以存放一些API密钥之类的信息供命令行软件使用
# $HOME/.profile 这个文件会被 git 忽略, 所以可以存放比较私密的信息
[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

# bashrc: 仅为了兼容 base
[[ -f "${HOME}/.bashrc" ]] && source "${HOME}/.bashrc"

# alias
source "${HOME}/.scripts/main.zsh"
