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

return disable_plugins({
    -- all built-in plugins: https://www.lazyvim.org/plugins/coding
    "catppuccin/nvim",
    "echasnovski/mini.surround",
    "echasnovski/mini.comment",
    "echasnovski/mini.indentscope",
    "lukas-reineke/indent-blankline.nvim",
    "RRethy/vim-illuminate",
    "SmiteshP/nvim-navic",
    "rcarriga/nvim-notify",
    "folke/persistence.nvim",
    "folke/noice.nvim",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
})
