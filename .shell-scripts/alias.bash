#!/bin/bash

# reload .zshrc
alias reload='source ~/.zshrc'

# cd ..
alias ..='cd ..'

# clear
alias c='clear'

# cp
alias cp='cp -r'

# lsd: https://github.com/Peltoche/lsd
alias ls='lsd'
alias la='ls -al'

# tmux
alias tmxn='tmux new -s'
alias tmxa='tmux attach'
alias tmxd='tmux detach'

# auto start zellij on bash loaded
# eval "$(zellij setup --generate-auto-start bash)"

# vifm: https://github.com/vifm/vifm
alias vifm='vifm . ~/Desktop/codes'
alias fm='joshuto'

# ranger: https://github.com/ranger/ranger
alias ra='ranger'

# gitmoji-cli: https://github.com/carloscuesta/gitmoji-cli
alias gitcmt='gitmoji -c'

# vscode: https://code.visualstudio.com/
# vscode-insiders: https://code.visualstudio.com/insiders/
alias code='/usr/local/bin/code'
alias codeins='/usr/local/bin/code-insiders'

# neofetch: https://github.com/dylanaraps/neofetch
alias nf='neofetch'

# generator ascii text command: npm install -g figlet-cli
# https://github.com/patorjk/figlet.js
# https://github.com/patorjk/figlet-cli
alias figlet-cli='figlet'

# lazygit: https://github.com/jesseduffield/lazygit
alias lg='lazygit'
alias gs='git status'

# docker & dockerc-compose
alias d='docker'
alias dc='docker-compose'

# pnpm
alias p='pnpm'
alias pi='pnpm install'
alias pd='bun run dev'
alias pt='bun run test'
alias pb='bun run build'
alias pu='pnpm i -g pnpm'

