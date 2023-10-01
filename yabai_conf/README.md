## yabai

[yabai](https://github.com/koekeishiya/yabai) 是一个 macos 平铺式窗口管理工具, 功能类似 linux 平台的 [dwm](https://github.com/LukeSmithxyz/dwm)
 在开始配置之前,建议先看[wiki](https://github.com/koekeishiya/yabai/wiki)

<span style="color: #ff0000">因为很多功能需要关闭SIP,所以请先关闭SIP</span>

#### 安装启动

```sh
brew install koekeishiya/formulae/yabai # 安装软件
yabai --install-service                 # 安装服务
yabai --start-service                   # 启动服务
yabai --restart-service                 # 重启服务
yabai --stop-service                    # 停止服务
```

## skhd

[skhd](https://github.com/koekeishiya/skhd) 是一个快捷键守护进程, 能够实时加载配置

#### 安装启动

```sh
brew install koekeishiya/formulae/skhd # 安装软件
skhd --install-service                 # 安装服务
skhd --start-service                   # 启动服务
skhd --restart-service                 # 重启服务
skhd --stop-service                    # 停止服务
```

## sketchybar

[sketchybar](https://github.com/felixkratz/sketchybar) 是替换 spacebar 的项目

```sh
brew install FelixKratz/formulae/sketchybar # 安装
brew services start sketchybar              # 启动服务
brew services restart sketchybar            # 重启服务
brew services stop sketchybar               # 停止服务
```

## spacebar(弃用)

<span style="color:#f00">因为作者不维护了, 导致高版本的 MacOS Snoma(v14.x) 无法使用了, 所以弃用</span>

[spacebar](https://github.com/cmacrae/spacebar)状态栏[配置](https://github.com/cmacrae/spacebar/blob/master/examples/spacebarrc)

#### 安装启动

```sh
brew install cmacrae/formulae/spacebar
brew services start spacebar
```
