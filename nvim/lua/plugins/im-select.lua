--------------------------------------------------------------
-- 多文件搜索/替换,有 UI 界面
-- github : https://github.com/keaising/im-select.nvim
--------------------------------------------------------------

return {
    -- 自动切换输入法
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = {
        default_im_select = "com.apple.keylayout.ABC", -- MacOS 默认的英文输入法
        set_previous_events = {},                      -- 进入插入模式时, 是否自动恢复上一次输入法状态 0:恢复 1:禁用
    }
}
