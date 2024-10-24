#!/usr/bin/env bash

### init or update submoudles
git submodule update --remote -f --recursive

### nerd font: JetBrinasMono Nerd Font ###
# https://github.com/ryanoasis/nerd-fonts
# https://github.com/subframe7536/maple-font

## terminal emulators ###
brew install --cask wezterm

### vscode editor ###
# brew install --cask visual-studio-code

### git commands ###
# brew install git
# brew install git-delta
# brew install lazygit

### some useful commands ###
# brew install curl lsof gnu-sed fzf lsd bat rg

### file manager for command line ###
# brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide

### neovim and dependences
# brew install neovim
# brew tap daipeihust/tap && brew install im-select

### yabai: bsp window manager like i3wm
# brew install cmacrae/formulae/spacebar
# brew install koekeishiya/formulae/skhd
# brew tap FelixKratz/formulae && brew install sketchybar
# brew install koekeishiya/formulae/yabai

###### prompt style ######
# brew install starship

### fnm node verion manager ###
# brew install fnm

###### node packages ######
### please install node.js first ###
# npm i -g pnpm
# pnpm i -g neovim nrm
# pnpm i -g bun typescript vite zx
# pnpm i -g degit commitizen cz-git czg
