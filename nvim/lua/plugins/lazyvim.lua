---------------------------------------------------------------------------------
-- 配置 LazyVim 内置的一些内容
-- LazyVim default contents, if need, can copy to keymaps and autocmds
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/autocmds.lua
-- https://github1s.com/LazyVim/LazyVim/blob/HEAD/lua/lazyvim/config/keymaps.lua#L43
---------------------------------------------------------------------------------
return {
    "LazyVim/LazyVim",
    opts = {
        autocmds = true, -- load lazyvim autocmds
        keymaps = true, --- load lazyvim keymaps
    },
}
