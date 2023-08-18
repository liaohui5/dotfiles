--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | |  ____  ____  | || |  _________   | || |   _____      | || |   ______     | || |  _________   | || |  _______     | || |    _______   | |
-- | | |_   ||   _| | || | |_   ___  |  | || |  |_   _|     | || |  |_   __ \   | || | |_   ___  |  | || | |_   __ \    | || |   /  ___  |  | |
-- | |   | |__| |   | || |   | |_  \_|  | || |    | |       | || |    | |__) |  | || |   | |_  \_|  | || |   | |__) |   | || |  |  (__ \_|  | |
-- | |   |  __  |   | || |   |  _|  _   | || |    | |   _   | || |    |  ___/   | || |   |  _|  _   | || |   |  __ /    | || |   '.___`-.   | |
-- | |  _| |  | |_  | || |  _| |___/ |  | || |   _| |__/ |  | || |   _| |_      | || |  _| |___/ |  | || |  _| |  \ \_  | || |  |`\____) |  | |
-- | | |____||____| | || | |_________|  | || |  |________|  | || |  |_____|     | || | |_________|  | || | |____| |___| | || |  |_______.'  | |
-- | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'

local M = {}

--- get nvim current mode string
---@return string
function M.get_mode()
    local modes = {
        ["n"] = "NORMAL",
        ["no"] = "OP",
        ["nov"] = "OP",
        ["noV"] = "OP",
        ["no"] = "OP",
        ["niI"] = "NORMAL",
        ["niR"] = "NORMAL",
        ["niV"] = "NORMAL",
        ["v"] = "VISUAL",
        ["V"] = "V-LINE",
        [""] = "V-BLOCK",
        ["s"] = "SELECT",
        ["S"] = "SELECT",
        [""] = "V-BLOCK",
        ["i"] = "INSERT",
        ["ic"] = "INSERT",
        ["ix"] = "INSERT",
        ["R"] = "REPLACE",
        ["Rc"] = "REPLACE",
        ["Rv"] = "V-REPLACE",
        ["Rx"] = "REPLACE",
        ["c"] = "COMMAND",
        ["cv"] = "COMMAND",
        ["ce"] = "COMMAND",
        ["r"] = "ENTER",
        ["rm"] = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        ["t"] = "TERMINAL",
        ["nt"] = "NORMAL",
        ["null"] = "NONE",
    }
    return modes[vim.api.nvim_get_mode().mode]
end

--- get Operate System name
--- @return string "Windows" | "MacOS" | "Linux"
---@diagnostic disable: need-check-nil
function M.get_os_name()
    local os_name = "unknown"

    -- 根据不同的操作系统执行不同的命令
    if package.config:sub(1, 1) == "\\" then
        -- Windows
        return "Windows"
    end

    local handle = io.popen("uname -s")
    local result = handle:read("*a")
    handle:close()

    if result:match("Darwin") then
        -- MacOS
        os_name = "MacOS"
    elseif result:match("Linux") then
        -- Linux
        os_name = "Linux"
    else
        -- unknown
        os_name = "unknown"
    end

    return os_name
end

return M
