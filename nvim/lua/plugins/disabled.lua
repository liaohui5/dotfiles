-------------------------------------------------------------------
-- 禁止一些内置的我不需要的插件
-- 所有的插件请看这里: https://www.lazyvim.org/configuration/plugins
-------------------------------------------------------------------
local function disable_plugins(list)
    local disabled_plugins = {};
    for _, plugin in ipairs(list) do
        table.insert(disabled_plugins, {
            plugin,
            enabled = false
        });
    end
    return disabled_plugins;
end

return disable_plugins({
    -- "folke/neoconf.nvim",
    -- "folke/neodev.nvim",
    -- all built-in plugins: https://www.lazyvim.org/plugins/coding
    "echasnovski/mini.surround",
    "echasnovski/mini.comment",
    "folke/trouble.nvim",
    "RRethy/vim-illuminate",
    -- "folke/tokyonight.nvim",                       -- use base16-monokai colorscheme
    "catppuccin/nvim",
    "nvim-treesitter/nvim-treesitter-textobjects", -- use flash.nvim
    "rcarriga/nvim-notify",
    "lukas-reineke/indent-blankline.nvim",
    "echasnovski/mini.indentscope",
    "folke/noice.nvim",
    "SmiteshP/nvim-navic",
    "folke/persistence.nvim",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
});
