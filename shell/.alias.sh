#!/bin/bash
# clear
alias c="clear"

# reload zshrc
alias rc="source ${HOME}/.zshrc"

# lsd: https://github.com/Peltoche/lsd
if command -v "lsd" &>/dev/null; then
  alias ls='lsd'
fi

# static web server
# https://static-web-server.net/
if command -v "sws" &>/dev/null; then
  alias sws='static-web-server'
fi

# fastfetch
# https://github.com/fastfetch-cli/fastfetch
if command -v "fastfetch" &>/dev/null; then
  alias ff='fastfetch'
fi

# lazygit: https://github.com/jesseduffield/lazygit
if command -v "lazygit" &>/dev/null; then
  alias lg='lazygit'
fi

# docker & compose
# https://www.docker.com/
if command -v "docker" &>/dev/null; then
  alias d='docker'
fi
if command -v "docker-compose" &>/dev/null; then
  alias dc='docker-compose'
elif command -v "docker compose" &>/dev/null; then
  alias dc='docker compose'
fi

# pnpm: https://pnpm.io/
if command -v "pnpm" &>/dev/null; then
  alias pi='pnpm install'
  alias pa='pnpm add'
  alias pr='pnpm remove'
  alias pu='pnpm update'
  alias pU='pnpm self-update'
  alias pd='pnpm run dev'
  alias ps='pnpm run start'
  alias pt='pnpm run test'
  alias pb='pnpm run build'
  alias pm='pnpm run mock'
fi

# bun: https://bun.sh/
if command -v "bun" &>/dev/null; then
  alias bd='bun run dev'
  alias bs='bun run start'
  alias bt='bun run test'
  alias bb='bun run build'
  alias bm='bun run mock'
fi

# cargo: https://rustwiki.org/zh-CN/cargo/
if command -v "cargo" &>/dev/null; then
  alias cr='cargo run'
  alias ct='cargo test'
  alias cb='cargo build --release'
fi

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
