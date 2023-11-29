#!/usr/bin/env bash

git submodule update --init --recursive

### nerd font: JetBrinasMono Nerd Font
brew install --cask homebrew/cask-fonts/font-jetbrains-mono-nerd-font

## terminal emulators
# brew install --cask kitty
# brew install --cask alacritty
# brew install --cask rio
brew install --cask wezterm

### some commands
brew install git curl lsof gnu-sed fzf lsd ripgrep zoxide bat fd rg lazygit git-delta unar jq fnm tmux

### file manager for command line
# brew install vifm
# brew install joshuto
brew install yazi

### neovim and dependences
brew install lua luarocks neovim tree-sitter
brew tap daipeihust/tap/im-select && brew install im-select
# brew install --cask neovide
# brew install --cask goneovim

### yabai: bsp window manager like i3wm
# brew tap cmacrae/formulae/spacebar && install spacebar
brew tap koekeishiya/formulae/skhd && brew install skhd
brew tap FelixKratz/formulae && brew install sketchybar
brew tap koekeishiya/formulae/yabai && brew install yabai

### vscode editor
brew install --cask visual-studio-code
# brew install --cask vscodium

###### node packages ######
# npm i -g pnpm
# pnpm i -g neovim nrm
# pnpm i -g bun typescript vite zx
# pnpm i -g degit commitizen cz-git czg

###### prompt style ######
### starship
brew install starship

### oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
