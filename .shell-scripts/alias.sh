#!/usr/local/bin/bash

# reload .zshrc
alias reload='source ~/.zshrc'

# cd ..
alias ..='cd ..'

# soft delete
# alias rm='trash'

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
alias fx='joshuto'

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
alias pi='pnpm install'
alias pr='pnpm remove'
alias pu='pnpm update'
alias pd='pnpm run dev'
alias pt='pnpm run test'
alias pb='pnpm run build'
alias pU='pnpm i -g pnpm'
alias pS='pnpm run start'

# bun
alias bd='bun run dev'
alias bt='bun run test'
alias bb='bun run build'
alias bs='bun run start'
