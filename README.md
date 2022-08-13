## 介绍

各种命令行工具的配置文件, 每次换电脑都重新配置, 太麻烦了

## 注意:

1. 注意先安装对应的软件和插件, 然后再链接配置, 否则会报错, 缺少插件, 缺少命令之类的
2. 有些配置需要先删除老的配置然后才能连接成功

## 安装

```sh
# 注: 有子模块, 需要递归克隆,建议安装的时候,更新子模块
git clone https://github.com/maonx/vimwiki-assets.git assets --recursive

# 更新子模块
git submodule update

# 通过 dotbot 创建软连接
./install
```

#### [nvim](https://github.com/neovim/neovim)

```sh
# 安装packer
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# 安装插件
:PackerSync

# 建议阅读README, 如果有报错, 请查看对应的插件配置
```

#### [Alacritty](https://github.com/alacritty/alacritty)

```
brew install alacritty

cd dotfiles

cp ./alacritty  ~/.config/alacritty
```

#### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

```sh
# 安装 oh-my-zsh 之前, 请先把 zsh 安装好: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

# 1: 确保没有 .oh-my-zsh 目录
rm -rf ~/.oh-my-zsh

# 2: 安装 oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3: 安装对应插件
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

#### [ranger](https://github.com/ranger/ranger)

```sh
# 注意:不能用 brew install ranger, 这样安装无法和 rnvimr 通信, 导致 nvim rnvimr 插件报错
# 如果不需要使用 rnvimr 就直接 brew install ranger 是可以的
# 注意: 使用 pip3 安装可能无法直接用, 需要手动 ln -s ranger /usr/local/bin/ranger
pip3 install ranger-fm

# 生成配置文件/配置文件目录
ranger --copy-config=all

# 文件图标
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

# 不要使用默认的配置文件rc, 如果有这行就不用执行了
echo "export RANGER_LOAD_DEFAULT_RC=FALSE" >> ~/.bashrc
```

### [zellij](https://github.com/zellij-org/zellij)

```js
# 直接安装
brew install zellij

# 或者利用 rust 包管理器 cargo 安装
brew install rust
cargo-binstall zellij
```
