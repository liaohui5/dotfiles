#!/bin/fish

########################
# 一些命令行软件必须的设置
########################

# vim & nvim EDITOR
# https://github.com/neovim/neovim
if command_exists vim
    set -gx EDITOR vim
else
    set -gx EDITOR nvim
    set -gx NVIM /usr/local/bin/nvim
end

# rustup
# https://rustup.rs/
if command_exists cargo
    # for replace: source ~/.cargo/env
    append_path "$HOME/.cargo/bin"
end

# starship
# https://starship.rs/zh-CN/
if command_exists starship
    starship init fish | source
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
end

# yazi
# https://yazi-rs.github.io/
if command_exists yazi
    function yazi_fm
        set --local tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        set --local cwd (cat -- "$tmp")
        if test -n "$cwd" -a "$cwd" != "$PWD"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    alias fm='yazi_fm'
end

# zoxide
# https://github.com/ajeetdsouza/zoxide
if command_exists zoxide
    zoxide init fish | source
end

# fzf
# https://github.com/junegunn/fzf
if command_exists fzf
    fzf --fish | source
end

# mise
# https://mise.jdx.dev/
if command_exists mise
    ~/.cargo/bin/mise activate fish | source
end

# uv
# https://docs.astral.sh/uv/getting-started
if command_exists uv
    append_path "$HOME/.local/bin:$PATH"
end

# pnpm
# https://pnpm.io/
if command_exists node
    set -gx PNPM_HOME "$HOME/.pnpm_store"
    append_path "$PNPM_HOME"
end
