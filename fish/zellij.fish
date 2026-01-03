#!/bin/fish

# zellij: https://zellij.dev/

function zj
    if not command_exists zellij
        echo 'Error: Not found "zellij" command' >&2
        return 1
    end

    if not command_exists fzf
        echo 'Error: Not found "fzf" command' >&2
        return 1
    end

    set session (zellij ls -n -s | fzf --reverse --prompt="attach zellij session> ")

    # Check if session is empty (user cancelled selection)
    if test -z "$session"
        echo "Session selection cancelled" >&2
        return 1
    end

    zellij attach "$session"
end
