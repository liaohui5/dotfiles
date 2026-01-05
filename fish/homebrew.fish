#!/bin/fish

#####################################################
# 设置 homebrew 源相关命令脚本
#####################################################
set -gx mirror_file_path "$HOME/.brew-mirror.fish"

# 重新加载源
function reload-brew-mirror
    if test -f "$mirror_file_path"
        source "$mirror_file_path"
    end
end

# 清理环境变量 & 文件
function clean-brew-mirror
    set -e HOMEBREW_INSTALL_FROM_API
    set -e HOMEBREW_BREW_GIT_REMOTE
    set -e HOMEBREW_CORE_GIT_REMOTE
    set -e HOMEBREW_API_DOMAIN
    set -e HOMEBREW_BOTTLE_DOMAIN

    if test -f "$mirror_file_path"
        rm -f "$mirror_file_path"
    end
end

# 设置 homebrew 源并保存到文件中
function set-brew-mirror
    if not command_exists brew
        echo '请先安装 homebrew'
        return 0
    end

    echo '请选择 Homebrew 源(0:默认源 1:中科大 2:北京外国语 3:腾讯 4:阿里): '
    read -l mirror_id

    if test $mirror_id -eq 0
        clean-brew-mirror
        echo '=== set to default source ==='
        return 0
    end

    set --local brew_git_remote ''
    set --local core_git_remote ''
    set --local api_domain ''
    set --local bottle_domain ''

    if test $mirror_id -eq 1
        set brew_git_remote 'https://mirrors.ustc.edu.cn/brew.git'
        set core_git_remote 'https://mirrors.ustc.edu.cn/homebrew-core.git'
        set api_domain 'https://mirrors.ustc.edu.cn/homebrew-bottles/api'
        set bottle_domain 'https://mirrors.ustc.edu.cn/homebrew-bottles/bottles'
    else if test $mirror_id -eq 2
        set brew_git_remote 'https://mirrors.bfsu.edu.cn/git/homebrew/brew.git'
        set core_git_remote 'https://mirrors.bfsu.edu.cn/git/homebrew/homebrew-core.git'
        set api_domain 'https://mirrors.bfsu.edu.cn/homebrew-bottles/api'
        set bottle_domain 'https://mirrors.bfsu.edu.cn/homebrew-bottles/bottles'
    else if test $mirror_id -eq 3
        set brew_git_remote 'https://mirrors.cloud.tencent.com/homebrew/brew.git'
        set core_git_remote 'https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git'
        set api_domain 'https://mirrors.cloud.tencent.com/homebrew-bottles/api/'
        set bottle_domain 'https://mirrors.cloud.tencent.com/homebrew-bottles/bottles'
    else if test $mirror_id -eq 4
        set brew_git_remote 'https://mirrors.aliyun.com/homebrew/brew.git'
        set core_git_remote 'https://mirrors.aliyun.com/homebrew/homebrew-core.git'
        set api_domain 'https://mirrors.aliyun.com/homebrew-bottles/api'
        set bottle_domain 'https://mirrors.aliyun.com/homebrew/homebrew-bottles'
    else
        echo 'unknown source id'
        return 1
    end

    # 清理环境 & 重新设置
    clean-brew-mirror
    set --local shell_content "#!/bin/fish
set -gx HOMEBREW_INSTALL_FROM_API 1
set -gx HOMEBREW_BREW_GIT_REMOTE \"$brew_git_remote\"
set -gx HOMEBREW_CORE_GIT_REMOTE \"$core_git_remote\"
set -gx HOMEBREW_API_DOMAIN \"$api_domain\"
set -gx HOMEBREW_BOTTLE_DOMAIN \"$bottle_domain\"
"
    echo -n "$shell_content" >"$mirror_file_path"

    # 重新加载并输出提示信息
    reload-brew-mirror
    echo '=== set mirror success ==='
    echo "brew_git_remote: $brew_git_remote"
    echo "core_git_remote: $core_git_remote"
    echo "api_domain     : $api_domain"
    echo "bottle_domain  : $bottle_domain"
end

# 首先自动加载一次
reload-brew-mirror
