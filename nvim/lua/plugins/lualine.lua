-----------------------------------------------------------------------
-- 底部状态栏
-- docs: https://github.com/nvim-lualine/lualine.nvim
-----------------------------------------------------------------------
-- nvim 运行的目录
local function project_name()
    local root_dir = table.remove(vim.fn.split(vim.fn.getcwd(), "/"))
    if root_dir ~= nil then
        return string.format(" %s", root_dir)
    else
        return ""
    end
end

-- vite-server.nvim 状态
local function vite_server_status()
    local ok, vs = pcall(require, "vite-server")
    local status = ""
    if ok then
        status = "󰡄"
    end

    if vs.is_started then
        status = status .. " " .. vs.gen_url(vs.config.vite_cli_opts)
    end

    return status
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            globalstatus = true, -- 使用全局的状态栏(false 每个窗口显示不同的状态栏)
            component_separators = { left = "", right = "" }, -- { left = "", right = "" },
            section_separators = { left = "", right = "" },
            refresh = {
                -- 刷新频率 1000ms
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { { "mode", icon = "" } },
            lualine_b = { { "branch", icon = "" } },
            lualine_c = { "diff", "diagnostics", "searchcount" },
            lualine_x = { vite_server_status, "filetype", "encoding", "fileformat", "filesize" },
            lualine_y = { "location" },
            lualine_z = { project_name },
        },
    },
}
