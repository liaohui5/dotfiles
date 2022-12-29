--[[
-----------------------------------------------------
-- 快速移动光标位置, 类似 vim-sneak
-- docs: https://github.com/ggandor/leap.nvim
-- 替代插件: https://github.com/phaazon/hop.nvim
-----------------------------------------------------
-- 快速移动光标位置插件 leap.nvim 的 f/t 增强插件
-- docs: https://github.com/ggandor/flit.nvim
-----------------------------------------------------
设计理念: 跳到任意位置最多只要按4-5个按键
使用公式: (搜索)
  1. s(启动键)
  2. 要搜索的字符(2个)
  3. label(标记位置:有多个匹配的结果才会出现到 label)

使用公式: (选中)
  1. vs/Vs(启动键)
  2. 要搜索的字符(2个)
  3. label(标记位置:有多个匹配的结果才会出现到 label)

使用公式: (删除)
  1. dx/dX(启动键)
  2. 要搜索的字符(2个)
  3. label(标记位置:有多个匹配的结果才会出现到 label)
-----------------------------------------------------
注意事项:
1. 匹配分组:
  如果是匹配结果特别多,超过了最大的labels(52个),
  他就会分组显示, 空格切换至下一个分组, tab切换到上一个tab

2. 多窗口启动: gs为启动键(global search)

3. 可以配合其他 Operator(dyc) 来使用
--]]
local leap = loadModule("leap", "plugin-configs");
local api = vim.api;

-- 启动leap: 设定搜索的窗口为当前窗口
leap.leap({
  target_windows = {
    vim.fn.win_getid(),
  }
});

-- 设置搜索时的主题高亮
api.nvim_set_hl(0, "LeapBackdrop", {
  link = "Comment",
});
api.nvim_set_hl(0, "LeapMatch", {
  fg = "white",
  bold = false,
  nocombine = true,
});
leap.opts.highlight_unlabeled_phase_one_targets = true;

-- 加载默认的按键
leap.add_default_mappings();
