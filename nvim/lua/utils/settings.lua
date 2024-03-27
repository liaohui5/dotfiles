--------------------------------------------------------------
-- 自定义的一些设置, 方便配置插件
--------------------------------------------------------------
-- 是否支持 editorconfig 配置
vim.g.editorconfig = true

-- 禁止自动匹配高亮括号
vim.g.loaded_matchparen = false

-- 设置侧边栏文件目录树的宽度
vim.g.file_explorer_width = 38

-- 是否已经覆盖过高亮颜色
vim.g.override_highlight_executed = 0

-- 加载 snippets 目录
vim.g.snippets_save_dir = "./snippets"

-- 是否加载不太常用的插件
vim.g.load_unpopular_plugins = true

-- 默认是否开启自动完成(可以通过快捷键开启)
vim.g.enable_auto_completation = true

-- 禁用 provider, 注释表示开启, 查看状态 :checkheath provider
local disabled_providers = {
  -- "node",
  -- "python3",
  "perl",
  "ruby",
}
for _, provider in ipairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
