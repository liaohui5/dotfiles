#!/bin/bash

function safe-alias() {
  local alias_name="$1"
  local alias_command="$2"
  local command_to_check=$(echo "$alias_command" | cut -d' ' -f1)

  if command -v "$command_to_check" &>/dev/null; then
    alias "$alias_name"="$alias_command"
  fi
}

# clear
safe-alias 'c' 'clear'

# cp
safe-alias 'cp' 'cp -r'

# reload zshrc
safe-alias 'rc' "source $HOME/.zshrc"

# lsd: https://github.com/Peltoche/lsd
safe-alias 'ls' 'lsd'

# vifm: https://github.com/vifm/vifm
# joshuto: https://github.com/kamiyaa/joshuto
# yazi: https://yazi-rs.github.io/
# alias fm='vifm'
# alias fm='joshuto'
# safe-alias 'fm' 'yazi'

# static web server
# https://static-web-server.net/
safe-alias 'sws' 'static-web-server'

# neofetch: https://github.com/fastfetch-cli/fastfetch
safe-alias 'ff' 'fastfetch'

# git: https://git-scm.com/
# lazygit: https://github.com/jesseduffield/lazygit
# czgit: https://github.com/Zhengqbbb/cz-git
alias gs='git status'
safe-alias 'lg' 'lazygit'

# docker: https://www.docker.com/
# docker & dockerc-compose
safe-alias 'd' 'docker'
safe-alias 'dc' 'docker compose'

# pnpm: https://pnpm.io/
if command -v "pnpm" &>/dev/null; then
  alias pi='pnpm install'
  alias pa='pnpm add'
  alias pr='pnpm remove'
  alias pu='pnpm update'
  alias pU='pnpm self-update'
  alias pd='pnpm run dev'
  alias pt='pnpm run test'
  alias pb='pnpm run build'
fi

# bun: https://bun.sh/
if command -v "bun" &>/dev/null; then
  alias bd='bun run dev'
  alias bt='bun run test'
  alias bb='bun run build'
  alias bs='bun run start'
  alias bm='bun run mock'
fi

# cargo: https://rustwiki.org/zh-CN/cargo/
if command -v "cargo" &>/dev/null; then
  alias cr='cargo run'
  alias ct='cargo test'
  alias cb='cargo build --release'
fi

# neovim: https://github.com/neovim/neovim
# helix:  https://helix-editor.com/
safe-alias 'v' 'nvim'

######### system proxy management ##########
# v2rayU(http:1087 socks5:1080) clash(http:7890 socks5:7890)
alias reset-proxy="export https_proxy='' http_proxy='' all_proxy=''"
function set-proxy() {
  PROXY_APP_NAME="$1"
  PROXY_HTTP_PORT='1087'
  PROXY_SOCK_PORT='1080'
  if [[ $PROXY_APP_NAME == "v2ray" ]]; then
    PROXY_HTTP_PORT='1087'
    PROXY_SOCK_PORT='1080'
  elif [[ $PROXY_APP_NAME == "clash" ]]; then
    PROXY_HTTP_PORT='7890'
    PROXY_SOCK_PORT='7890'
  else
    echo "unknown proxy type"
    exit 1
  fi

  cmd="export https_proxy=http://127.0.0.1:$PROXY_HTTP_PORT http_proxy=http://127.0.0.1:$PROXY_HTTP_PORT all_proxy=socks5://127.0.0.1:$PROXY_SOCK_PORT"
  eval "${cmd}"
}

######### homebrew mirror management ##########
if command -v "brew" &>/dev/null; then
  function set-brew-mirror() {
    echo "请选择 homebrew 镜像源(0:默认源 1:中科大 2:清华 3:北京外国语 4:腾讯 5:阿里): "
    read mirror_id

    mirror_content=""
    if [[ $mirror_id == "0" ]]; then
      mirror_content="#!/bin/bash"
    elif [[ $mirror_id == "1" ]]; then
      mirror_content='#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/bottles"'
    elif [[ $mirror_id == "2" ]]; then
      mirror_content='#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles"'
    elif [[ $mirror_id == "3" ]]; then
      mirror_content='#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.bfsu.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.bfsu.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.bfsu.edu.cn/homebrew-bottles/bottles"'
    elif [[ $mirror_id == "4" ]]; then
      mirror_content='#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.cloud.tencent.com/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/api/"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/bottles"'
    elif [[ $mirror_id == "5" ]]; then
      mirror_content='#!/bin/bash
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.aliyun.com/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.aliyun.com/homebrew/homebrew-bottles"'
    else
      echo "未知源"
      exit 1
    fi

    mirror_file="${HOME}/.shell-scripts/.homebrew_mirror"
    if [[ -f $mirror_file ]]; then
      echo $mirror_content > $mirror_file
      source $mirror_file
      echo "设置成功"
    else
      echo $mirror_content
      echo "文件不存在: ${mirror_file}"
    fi
  }
fi
