-----------------------------------------------------------------------
-- session 管理插件
-- docs: https://github.com/Shatur/neovim-session-manager
-----------------------------------------------------------------------
return {
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",

    -- stylua: ignore
    opts = function(_, opts)
        local config = require("session_manager.config")
        local Path   = require("plenary.path")

        -- session 保存目录
        local sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions")

        -- 自动加载 session: Disabled(禁止) CurrentDir(当前目录) LastSession(上次session)
        local autoload_mode = config.AutoloadMode.Disabled
        return vim.tbl_extend("force", opts, {
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
        })
    end,

    config = function(_, session)
        local api, fn = vim.api, vim.fn
        local autocmd, augroup = api.nvim_create_autocmd, api.nvim_create_augroup
        autocmd("ExitPre", {
            group = augroup("auto_save_session_before_quit", { clear = true }),
            callback = function()
                local sessions = require("session_manager.utils").get_sessions()
                local curr_cwd = fn.getcwd()
                for _, item in ipairs(sessions) do
                    if item.dir.filename == curr_cwd then
                        session.save_current_session()
                        break
                    end
                end
            end,
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
