--------------------------------------------------------------
-- 启动一个 vite 静态服务器, 需要安装 vite
-- github: https://github.com/liaohui5/vite-server.nvim
--------------------------------------------------------------
return {
    "liaohui5/vite-server.nvim",
    event = "VeryLazy",
    opts = {
        show_cmd = true,
        vite_cli_opts = {
            port = 9988,
            strictPort = true,
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
        -- 如果能安装了 neovim-session-manager 才执行: 切换 session 后, 停止运行 vite-server
        vim.api.nvim_create_autocmd({ "User" }, {
            pattern = "SessionLoadPost",
            group = vim.api.nvim_create_augroup("stop_vite_on_session_changed", {
                clear = true,
            }),
            callback = function()
                if vs.is_started then
                    vs.stop()
                end
            end,
        })
    end,
}
