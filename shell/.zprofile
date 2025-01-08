################################################################
# MacOS language locale
################################################################
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

################################################################
# Added by Windsurf
# https://codeium.com/windsurf
################################################################
windsurf_bin_path="/Users/secret/.codeium/windsurf/bin"
if [[ -d "${windsurf_bin_path}" ]]; then
  export PATH="/Users/secret/.codeium/windsurf/bin:$PATH"
fi

################################################################
# nvim EDITOR
# https://github.com/neovim/neovim
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
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
  export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/bottles"
fi

################################################################
# starship
# https://starship.rs/zh-CN/
################################################################
if command -v 'starship' &> /dev/null; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
fi

################################################################
# yazi
# https://yazi-rs.github.io/
################################################################
function yazi_fm() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
alias fm='yazi_fm'

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
if [ -d "$HOME/.pnpm_store" ]; then
  export PNPM_HOME="$HOME/.pnpm_store"
  export PATH="$PNPM_HOME:$PATH"
fi

################################################################
# rustup
# https://github.com/rust-lang/rustup
################################################################
if command -v 'rustup' &> /dev/null; then
  export RUSTUP_DIST_SERVER="https://rsproxy.cn"
  export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
fi

################################################################
# cargo
# https://github.com/rust-lang/cargo
################################################################
if command -v 'cargo' &> /dev/null; then
  export PATH="/Users/$(whoami)/.cargo/bin:$PATH"
  # docs: https://rsproxy.cn/
  cat > "/Users/$(whoami)/.cargo/config.toml" <<EOF
[source.crates-io]
replace-with = 'rsproxy-sparse'
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
[net]
git-fetch-with-cli = true
EOF
fi

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
