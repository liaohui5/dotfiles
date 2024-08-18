## yabai

[yabai](https://github.com/koekeishiya/yabai) 是一个 macos 平铺式窗口管理工具, 功能类似 linux 平台的 i3wm

在开始配置之前,建议先看[wiki](https://github.com/koekeishiya/yabai/wiki)

<span style="color: #ff0000">因为很多功能需要关闭SIP,所以请先关闭SIP</span>

## 安装

```sh
# 安装最新版本
brew tap koekeishiya/formulae/skhd && brew install skhd
brew tap FelixKratz/formulae && brew install sketchybar
brew tap koekeishiya/formulae/yabai && brew install yabai

# 安装指定版本(如: v5.0.9 边框选项没有被移除,而且老版本系统才支持 spacebar)
git clone https://github.com/koekeishiya/homebrew-formulae
git reset --hard 8e96736353534532b72edfaa3b2290413b34c042
cd homebrew-formulae
brew install ./yabai.rb
brew install ./skhd.rb
brew install cmacrae/formulae/spacebar
```

## yabai - 平铺式窗口管理器

```sh
yabai --install-service  # 安装服务
yabai --start-service    # 启动服务
yabai --restart-service  # 重启服务
yabai --stop-service     # 停止服务
```

## skhd - 键盘监听服务

[skhd](https://github.com/koekeishiya/skhd) 是一个快捷键守护进程, 能够实时加载配置

```sh
skhd --install-service   # 安装服务
skhd --start-service     # 启动服务
skhd --restart-service   # 重启服务
skhd --stop-service      # 停止服务
```

## sketchybar - 状态栏显示服务

```sh
brew services start sketchybar    # 启动服务
brew services restart sketchybar  # 重启服务
brew services stop sketchybar     # 停止服务
```

## sapcebar

我之前用的是这个, 但可惜的是, 作者不再维护了, 导致最新版本的 MacOS 用不了, 所以弃用了
