#!/usr/bin/env zsh
#####################################################
# brew mirror management
#####################################################
local mirror_file_path="${HOME}/.brew-mirror.sh"

# if want change brew mirror forever, you have to write source to $mirror_file_path
function reload-brew-mirror() {
  if [[ -f "${mirror_file_path}" ]]; then
    source "${mirror_file_path}"
  fi
}

function clean-brew-mirror() {
  # clean env
  unset HOMEBREW_INSTALL_FROM_API
  unset HOMEBREW_BREW_GIT_REMOTE
  unset HOMEBREW_CORE_GIT_REMOTE
  unset HOMEBREW_API_DOMAIN
  unset HOMEBREW_BOTTLE_DOMAIN

  # clean file
  if [[ -f "${mirror_file_path}" ]]; then
    rm -f "${mirror_file_path}"
  fi
}

function set-brew-mirrors() {
  if has-command 'brew' -eq '0'; then
    echo 'brew not found, Please install brew first'
    return 0
  fi

  echo '请选择 Homebrew 源(0:默认源 1:中科大 2:北京外国语 3:腾讯 4:阿里): '
  read -r mirror_id

  if [[ $mirror_id -eq '0' ]]; then
    clean-brew-mirror
    echo '=== set to default source ==='
    return 0
  fi

  local brew_git_remote=''
  local core_git_remote=''
  local api_domain=''
  local bottle_domain=''

  if [[ $mirror_id -eq "1" ]]; then
    brew_git_remote='https://mirrors.ustc.edu.cn/brew.git'
    core_git_remote='https://mirrors.ustc.edu.cn/homebrew-core.git'
    api_domain='https://mirrors.ustc.edu.cn/homebrew-bottles/api'
    bottle_domain='https://mirrors.ustc.edu.cn/homebrew-bottles/bottles'
  elif [[ $mirror_id -eq "2" ]]; then
    brew_git_remote='https://mirrors.bfsu.edu.cn/git/homebrew/brew.git'
    core_git_remote='https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git'
    api_domain='https://mirrors.bfsu.edu.cn/homebrew-bottles/api'
    bottle_domain='https://mirrors.bfsu.edu.cn/homebrew-bottles/bottles'
  elif [[ $mirror_id -eq "3" ]]; then
    brew_git_remote='https://mirrors.cloud.tencent.com/homebrew/brew.git'
    core_git_remote='https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git'
    api_domain='https://mirrors.cloud.tencent.com/homebrew-bottles/api/'
    bottle_domain='https://mirrors.cloud.tencent.com/homebrew-bottles/bottles'
  elif [[ $mirror_id -eq "4" ]]; then
    brew_git_remote='https://mirrors.aliyun.com/homebrew/brew.git'
    core_git_remote='https://mirrors.aliyun.com/homebrew/homebrew-core.git'
    api_domain='https://mirrors.aliyun.com/homebrew-bottles/api'
    bottle_domain='https://mirrors.aliyun.com/homebrew/homebrew-bottles'
  else
    echo 'unknown source id'
    return 1
  fi

  # clean old envs and files
  clean-brew-mirror

  # write new envs to file
  local shell_content="#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_BREW_GIT_REMOTE=\"${brew_git_remote}\"
export HOMEBREW_CORE_GIT_REMOTE=\"${core_git_remote}\"
export HOMEBREW_API_DOMAIN=\"${api_domain}\"
export HOMEBREW_BOTTLE_DOMAIN=\"${bottle_domain}\"
"
  echo $shell_content >"${mirror_file_path}"

  # reload and print new envs
  reload-brew-mirror
  echo '=== set mirror success ==='
  echo "brew_git_remote: ${brew_git_remote}"
  echo "core_git_remote: ${core_git_remote}"
  echo "api_domain     : ${api_domain}"
  echo "bottle_domain  : ${bottle_domain}"
}

# auto reload
reload-brew-mirror
