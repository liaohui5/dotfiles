#!/usr/bin/env bash

git submodule update --init --recursive

### nerd font: JetBrinasMono Nerd Font
brew install --cask homebrew/cask-fonts/font-jetbrains-mono-nerd-font

## terminal emulators
brew install --cask wezterm

### vscode editor
brew install --cask visual-studio-code
brew install --cask vscodium

### git commands ###
brew install git
brew install git-delta
brew install lazygit

### some useful commands ###
brew install curl lsof gnu-sed fzf lsd bat rg

### file manager for command line ###
brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide

### neovim and dependences
brew install lua
brew install luarocks
brew install neovim
brew install tree-sitter
brew tap daipeihust/tap/im-select && brew install im-select

### yabai: bsp window manager like i3wm
# brew tap cmacrae/formulae/spacebar && install spacebar
brew tap koekeishiya/formulae/skhd && brew install skhd
brew tap FelixKratz/formulae && brew install sketchybar
brew tap koekeishiya/formulae/yabai && brew install yabai

###### prompt style ######
brew install starship

### fnm node verion manager ###
brew install fnm

###### node packages ######
### must be install node.js first ###
# npm i -g pnpm
# pnpm i -g neovim nrm
# pnpm i -g bun typescript vite zx
# pnpm i -g degit commitizen cz-git czg
