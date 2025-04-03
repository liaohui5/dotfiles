#!/usr/bin/env zsh
################################################################
# desc: system path management, register global commands
################################################################

################################################################
# nvim EDITOR
# https://github.com/neovim/neovim
################################################################
if has-command 'nvim'; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

################################################################
# starship
# https://starship.rs/zh-CN/
################################################################
if has-command 'starship'; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
fi

################################################################
# windserf
# https://codeium.com/windsurf
# use like vscode: windsurf ./codes
################################################################
local windsurf_bin_path="${HOME}/.codeium/windsurf/bin"
if [[ -d "${windsurf_bin_path}" ]]; then
  export PATH="$windsurf_bin_path:$PATH"
fi

################################################################
# yazi
# https://yazi-rs.github.io/
################################################################
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

###############################################################
# zoxide
# https://github.com/ajeetdsouza/zoxide
###############################################################
if has-command 'zoxide'; then
  eval "$(zoxide init zsh)"
fi

###############################################################
# fzf
# https://github.com/junegunn/fzf
###############################################################
if has-command 'fzf'; then
  source <(fzf --zsh)
fi

################################################################
# adb
# https://developer.android.com/studio/command-line/adb.html
################################################################
local android_home_path="$HOME/Library/Android/sdk"
if [[ -d "$android_home_path" ]]; then
  export ANDROID_HOME="$android_home_path"
  export PATH=$PATH:"$android_home_path/tools"
  export PATH=$PATH:"$android_home_path/platform-tools"
fi

################################################################
# pyenv
# https://github.com/pyenv/pyenv
################################################################
if has-command 'pyenv'; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$PYENV_ROOT/shims:$PATH"
  eval "$(pyenv init -)"
fi

################################################################
# pnpm
# https://pnpm.io/
################################################################
if has-command 'pnpm'; then
  export PNPM_HOME="$HOME/.pnpm_store"
  export PATH="$PNPM_HOME:$PATH"
fi

################################################################
# fnm
# https://github.com/Schniz/fnm
################################################################
if has-command 'fnm'; then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
fi
