#!/bin/fish

#######################################################################
## ssh connection manager
#######################################################################

function sshmgr
    # check dependences
    if not command_exists fzf
        echo 'Error: Not found "fzf" command' >&2
        return 1
    end

    # parse and select host with fzf
    set --local ssh_config "$HOME/.ssh/config"
    if not test -f "$ssh_config"
        echo "Error: SSH config file does not exist: $ssh_config" >&2
        return 1
    end

    set --local host (grep -e "^Host " "$ssh_config" | awk '{print $2}' | fzf --reverse --prompt="Select SSH host> ")

    # handle cancel
    if test -z "$host"
        echo "Selection cancelled" >&2
        return 1
    end

    # connect to host
    ssh -v "$host"
end
