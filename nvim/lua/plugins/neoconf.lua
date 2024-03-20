-------------------------------------------------------------------
-- 用于配置全局和当前项目的设置
-- https://github.com/folke/neoconf.nvim
-------------------------------------------------------------------
return {
    "folke/neoconf.nvim",
    opts = {
        local_settings = ".neoconf.json",
        global_settings = "neoconf.json",
        import = {
            vscode = true, -- local .vscode/settings.json
            coc = false, -- global/local coc-settings.json
            nlsp = false, -- global/local nlsp-settings.nvim json settings
        },

        -- send new configuration to lsp clients when changing json settings
        live_reload = true,

        -- set the filetype to jsonc for settings files, so you can use comments
        -- make sure you have the jsonc treesitter parser installed!
        filetype_jsonc = true,

        plugins = {
            -- configures lsp clients with settings in the following order:
            -- - lua settings passed in lspconfig setup
            -- - global json settings
            -- - local json settings
            lspconfig = {
                enabled = true,
            },
            jsonls = {
                -- configures jsonls to get completion in .nvim.settings.json files
                -- only show completion in json settings for configured lsp servers
                enabled = true,
                configured_servers_only = true,
            },
            lua_ls = {
                -- configures lua_ls to get completion of lspconfig server settings
                -- by default, lua_ls annotations are only enabled in your neovim config directory
                -- explicitely enable adding annotations. Mostly relevant to put in your local .nvim.settings.json file
                enabled_for_neovim_config = true,
                enabled = false,
            },
        },
    },
}
