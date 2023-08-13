## 介绍

各种命令行工具的配置文件, 每次换电脑都重新配置, 太麻烦了

所以我写了这个项目, 一键安装一些软件和常用配置

## 依赖

因为自动安装的脚本都是通过 `brew install *` 来执行的, 所以必须先安装 [homebrew](https://brew.sh/)

## 配置

1. 链接: 所有配置文件都是通过 [dotbot](https://github.com/anishathalye/dotbot) 来管理的, 建议先阅读文档
2. 软件: 所有依赖的配置都在 `install.conf.yaml` 中, 可以自己注释不需要的软件和配置

## 安装

```sh
# 添加执行权限
chmod +x ./install

# 执行安装
./insall
```
