-------------------------------------------------------------------
-- 禁止一些内置的我不需要的插件
-- 所有的插件请看这里: https://www.lazyvim.org/configuration/plugins
-------------------------------------------------------------------
local function disable_plugins(list)
    local disabled_plugins = {}
    for _, plugin in ipairs(list) do
        table.insert(disabled_plugins, {
            plugin,
            enabled = false,
        })
    end
    return disabled_plugins
end

-- stylua: ignore start
return disable_plugins({
    "goolord/alpha-nvim",                      -- 启动页插件(老版本 LazyVIM 用的是这个)
    "catppuccin/nvim",                         -- 主题
    "echasnovski/mini.comment",                -- 注释插件(用习惯了 Comment.nvim, 不喜欢这个)
    "echasnovski/mini.surround",               -- 快速操作两边字符(操作不如 nvim-surround 方便)
    "echasnovski/mini.indentscope",            -- 缩进显示
    "SmiteshP/nvim-navic",                     -- 顶部代码导航
    "folke/persistence.nvim",                  -- session 管理插件(功能太少, 不如 neovim-session-manager)
    "folke/noice.nvim",                        -- UI 美化(实验性的功能插件,所以禁用)
    "rcarriga/nvim-notify",                    -- 优化通知消息 UI美化
    "zbirenbaum/copilot.lua",                  -- copilot AI 生成代码
    "zbirenbaum/copilot-cmp",                  -- copilot AI 生成代码
    "nvim-treesitter/nvim-treesitter-context", -- nvim-treesitter-context 显示当前光标所在位置上下文
    "ThePrimeagen/refactoring.nvim",           -- 代码重构工具, 并不常用
})
