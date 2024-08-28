################################################################
# MacOS language locale
################################################################
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

################################################################
# EDITOR
################################################################
if command -v 'nvim' &> /dev/null; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

################################################################
# set homebrew server -> https://brew.idayer.com/guide/change-source
################################################################
if command -v 'brew' &> /dev/null; then
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.cloud.tencent.com/homebrew/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git"
  export HOMEBREW_API_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/api/"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles/bottles"
fi

################################################################
# starship
# https://starship.rs/zh-CN/
################################################################
if command -v 'starship' &> /dev/null; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
fi

###############################################################
# zoxide
# https://github.com/ajeetdsouza/zoxide
###############################################################
if command -v 'zoxide' &> /dev/null; then
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
# Blender
# https://docs.blender.org/manual/zh-hans/dev/advanced/command_line/launch/macos.html
################################################################
if [[ -d "/Applications/Blender.app/Contents/MacOS" ]]; then
  export BLENDER_PATH="/Applications/Blender.app/Contents/MacOS"
  export PATH="$BLENDER_PATH:$PATH"
fi

################################################################
# pyenv
# https://github.com/pyenv/pyenv
################################################################
if command -v 'pyenv' &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$PYENV_ROOT/shims:$PATH"
  eval "$(pyenv init -)"
fi

################################################################
# pnpm
# https://pnpm.io/
################################################################
if command -v 'pnpm' &> /dev/null; then
  export PNPM_HOME="$HOME/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

################################################################
# cargo
# https://github.com/rust-lang/cargo
################################################################
if command -v 'cargo' &> /dev/null; then
  export PATH="/Users/$(whoami)/.cargo/bin:$PATH"
fi

################################################################
# bun completions
# https://bun.sh/
################################################################
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"

################################################################
# fnm
# https://github.com/Schniz/fnm#shell-setup
################################################################
if command -v fnm &> /dev/null; then
  export PATH="${HOME}/Library/Caches/fnm_multishells/99384_1695378755640/bin":$PATH
  export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
  export FNM_VERSION_FILE_STRATEGY="local"
  export FNM_RESOLVE_ENGINES="false"
  export FNM_DIR="${HOME}/Library/Application Support/fnm"
  export FNM_LOGLEVEL="info"
  export FNM_COREPACK_ENABLED="false"
  export FNM_ARCH="x64"
  export FNM_MULTISHELL_PATH="${HOME}/Library/Caches/fnm_multishells/99384_1695378755640"
  rehash
fi
