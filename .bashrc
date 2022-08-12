# cd ..
alias ..='cd ..'

# cd to codes
alias cc='cd ~/Desktop/codes'

# clear
alias c='clear'

# ls -> lsd | ll -> ls -al
alias ls='lsd'
alias la='ls -al'

# vim -> nvim && mvim -> nvim
alias vi='nvim'
alias vim='nvim'
alias mvim='nvim'

# tmux
alias tnew='tmux new -s'

# zellij
alias zj='zellij'

# vifm
alias vifm='vifm . ~/Desktop/codes'

# ranger
alias ra='ranger'

# gitmoji-cli: npm install -g gitmoji-cli & brew install gitmoji
alias gitcmt='gitmoji -c'

# vscode & vscode-insiders
alias code='/usr/local/bin/code --disable-gpu'
alias codeins='/usr/local/bin/code-insiders --disable-gpu'

# mit open source license, username liaohui5
alias mitlicense="curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/LICENSE"

# generate git ignore file
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

# virtualbox server start,poweroff,ssh commands
declare -A servers
servers[centos7]='192.168.56.22'
servers[debian11]='192.168.56.33'

function vbox() {
  if [[ $1 == 'start' ]]; then
      VBoxManage startvm "$2" --type headless
  elif [[ $1 == 'ssh' ]]; then
      ssh root@"${servers[$2]}"
  elif [[ $1 == 'halt' || $1 == 'stop' || $1 == 'poweroff' ]]; then
      VBoxManage controlvm "$2" poweroff
  else
      echo 'Only supported [start, ssh, halt] commands'
  fi
}

# nvm: https://github.com/nvm-sh/nvm
# nvm-windows: https://github.com/coreybutler/nvm-windows
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# adb: https://developer.android.com/studio/command-line/adb.html
export ANDROID_HOME=/Users/liaohui5/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# set locale
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# auto start zellij
eval "$(zellij setup --generate-auto-start bash)"
