# 查看当前正在运行的虚拟机
function vbox-ls
    VBoxManage list runningvms
end

# 命令存在性检查
function check_commands
    if not type -q VBoxManage
        echo 'Error: VBoxManage command not found' >&2
        return 1
    end
    if not type -q fzf
        echo 'Error: fzf command not found' >&2
        return 1
    end
end

# 通过 fzf 选择 VM (返回选中的 UUID)
function pick_vmid_use_fzf --argument prompt_title
    set -l selected (VBoxManage list vms | \
        fzf --reverse --prompt="$prompt_title> " | \
        awk -F'[{}]' '{print $2}' | string trim)

    if test -z "$selected"
        return 1
    else
        echo $selected
    end
end

# 启动 VM (后台模式)
function vbox-start
    check_commands
    or return 1

    set vmid (pick_vmid_use_fzf "select vm to start without GUI")
    or begin
        echo "Error: No VM selected"
        return 1
    end

    VBoxManage startvm "$vmid" --type headless
end

# 停止 VM
function vbox-stop
    check_commands
    or return 1

    set vmid (pick_vmid_use_fzf "select vm to stop")
    or begin
        echo "Error: No VM selected"
        return 1
    end

    VBoxManage controlvm "$vmid" poweroff
end

# 创建快照
function vbox-snapshot
    check_commands
    or return 1

    set vmid (pick_vmid_use_fzf "select vm to make snapshot")
    or begin
        echo "Error: No VM selected"
        return 1
    end

    # 读取快照名称
    read -p "please input snapshot name: " snapshot_name
    if test -z "$snapshot_name"
        echo "snapshot name cannot be empty"
        return 1
    end

    # 读取快照描述
    read -p "please input snapshot description: " snapshot_desc

    # 创建快照
    VBoxManage snapshot "$vmid" take "$snapshot_name" --description "$snapshot_desc"
end
