--------------------------------------------------------------
-- 启动一个 vite 静态服务器, 需要安装 vite
-- github: https://github.com/liaohui5/vite-server.nvim
--------------------------------------------------------------
return {
    {
        "liaohui5/vite-server.nvim",
        event = "VeryLazy",
        opts = {
            show_cmd = false,
            vite_cli_opts = {
                port = 8888,
            },
        },
        keys = {
            {
                "<leader>vq",
                "<cmd>lua require('vite-server').stop()<cr>",
                desc = "stop vite server",
            },
            {
                "<leader>vs",
                "<cmd>lua require('vite-server').start(vim.fn.getcwd())<cr>",
                desc = "start vite server project root directory",
            },
            {
                "<leader>vS",
                "<cmd>lua require('vite-server').start()<cr>",
                desc = "start server current directory",
            },
        },
        config = function()
            local vs = require("vite-server")
            local ok = pcall(require, "session_manager.config")
            if not ok then
                return
            end
            -- if neovim_session_manager.nvim is installed
            -- after session changed stop the vite server
            local autocmd, augroup = vim.api.nvim_create_autocmd, vim.api.nvim_create_augroup
            autocmd({ "User" }, {
                pattern = "SessionLoadPost",
                group = augroup("stop_vite_server", { clear = true }),
                callback = function()
                    if vs.is_started then
                        vs.stop()
                    end
                end,
            })
        end,
    },
    {
        -- add vite-server.nvim status to lualine
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            local function vite_server_status()
                local ok, vs = pcall(require, "vite-server")
                local status = ""
                if ok then
                    status = "󰡄"
                end

                if vs.is_started then
                    status = string.format("%s %s", status, vs.gen_url(vs.config.vite_cli_opts))
                end

                return status
            end
            table.insert(opts.sections.lualine_x, 1, vite_server_status)
        end,
    },
}
