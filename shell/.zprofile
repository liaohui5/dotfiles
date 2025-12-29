#!/usr/bin/env zsh
################################################################
# define helper functions
################################################################
function has-command() {
  command -v "$1" >/dev/null 2>&1
}

# MacOS language locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# vim & nvim EDITOR
# https://github.com/neovim/neovim
if has-command 'vim'; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export NVIM="/usr/local/bin/nvim"
fi

# starship
# https://starship.rs/zh-CN/
if has-command 'starship'; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="${HOME}/.config/starship/config.toml"
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
  eval "$(fzf --zsh)"
fi

# rustup
# https://rustup.rs/
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi

# mise
if [[ -f "$HOME/.cargo/bin/mise" ]]; then
  eval "$(~/.cargo/bin/mise activate zsh)"
fi

# uv
# https://docs.astral.sh/uv/getting-started
if has-command 'uv'; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# pnpm
# https://pnpm.io/
if has-command 'node'; then
  export PNPM_HOME="$HOME/.pnpm_store"
  export PATH="$PNPM_HOME:$PATH"
fi
