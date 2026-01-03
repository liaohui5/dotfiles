#!/bin/fish

# MacOS language locale
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

######################################################################
# 配置入口文件
######################################################################

# 判断一个命令是否存在
function command_exists
    if command -v $argv[1] >/dev/null 2>&1
        return 0
    else
        return 1
    end
end

# 判断一个文件是否存在
function file_exists
    if test -f $argv[1]
        return 0
    else
        return 1
    end
end

# 如果命令存在才创建命令别名
# 使用方法: safe_alias <alias_name> <command>
function safe_alias
    set --local alias_name $argv[1]
    set --local command $argv[2]
    if command_exists $command
        alias $alias_name $command
    end
end

# 载入某个文件(如果文件存在)
function source_file_if_exists
    set --local target_file_path $argv[1]
    if test -f $target_file_path
        source $target_file_path
    else
        echo "File: $target_file_path does not exist"
    end
end

# 将字符串添加到 PATH
function append_path
    set --local new_path $argv[1]

    # 检查路径是否存在且不在 PATH 中
    if test -d "$new_path"
        if not contains -- "$new_path" $PATH
            set -gx PATH $PATH "$new_path"
        end
    end
end

# 加载命令别名脚本
source_file_if_exists "$HOME/.config/fish/aliases.fish"

# 加载软件设置选项脚本
source_file_if_exists "$HOME/.config/fish/softwares.fish"

# 加载系统代理设置脚本
source_file_if_exists "$HOME/.config/fish/proxy.fish"

# 加载 ssh 会话管理脚本
source_file_if_exists "$HOME/.config/fish/ssh_manager.fish"

# 加载设置 homebrew 镜像源的设置脚本
if command_exists brew
    source_file_if_exists "$HOME/.config/fish/homebrew.fish"
end

# 加载 zellij 会话管理脚本
if command_exists zellij
    source_file_if_exists "$HOME/.config/fish/zellij.fish"
end

# 这个文件会被 git 忽略, 所以可以在其中定义一些
# 比较私密的环境变量, 比如有的命令行软件需要使用 OpenAI 的密钥
# 那么就可以自动将 API 密钥等私密信息加载到环境变量中
source_file_if_exists "$HOME/.config/fish/_profile.fish"
