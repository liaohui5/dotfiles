local M = {
    max_image_size = math.pow(1024, 2) * 2, -- 2M
    allow_file_types = {
        "jpg",
        "jpeg",
        "png",
        "gif",
    },
}

local function get_file_info(file_path)
    local size = vim.fn.getfsize(file_path)
    local ext = vim.fn.fnamemodify(file_path, ":e")
    return {
        size = size,
        ext = ext,
    }
end

local function can_preview(file_path)
    if not vim.fn.executable("wezterm") then
        return false
    end
    local info = get_file_info(file_path)
    if info.size > M.max_image_size then
        print("[image-preview]the maximum file size that can be previewed is 2m")
        return false
    end
    for _, item in ipairs(M.allow_file_types) do
        if item == info.ext then
            return true
        end
    end
    return false
end

M.preview_image_in_wezterm = function(file_path)
    if not can_preview(file_path) then
        return
    end
    local command = ""
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        -- for compatible windows
        command = string.format("silent !wezterm cli split-pane -- powershell wezterm imgcat '%s' ; pause", file_path)
    else
        command = string.format("silent !wezterm cli split-pane -- bash -c 'wezterm imgcat %s ; read'", file_path)
    end
    vim.api.nvim_command(command)
end

return M
