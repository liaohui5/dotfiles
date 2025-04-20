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

# safe remove files
alias rm='safe-rm'
TRASH_DIR="$HOME/.Trash"
function safe-rm() {
  if [[ "$*" =~ -[rf] ]]; then
    echo "错误: 已禁用 rm -rf 参数, 请直接指定文件路径"
    return 1
  fi

  [ ! -d "$TRASH_DIR" ] && mkdir -p "$TRASH_DIR"
  for file in "$@"; do
    if [ -e "$file" ]; then
      timestamp=$(date +"%Y_%m_%d_%H:%M:%S")
      filename=$(basename "$file")
      eval "mv $file ${TRASH_DIR}/${timestamp}_${filename}"
    else
      echo "错误: 文件 '$file' 不存在"
    fi
  done
}

# clean trash
function trash-clean() {
  echo "确认清空回收站？[y/N] "
  read -r confirm
  if [[ "$confirm" = "y" || "$confirm" = "Y" || "$confirm" = "yes" || "$confirm" = "YES" ]]; then
    echo "Cleaning trash..."
    /bin/rm -rf "${TRASH_DIR:?}/"*(N) && echo "Trash cleaned"
  fi
}
