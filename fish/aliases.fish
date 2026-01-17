#!/bin/fish
#################################
# command aliases manager
#################################

# clear
alias c='clear'

# reload config
alias rc="source $HOME/.config/fish/config.fish"

# lsd: https://github.com/Peltoche/lsd
safe_alias ls lsd

# static web server
# https://github.com/vercel/serve
# https://github.com/vitejs/vite
# https://github.com/svenstaro/miniserve
# https://github.com/TheWaWaR/simple-http-server
if command_exists simple-http-server
    alias sws='simple-http-server . -p 3000'
else if command_exists miniserve
    alias sws='miniserve . -p 3000'
else if command_exists serve
    alias sws='serve . -p 3000'
else if command_exists vite
    alias sws='vite . -p 3000'
else
    printf "no static web server found, please install one of the following:\n"
    printf "\t https://github.com/vercel/serve\n"
    printf "\t https://github.com/vitejs/vite\n"
    printf "\t https://github.com/svenstaro/miniserve\n"
    printf "\t https://github.com/TheWaWaR/simple-http-server\n"
end

# fastfetch
# https://github.com/fastfetch-cli/fastfetch
safe_alias ff fastfetch

# lazygit: https://github.com/jesseduffield/lazygit
safe_alias lg lazygit

# safe remove files
safe_alias rm trash

# docker & compose
# https://www.docker.com/
if command_exists docker
    alias d='docker'
    alias dc='docker compose'
    alias dcu='docker compose up'
    alias dcd='docker compose down'
end

# pnpm: https://pnpm.io/
if command_exists pnpm
    alias pi='pnpm install'
    alias pa='pnpm approve-builds'
    alias pr='pnpm remove'
    alias pu='pnpm update'
    alias pU='pnpm self-update'
    alias pd='pnpm run dev'
    alias ps='pnpm run start'
    alias pt='pnpm run test'
    alias pb='pnpm run build'
    alias pm='pnpm run mock'
end

# bun: https://bun.sh/
if command_exists bun
    alias bd='bun run dev'
    alias bs='bun run start'
    alias bt='bun run test'
    alias bb='bun run build'
    alias bm='bun run mock'
end

# https://github.com/denoland/deno
if command_exists deno
    alias dd='deno run dev'
    alias ds='deno run start'
    alias dt='deno run test'
    alias db='deno run build'
    alias dm='deno run mock'
end

# cargo: https://rustwiki.org/zh-CN/cargo/
if command_exists cargo
    alias cr='cargo run'
    alias ct='cargo test'
    alias cb='cargo build --release'
end

# just: https://just.systems/man/zh/%E8%AF%B4%E6%98%8E.html
if command_exists just
    alias j='just'
    alias jd='just dev'
    alias js='just start'
    alias jt='just test'
    alias jr='just run'
    alias jb='just build'
    alias jm='just mock'
    # Note: jd='just doc' was a duplicate alias, removed
end
