-----------------------------------------------------------------------
-- session 管理插件
-- docs: https://github.com/Shatur/neovim-session-manager
-----------------------------------------------------------------------
return {
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = function()
        local config = require("session_manager.config")
        local Path = require("plenary.path")
        local sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions")

        -- session autoload mode: Disabled, CurrentDir, LastSession
        local autoload_mode = config.AutoloadMode.Disabled

        -- stylua: ignore
        return {
            sessions_dir = sessions_dir,
            autoload_mode = autoload_mode,
            path_replacer = "__",
            colon_replacer = "++",
            autosave_last_session = true,      -- 切换/退出之前自动保存当前 session 状态
            autosave_ignore_not_normal = true, -- 如果没有打开buffer或者所有buffer都是只读的就不保存session
            autosave_only_in_session = true,   -- 只有在 session 中, 自动保存 session
            max_path_length = 80,              -- 保存的 session 文件名最大长度
            autosave_ignore_filetypes = {
                ".DS_Store",
                "gitcommit",
            },
        }
    end,

    config = function(_, session)
        local save_session_before_exit_nvim = function()
            local sessions = require("session_manager.utils").get_sessions()
            local curr_cwd = vim.fn.getcwd()
            for _, item in ipairs(sessions) do
                if item.dir.filename == curr_cwd then
                    session.save_current_session()
                    break
                end
            end
        end

        -- register event handler
        vim.api.nvim_create_autocmd("ExitPre", {
            group = vim.api.nvim_create_augroup("save_session_before_exit_nvim", { clear = true }),
            callback = save_session_before_exit_nvim,
        })
    end,

    keys = {
        {
            "<leader>pr",
            "<cmd>SessionManager load_last_session<cr>",
            desc = "load last session",
        },
        {
            "<leader>pc",
            "<cmd>SessionManager load_current_dir_session<cr>",
            desc = "load current session",
        },

        {
            "<leader>pp",
            "<cmd>SessionManager load_session<cr>",
            desc = "pick session",
        },
        {
            "<leader>pd",
            "<cmd>SessionManager delete_session<cr>",
            desc = "delete sessions",
        },
        {
            "<leader>ps",
            "<cmd>SessionManager save_current_session<cr>",
            desc = "save sessions",
        },
    },
}
