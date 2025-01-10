################################################################
# MacOS language locale
################################################################
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

################################################################
# Added by Windsurf
# https://codeium.com/windsurf
################################################################
windsurf_bin_path="${HOME}/.codeium/windsurf/bin"
if [[ -d "${windsurf_bin_path}" ]]; then
  export PATH="${HOME}/.codeium/windsurf/bin:$PATH"
fi

################################################################
# nvim EDITOR
# https://github.com/neovim/neovim
################################################################
if command -v 'nvim' &>/dev/null; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

################################################################
# starship
# https://starship.rs/zh-CN/
################################################################
if command -v 'starship' &>/dev/null; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
fi

################################################################
# yazi
# https://yazi-rs.github.io/
################################################################
if command -v 'yazi' &>/dev/null; then
  function yazi_fm() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
  alias fm='yazi_fm'
fi

###############################################################
# zoxide
# https://github.com/ajeetdsouza/zoxide
###############################################################
if command -v 'zoxide' &>/dev/null; then
  zoxide_init_file="$HOME/.shelll-scripts/.zoxide.zsh"
  if [[ -f "${zoxide_init_file}" ]]; then
    source "${zoxide_init_file}"
  fi
  eval "$(zoxide init zsh)"
fi

###############################################################
# fzf
# https://github.com/junegunn/fzf
###############################################################
if command -v 'fzf' &>/dev/null; then
  fzf_init_file="$HOME/.shelll-scripts/.fzf.zsh"
  if [[ -f "${fzf_init_file}" ]]; then
    source "${fzf_init_file}"
  fi
fi

################################################################
# adb
# https://developer.android.com/studio/command-line/adb.html
################################################################
if [[ -d "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH=$PATH:"${ANDROID_HOME}/tools"
  export PATH=$PATH:"${ANDROID_HOME}/platform-tools"
fi

################################################################
# pyenv
# https://github.com/pyenv/pyenv
################################################################
if command -v 'pyenv' &>/dev/null; then
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
if command -v 'rustup' &>/dev/null; then
  export RUSTUP_DIST_SERVER="https://rsproxy.cn"
  export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
fi

################################################################
# cargo
# https://github.com/rust-lang/cargo
################################################################
cargo_env_file="$HOME/.cargo/env"
if [ -f "${cargo_env_file}" ]; then
  source "${cargo_env_file}"
fi
if command -v "cargo" &>/dev/null; then
  export PATH="${HOME}/.cargo/bin:$PATH"
  # rsproxy
  # docs: https://rsproxy.cn/
  cat >"${HOME}/.cargo/config.toml" <<EOF
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
# volta
# https://docs.volta.sh
################################################################
if command -v 'volta' &>/dev/null; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
  alias fnm="volta"
fi
