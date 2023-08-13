-----------------------------------------------------
-- debug 相关插件
-- https://github.com/jay-babu/mason-nvim-dap.nvim
-----------------------------------------------------
return {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
    opts = {
        -- 支持的 adapter: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
        ensure_installed = {
            'node2',
            'chrome',
            'js'
        },
        handlers = {
            function(config)
                -- use default config to debug
                require('mason-nvim-dap').default_setup(config)
            end,
        }
    }
}
