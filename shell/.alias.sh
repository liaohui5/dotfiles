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

# reload bashrc
safe-alias 'rc' "source $HOME/.bashrc"

# lsd: https://github.com/Peltoche/lsd
safe-alias 'ls' 'lsd'

# vifm: https://github.com/vifm/vifm
# joshuto: https://github.com/kamiyaa/joshuto
# yazi: https://yazi-rs.github.io/
# alias fm='vifm'
# alias fm='joshuto'
safe-alias 'fm' 'yazi'

# neofetch: https://github.com/fastfetch-cli/fastfetch
safe-alias 'fetch' 'fastfetch'

# git: https://git-scm.com/
# lazygit: https://github.com/jesseduffield/lazygit
# czgit: https://github.com/Zhengqbbb/cz-git
safe-alias 'lg' 'lazygit'
safe-alias 'gs' 'git status'

# docker: https://www.docker.com/
# docker & dockerc-compose
safe-alias 'd' 'docker'
safe-alias 'dc' 'docker compose'

# pnpm: https://pnpm.io/
if command -v "pnpm" &>/dev/null; then
  alias pi='pnpm install'
  alias pr='pnpm remove'
  alias pu='pnpm update'
  alias pU='pnpm i -g pnpm'
fi

# bun: https://bun.sh/
if command -v "bun" &>/dev/null; then
  alias bd='bun run dev'
  alias bt='bun run test'
  alias bb='bun run build'
  alias bs='bun run start'
  alias bm='bun run mock'
fi

# neovim: https://github.com/neovim/neovim
# helix:  https://helix-editor.com/
safe-alias 'v' 'nvim'

# copypath
if command -v "pbcopy" &>/dev/null; then
  alias copypath='echo $(pwd) | pbcopy'
fi

# enable or disable proxies
# v2rayU(http:1087 socks5:1080) clashX(http:7890 socks5:7890)
PROXY_HTTP_PORT='7890'
PROXY_SOCK_PORT='7890'
alias setproxy="export https_proxy=http://127.0.0.1:$PROXY_HTTP_PORT http_proxy=http://127.0.0.1:$PROXY_HTTP_PORT all_proxy=socks5://127.0.0.1:$PROXY_SOCK_PORT"
alias resetproxy="export https_proxy='' http_proxy='' all_proxy=''"
resetproxy
