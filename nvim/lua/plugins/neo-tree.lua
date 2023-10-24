-----------------------------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/nvim-neo-tree/neo-tree.nvim
-----------------------------------------------------------------------
return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    keys = function()
        return {
            {
                "<c-e>",
                "<cmd>Neotree toggle<cr>",
                desc = "Toggle file explorer",
            },
        }
    end,
    opts = function(_, opts)
        -- custom commands
        local commands = {
            copy_filename = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    vim.fn.setreg("+", node.name)
                end,
            },
            copy_filepath = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    vim.fn.setreg("+", node:get_id())
                end,
            },
            preview_image_in_wezterm = {
                nowait = true,
                command = function(state)
                    local node = state.tree:get_node()
                    if not node.type == "file" then
                        return
                    end
                    require("utils.image-preview").preview_image_in_wezterm(node.path)
                end,
            },
        }

        local keys = {
            -- :h neo-tree-mappings
            top_window = {
                ["<space>"] = "toggle_node",
                ["o"] = "open",
                ["<enter>"] = "open",
                ["<esc>"] = "revert_preview",
                ["P"] = { "toggle_preview", config = { use_float = true } },
                ["l"] = "focus_preview",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                ["Z"] = "close_node",
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
                ["<s-tab>"] = "prev_source",
                ["<tab>"] = "next_source",
            },
            filesystem_window = {
                ["/"] = "fuzzy_finder", -- filter_on_submit
                ["<c-x>"] = "clear_filter",
                ["<c-k>"] = "prev_git_modified",
                ["<c-j>"] = "next_git_modified",
                ["."] = "set_root",
                ["<bs>"] = "navigate_up",
                ["a"] = "add",
                ["A"] = "add_directory",
                ["x"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["d"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["m"] = "move",
                ["i"] = commands.preview_image_in_wezterm,
                ["Y"] = commands.copy_filename,
                ["<C-y>"] = commands.copy_filepath,
            },
            filesystem_fuzzy_finder = {
                ["<c-j>"] = "move_cursor_down",
                ["<c-k>"] = "move_cursor_up",
            },
            buffers_window = {
                ["bd"] = "buffer_delete",
                -- ["<bs>"] = "navigate_up",
            },
            git_status_window = {
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gA"] = "git_add_all",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
            },
        }

        -- 事件处理
        local event_handlers = {
            {
                event = "file_added",
                handler = function(filepath)
                    -- 创建文件后立即编辑
                    if vim.fn.filereadable(filepath) == 1 then
                        vim.cmd("silent edit " .. filepath)
                    end
                end,
            },
            {
                event = "file_deleted",
                handler = function(filepath)
                    -- 遍历所有缓冲区 ID,并获取缓冲区的绝对路径,然后对比
                    local bufids = vim.api.nvim_list_bufs()
                    for _, id in ipairs(bufids) do
                        local buf_path = vim.fn.expand(vim.api.nvim_buf_get_name(id))
                        if buf_path == filepath then
                            vim.cmd("silent bd " .. id)
                        end
                    end
                end,
            },
        }

        -- 监听打开/关闭事件设置barbar侧边距
        local status, barApi = pcall(require, "barbar.api")
        if status then
            table.insert(event_handlers, {
                event = "neo_tree_window_before_open",
                handler = function()
                    barApi.set_offset(vim.g.file_explorer_width, string.rep(" ", 15) .. "Explorer")
                end,
            })
            table.insert(event_handlers, {
                event = "neo_tree_window_before_close",
                handler = function()
                    barApi.set_offset(0)
                end,
            })
        end

        return vim.tbl_deep_extend("force", opts, {
            close_if_last_window = true,
            popup_border_style = "single",
            hide_root_node = true,
            use_default_mappings = false,
            event_handlers = event_handlers,
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
                winbar = true,
            },
            default_component_configs = {
                indent = {
                    with_expanders = false,
                    indent_size = 2,
                    padding = 1,
                    with_markers = true,
                },
            },
            window = {
                position = "left",
                width = vim.g.file_explorer_width,
                mappings = keys.top_window,
            },
            filesystem = {
                bind_to_cwd = true,
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    hide_gitignored = true,
                    hide_hidden = true,
                    hide_dotfiles = false,
                    hide_by_name = {
                        ".DS_Store",
                    },
                    never_show = {
                        ".DS_Store",
                    },
                },
                window = {
                    mappings = keys.filesystem_window,
                    fuzzy_finder_mappings = keys.filesystem_fuzzy_finder,
                },
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
                group_empty_dirs = false,
                show_unloaded = true,
                window = {
                    mappings = keys.buffers_window,
                },
            },
            git_status = {
                window = {
                    mappings = keys.git_status_window,
                },
            },
        })
    end,
}
