--------------------------------------------------------------
-- 自动切换输入法
-- github : https://github.com/keaising/im-select.nvim
--------------------------------------------------------------

return {
    "keaising/im-select.nvim",
    event = "VeryLazy",
    opts = {
        -- MacOS 默认的英文输入法
        default_im_select = "com.apple.keylayout.ABC",

        -- 自动恢复上一次输入法状态事件(如:InsertEnter)
        set_previous_events = { "InsertEnter" },
    },
}
