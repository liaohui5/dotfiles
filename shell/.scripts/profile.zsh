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
