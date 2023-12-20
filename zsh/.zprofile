################################################################
# source bashrc
################################################################
source ~/.bashrc

################################################################
# MacOS language locale
################################################################
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# get command is installed or not
function command_exists() {
  if command -v "$1" &>/dev/null; then
    return 0
  else
    return 1
  fi
}

################################################################
# set homebrew server -> https://brew.idayer.com/guide/change-source
################################################################
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.cloud.tencent.com/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/api/"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/bottles"

################################################################
# OrbStack command-line tools and integration
################################################################
orbstack_shell="$HOME/.orbstack/shell/init.zsh"
if [[ -f "$orbstack_shell" ]]; then
  source $orbstack_shell 2>/dev/null || :
fi

################################################################
# starship
# https://starship.rs/zh-CN/
################################################################
if command_exists 'starship'; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
fi

###############################################################
# zoxide
# https://github.com/ajeetdsouza/zoxide
###############################################################
if command_exists 'zoxide'; then
  eval "$(zoxide init zsh)"
fi

###############################################################
# fzf
# https://github.com/junegunn/fzf
###############################################################
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
fi

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
# cargo
# https://github.com/rust-lang/cargo
################################################################
export PATH="/Users/liaohui5/.cargo/bin:$PATH"

################################################################
# bun completions
# https://bun.sh/
################################################################
[ -s "/Users/liaohui5/.bun/_bun" ] && source "/Users/liaohui5/.bun/_bun"

################################################################
# fnm
# https://github.com/Schniz/fnm#shell-setup
################################################################
export PATH="/Users/liaohui5/Library/Caches/fnm_multishells/99384_1695378755640/bin":$PATH
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_RESOLVE_ENGINES="false"
export FNM_DIR="/Users/liaohui5/Library/Application Support/fnm"
export FNM_LOGLEVEL="info"
export FNM_COREPACK_ENABLED="false"
export FNM_ARCH="x64"
export FNM_MULTISHELL_PATH="/Users/liaohui5/Library/Caches/fnm_multishells/99384_1695378755640"
rehash
