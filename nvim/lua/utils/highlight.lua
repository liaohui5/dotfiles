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

local function is_highlight_group_defined(group)
    local hl_group = vim.fn.synIDtrans(vim.fn.hlID(group))
    return hl_group ~= 0
end

-- 覆盖一些插件的默认高亮色彩, 只会执行一次
return function()
    if vim.g.override_highlight_executed == 1 then
        return
    end

    local overrides = {}
    vim.g.override_highlight_executed = 1

    ----- barbar:https://github.com/romgrk/barbar.nvim
    -- overrides.BufferCurrentSign = {
    --     link = "TSFunction", -- 当前buffer左边的分割线
    -- }
    -- overrides.BufferCurrent = {
    --     link = "TSFunction", -- 当前buffer文字标题
    -- }
    -- overrides.BufferInactive = {
    --     fg = "#888888", -- 其他buffer的文字颜色
    --     bg = "#23241e", -- 其他buffer背景颜色(右)
    -- }
    -- overrides.BufferInactiveSign = {
    --     fg = "#888888",
    --     bg = "#23241e", -- 其他buffer背景颜色(左)
    -- }
    -- overrides.BufferTabpageFill = {
    --     fg = "#888888",
    --     bg = "#23241e",
    -- }

    ---- BufferLine: https://github.com/akinsho/bufferline.nvim
    -- overrides.BufferLineBufferSelected = {
    --     link = "TSFunction",
    -- }
    -- overrides.BufferLineOffsetSeparator = {
    --     bg = "#151612",
    --     fg = "#151612",
    -- }

    ----- nvim-tree: https://github.com/nvim-tree/nvim-tree.lua
    -- overrides.NvimTreeNormal = {
    --     bg = "#23241e",                -- 背景颜色
    -- }
    -- overrides.NvimTreeWinSeparator = { -- 隐藏窗口分割线
    --     bg = "#23241e",
    --     fg = "#23241e",
    -- }
    -- overrides.NeoTreeNormal = {
    --     bg = "#23241e",
    -- }
    -- overrides.NeoTreeNormalNC = {
    --     bg = "#23241e",
    -- }
    overrides.NeoTreeWinSeparator = { -- 隐藏窗口分割线
        -- bg = "#272822",
        -- fg = "#272822",
        fg = "#1a1b26",
        bg = "#1a1b26",
    }

    ----- telescope: https://github.com/nvim-telescope/telescope.nvim
    -- overrides.TelescopePromptTitle = {
    --     bg = "#414037",
    --     fg = "#f92672",
    -- }
    -- overrides.TelescopePreviewTitle = {
    --     fg = "#a6e22e",
    -- }
    -- overrides.TelescopePromptPrefix = {
    --     bg = "NONE",
    --     fg = "#ae81ff",
    -- }

    ----- leap: https://github.com/ggandor/leap.nvim
    -- overrides.LeapBackdrop = {
    --     link = "Comment",
    -- }
    -- overrides.LeapMatch = {
    --     link = "TSFunction",
    -- }

    ----- lspsaga: https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/highlight.lua
    -- overrides.SagaNormal = {
    --     bg = "#23241e",
    -- }
    -- overrides.SagaBorder = {
    --     bg = "#23241e",
    --     fg = "#66d9ef",
    -- }

    ----- noice: https://github.com/folke/noice.nvim
    -- overrides.NoiceCmdlinePopupBorder = {
    --     link = "TSFunction",
    -- }

    ----- cmp: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu
    -- overrides.CmpItemAbbr = {
    --     bg = "NONE",
    --     fg = "#d8d8d2",
    -- }

    -- html标签
    -- overrides.HtmlValue = {
    --     fg = "#f4bf75",
    -- }
    -- overrides.htmlString = {
    --     fg = "#f4bf75",
    -- }
    -- overrides.HtmlSpecialTagName = {
    --     fg = "#66d9ef",
    -- }
    -- overrides.TsTagDelimiter = {
    --     fg = "#f5f4f1",
    --     bg = "NONE",
    -- }
    -- overrides.TSTag = {
    --     fg = "#f92672",
    -- }
    -- overrides.TsAttribute = {
    --     fg = "#a6e22e",
    -- }

    -- 浮动窗口边框颜色
    -- overrides.FloatBorder = {
    --     bg = "none",
    --     fg = "#656866",
    -- }

    -- 选中背景
    -- overrides.Visual = {
    --     bg = "#49483e",
    -- }

    -- 空白字符
    -- overrides.NonText = {
    --     fg = "#656866",
    -- }

    -- 代码诊断
    -- overrides.DiagnosticInfo = {
    --     link = "TSComment",
    -- }

    -- indent_blankline 空白字符
    -- overrides.IndentBlanklineSpaceCharBlankline = {
    --     fg = "#888888",
    -- }
    -- overrides.IndentBlanklineSpaceChar = {
    --     fg = "#888888",
    -- }
    ---- 窗口分割线
    -- overrides.VertSplit = {
    --     link = "TSComment",
    -- }

    ----- 语法相关, 取消字体倾斜
    local clear_default_groups = {
        "TSComment",
        "Comment",
    }
    for _, group in ipairs(clear_default_groups) do
        vim.cmd(string.format("hi %s gui=none", group))
    end

    for key, val in pairs(overrides) do
        if is_highlight_group_defined(key) then
            vim.api.nvim_set_hl(0, key, val)
        end
    end
end
