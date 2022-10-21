-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │          #    # #  ####  #    # #      #  ####  #    # #####  ####           │
-- │          #    # # #    # #    # #      # #    # #    #   #   #               │
-- │          ###### # #      ###### #      # #      ######   #    ####           │
-- │          #    # # #  ### #    # #      # #  ### #    #   #        #          │
-- │          #    # # #    # #    # #      # #    # #    #   #   #    #          │
-- │          #    # #  ####  #    # ###### #  ####  #    #   #    ####           │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  推荐阅读文档:                                                               │
-- │  https://yianwillis.github.io/vimcdoc/doc/syntax.html#:highlight             │
-- │  https://neovim.io/doc/user/api.html                                         │
-- │  https://github.com/RRethy/nvim-base16/blob/master/lua/base16-colorscheme.lua│
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local highlights = {}
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ which-key                                                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
highlights.WhichKeyFloat = {
  bg = "#383830" -- which-key 面板背景颜色
};

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ barbar                                                                       │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
highlights.BufferCurrentSign = {
  fg = "#66d9ef", -- 当前buffer左边|颜色
}
highlights.BufferCurrent = {
  fg = "#66d9ef", -- 当前buffer的文字颜色
}
highlights.BufferInactive = {
  fg = "#888888", -- 其他buffer的文字颜色
  bg = "#23241e", -- 其他buffer背景颜色(右)
}
highlights.BufferInactiveSign = {
  fg = "#888888",
  -- bg = "#23241e" -- 其他buffer背景颜色(左)
};
highlights.BufferTabpageFill = {
  fg = "#888888",
  bg = "#23241e",
}

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ nvim-tree                                                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
highlights.NvimTreeNormal = {
  bg = "#23241e" -- 背景颜色
};
highlights.NvimTreeVertSplit = {
  bg = "#23241e", -- 右边分割线背景
  fg = "#23241e" -- 右边分割线颜色
};

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ telescope                                                                    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
highlights.TelescopePromptTitle = {
  bg = "#414037",
  fg = "#f92672"
};
highlights.TelescopePreviewTitle = {
  fg = "#a6e22e"
};

--  ╭──────────────────────────────────────────────────────────────────────────────╮
--  │ todoComments                                                                 │
--  ╰──────────────────────────────────────────────────────────────────────────────╯
highlights.TodoBgTODO = {
  fg = "#f8f8f8",
  bg = "#10b981"
};
highlights.TodoSignTODO = {
  fg = "#10b981"
};

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ treesitter                                                                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local clearItalic = function()
  local itialicItems = {
    "Comment",
    "TSComment",
    "javaScriptComment",
    "LuaScriptComment"
  };
  for _, item in pairs(itialicItems) do
    vim.cmd(string.format("highlight %s gui=none", item))
  end
end

-- 必须要延迟执行, 不能立即执行, 立即执行有些高亮组不生效
local hlGroup = vim.api.nvim_create_augroup("override_highlights", { clear = true });
vim.api.nvim_create_autocmd("BufEnter", {
  group    = hlGroup,
  pattern  = "*",
  callback = function()
    clearItalic();
    for key, val in pairs(highlights) do
      vim.api.nvim_set_hl(0, key, val)
    end
  end
})
