### homebrew-start
export HOMEBREW_API_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/api        #brew.idayer.com
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles #brew.idayer.com

# Added by OrbStack: command-line tools and integration
orbstack_shell="$HOME/.orbstack/shell/init.zsh"
if [[ -f "$orbstack_shell" ]]; then
  source $orbstack_shell 2>/dev/null || :
fi
