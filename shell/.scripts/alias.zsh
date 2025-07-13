#!/usr/bin/env zsh
#################################
# command aliases manager
#################################

# clear
alias c='clear'

# reload zshrc
alias rc="source ${HOME}/.zshrc"

# lsd: https://github.com/Peltoche/lsd
safe-alias 'ls' 'lsd'

# static web server
# https://static-web-server.net/
safe-alias 'sws' 'static-web-server'

# fastfetch
# https://github.com/fastfetch-cli/fastfetch
safe-alias 'ff' 'fastfetch'

# lazygit: https://github.com/jesseduffield/lazygit
safe-alias 'lg' 'lazygit'

# lazysql: https://github.com/jorgerojas26/lazysql
safe-alias 'lzsql' 'lazysql'

# safe remove files
safe-alias 'rm' 'trash'

# docker & compose
# https://www.docker.com/
safe-alias 'd' 'docker'
if has-command 'docker-compose'; then
  safe-alias 'dc' 'docker-compose'
else
  safe-alias 'dc' 'docker compose'
fi

# pnpm: https://pnpm.io/
if has-command 'pnpm'; then
  alias pi='pnpm install'
  alias pa='pnpm add'
  alias pA='pnpm approve-builds'
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
if has-command 'bun'; then
  alias bd='bun run dev'
  alias bs='bun run start'
  alias bt='bun run test'
  alias bb='bun run build'
  alias bm='bun run mock'
fi

# cargo: https://rustwiki.org/zh-CN/cargo/
if has-command 'cargo'; then
  alias cr='cargo run'
  alias ct='cargo test'
  alias cb='cargo build --release'
fi

