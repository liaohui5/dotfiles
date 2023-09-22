#!/usr/bin/env bash

git submodule update --init --recursive
brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font
brew install lua
brew install luarocks
brew install git
brew install curl
brew install lsd
brew install ripgrep
brew install gnu-sed
brew install fzf
brew install zoxide
brew install trash
brew install bat
brew install fd
brew install git-delta
brew install lazygit
brew install tree-sitter
brew install neovim
brew install shellcheck
brew tap daipeihust/tap && brew install im-select
# brew install vifm
# brew install joshuto
# brew install koekeishiya/formulae/skhd
# brew install cmacrae/formulae/spacebar
# brew install koekeishiya/formulae/yabai

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

