###############################################################
# source bashrc&profile add /usr/sbin to PATH
###############################################################
function command_exists() {
    if command -v "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

source ~/.bashrc
source ~/.profile
export PATH="/usr/local/sbin:$PATH"

################################################################
# MacOS language locale
################################################################
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

###############################################################
# starship
# https://starship.rs/
###############################################################
if command_exists 'starship'; then
  export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
  eval "$(starship init zsh)"
fi

###############################################################
# fzf
# https://github.com/junegunn/fzf
###############################################################
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

################################################################
# nvim
# docs: https://github.com/nvm-sh/nvm
# nvm-windows: https://github.com/coreybutler/nvm-windows
################################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

################################################################
# adb
# https://developer.android.com/studio/command-line/adb.html
################################################################
if [[ -d "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

################################################################
# pnpm
# https://pnpm.io/
################################################################
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

################################################################
# nvim
# https://github.com/neovim/neovim
################################################################
if command_exists 'nvim'; then
  export EDITOR='nvim'
  alias vi='nvim'
else
  export EDITOR='vim'
  alias vi='vim'
fi

################################################################
# cargo
# https://github.com/rust-lang/cargo
################################################################
export PATH=/Users/liaohui5/.cargo/bin:$PATH

################################################################
# bun completions
# https://bun.sh/
################################################################
[ -s "/Users/liaohui5/.bun/_bun" ] && source "/Users/liaohui5/.bun/_bun"
