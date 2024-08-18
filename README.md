## 介绍

各种命令行工具的配置文件, 每次换电脑都重新配置, 太麻烦了

所以我写了这个项目, 一键安装一些软件和常用配置

## 依赖

因为自动安装的脚本都是通过 `brew install *` 来执行的, 所以必须先安装 [homebrew](https://brew.sh/)

## 配置

1. 链接: 所有配置文件都是通过 [dotbot](https://github.com/anishathalye/dotbot) 来管理的, 建议先阅读文档
2. 软件: 所有依赖的软件安装都在 `install-dep.sh` 中, 可以自己注释不需要安装的软件
3. 配置: 所有的软件的配置都在 `install.conf.yaml` 中, 会创建软链接, 如果要修改配置文件名, 需要维护映射关系
4. node: 在 `install-dep` 中也会安装一些node的包, 默认是注释的, 因为需要先安装 `fnm` 然后安装 node, 然后在安装手动这些包
5. nvim: 这个是作为 git 的 submoudule 来管理的, 可以在 [单独配置代码库](https://github.com/liaohui5/nvim)中找到源码

## 安装

```sh
# 添加执行权限
chmod +x ./install

# 执行安装
./insall
```
