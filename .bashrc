# command alias
source ~/.shell-scripts/alias.sh

# tools
source ~/.shell-scripts/tools.sh

# virtual box commands
source ~/.shell-scripts/vbox.sh

################################################################
#                             nvim
# docs: https://github.com/nvm-sh/nvm
# nvm-windows: https://github.com/coreybutler/nvm-windows
################################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

################################################################
#                             adb
# docs: https://developer.android.com/studio/command-line/adb.html
################################################################
export ANDROID_HOME=/Users/liaohui5/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

################################################################
#                           ranger
# docs: https://github.com/ranger/ranger
################################################################
export RANGER_LOAD_DEFAULT_RC=FALSE

################################################################
#                           locale
################################################################
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
