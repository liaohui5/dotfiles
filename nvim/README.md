## 说明

这是我自己用的neovim配置文件的仓库, 98% 用的是 lua 来配置的, 有中文注释, 欢迎 star & clone

![preview1](https://raw.githubusercontent.com/liaohui5/images/main/images/202207302146771.png)
![preview2](https://raw.githubusercontent.com/liaohui5/images/main/images/202207302150278.png)
![preview3](https://raw.githubusercontent.com/liaohui5/images/main/images/202207302141117.png)
![preview4](https://raw.githubusercontent.com/liaohui5/images/main/images/202208022148874.png)
![preview5](https://raw.githubusercontent.com/liaohui5/images/main/images/202208022150885.png)

## 关于代码提示和补全

我之前用的是 [coc.nvim](https://github.com/neoclide/coc.nvim), 但是后来发现, coc.nvim 缺点也很多,
比如无法使用 lsp 提供的一些补全, 只能自定义 snippets, 或者安装别人写好的 snippets

## 安装

### 安装 neovim

```bash
brew install neovim
```

### 安装配置文件

```bash
git clone https://github.com/liaohui5/nvim  ~/.config/nvim
# 注: 直接打开可能报错 xxx not found , 请按照以下步骤操作:
# 1. 安装插件 PackerInstall, 建议开梯子, 否则特别慢(可能会有失败的)
# 2. 退出(:qa!)重启, 此时会自动安装 lsp 和 dap 
# 3. 等待安装完成
```

### 安装 [packer.nvim](https://github.com/wbthomason/packer.nvim)

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 安装插件(建议开梯子)

```bash
:PackerInstall
```

## 说明

- 总入口文件: `init.lua`
- 自动执行脚本: `lua/autocmd.lua`
- 编辑器选项: `lua/options.lua`
- 快捷键映射配置: `lua/mappings.lua`
- 插件快捷键配置: `lua/keybindings.lua`
- 插件加载配置入口: `lua/plugin-configs/index.lua`
- LSP 代码提示/自动补全/lint/quickfix/code action 的入口文件在:  `lua/lsp-configs/index.lua`

## 重要提示

由于LSP相关的插件并不稳定, 有时候一更新可能就报错了, 如果想要稳定, 可以使用 [coc.nvim](https://github.com/neoclide/coc.nvim)

在 `lua/plugins.lua` 和 `lua/index.lua` 文件中, 有 Coc 相关的配置, 只要打开注释就好了, 可以自己选择使用 LSP 还是 Coc.nvim

## 需要额外下载命令的一些插件

> utils/im-select.lua: 自动切换输入法

这个需要下载 [im-select](https://github.com/daipeihust/im-select)

> lua/plugins-configs/formatter: 代码格式化插件

+ 格式化 lua 文件, 需要下载: `stylua`
+ 格式 js/jsx/ts/tsx/html/json 需要安装: `prettier`

> lua/plugin-configs/spectre: 搜索替换可视化增强插件

可能需要下载 [ripgre](https://github.com/BurntSushi/ripgrep) 和 [sed](https://www.gnu.org/software/sed/) 两个命令

> 其他

如果上面还有写没有提到的, 导致运行出了问题, 可以自己找到相关的文件, 查看对应的网站的文档

我的所有的配置文件中, 都有插件 github 的地址

## 最后

如果你喜欢这个仓库, 或者喜欢我的配置, 欢迎 start & clone

