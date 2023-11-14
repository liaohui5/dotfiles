-----------------------------------------------------
-- 主题插件
-- https://github.com/RRethy/nvim-base16
-- https://github.com/folke/tokyonight.nvim
-- colorschemes: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
-----------------------------------------------------
return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },
    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = true,
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                style = "moon", -- allow values: night, storm, moon
                on_highlights = function(hl, c)
                    -- update telescope prompt background color
                    hl.TelescopeNormal.bg = c.bg
                    hl.TelescopeBorder.bg = c.bg

                    -- hidden neo-tree window separate line
                    hl.NeoTreeWinSeparator = {
                        bg = c.bg,
                        fg = c.bg,
                    }

                    -- remove keyworld font italic style
                    hl.Keyword.style.italic = false
                    hl["@keyword"].style.italic = false

                    -- remove comment font italic style
                    hl.Comment.style.italic = false
                end,
            })
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
