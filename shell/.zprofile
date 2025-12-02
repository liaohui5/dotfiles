#!/usr/bin/env zsh
################################################################
# define helper functions
################################################################
function has-command() {
  if command -v "$1" >/dev/null; then
    return 0
  else
    return 1
  fi
}

# MacOS language locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# nvim EDITOR
# https://github.com/neovim/neovim
if has-command 'nvim'; then
  export EDITOR='nvim'
  export NVIM="/usr/local/bin/nvim"
else
  export EDITOR='vim'
  export NVIM="/usr/local/bin/nvim"
fi

# load bash profile if exists
local bash_profile="${HOME}/.profile"
if [[ -f "${bash_profile}" ]]; then
  source "${bash_profile}"
fi

# trash command
local trash_bin_path="/usr/local/opt/trash/bin"
if [[ -d "${trash_bin_path}" ]]; then
  export PATH="$trash_bin_path:$PATH"
fi

# starship
# https://starship.rs/zh-CN/
if has-command 'starship'; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
fi

# windserf
# use like vscode: windsurf ./codes
# https://codeium.com/windsurf
local windsurf_bin_path="${HOME}/.codeium/windsurf/bin"
if [[ -d "${windsurf_bin_path}" ]]; then
  export PATH="$windsurf_bin_path:$PATH"
fi

# yazi
# https://yazi-rs.github.io/
if has-command 'yazi'; then
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

# zoxide
# https://github.com/ajeetdsouza/zoxide
if has-command 'zoxide'; then
  eval "$(zoxide init zsh)"
fi

# fzf
# https://github.com/junegunn/fzf
if has-command 'fzf'; then
  source <(fzf --zsh)
fi

# adb
# https://developer.android.com/studio/command-line/adb.html
local android_home_path="$HOME/Library/Android/sdk"
if [[ -d "$android_home_path" ]]; then
  export ANDROID_HOME="$android_home_path"
  export PATH=$PATH:"$android_home_path/tools"
  export PATH=$PATH:"$android_home_path/platform-tools"
fi

# uv
# https://docs.astral.sh/uv/getting-started
export PATH="$HOME/.local/bin:$PATH"

# pnpm
# https://pnpm.io/
if has-command 'node'; then
  export PNPM_HOME="$HOME/.pnpm_store"
  export PATH="$PNPM_HOME:$PATH"
fi

# fnm
# https://github.com/Schniz/fnm
if has-command 'fnm'; then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
fi

# rustup
# https://rustup.rs/
if has-command 'rustup'; then
  source "$HOME/.cargo/env"
fi
