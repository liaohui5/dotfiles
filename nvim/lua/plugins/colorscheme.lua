-----------------------------------------------------
-- 主题插件
-- https://github.com/RRethy/nvim-base16
-- https://github.com/folke/tokyonight.nvim
-- colorschemes: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
-----------------------------------------------------
return {
    {
        -- 让 LazyVim 加载 base16
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },
    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = true,
        opts = function()
            local opts = {
                style = "night",
            }
            -- 隐藏窗口分割线
            local colors = {
                night = {
                    bg = "#1a1b26",
                    fg = "#1a1b26",
                },
                moon = {
                    fg = "#222436",
                    bg = "#222436",
                },
                storm = {
                    fg = "#24283b",
                    bg = "#24283b",
                },
            }

            vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", colors[opts.style])

            return opts
        end,
    },
    -- {
    --     "RRethy/nvim-base16",
    --     enabled = false,
    --     lazy = true,
    --     opts = {
    --         -- monokai: https://github.com/RRethy/nvim-base16/blob/master/lua/colors/monokai.lua
    --         base00 = "#272822",
    --         base01 = "#383830",
    --         base02 = "#49483e",
    --         base03 = "#656866",
    --         base04 = "#a59f85",
    --         base05 = "#f8f8f2",
    --         base06 = "#f5f4f1",
    --         base07 = "#f9f8f5",
    --         base08 = "#f92672",
    --         base09 = "#fd971f",
    --         base0A = "#f4bf75",
    --         base0B = "#a6e22e",
    --         base0C = "#a1efe4",
    --         base0D = "#66d9ef",
    --         base0E = "#ae81ff",
    --         base0F = "#cc6633",
    --     },
    -- },
}
