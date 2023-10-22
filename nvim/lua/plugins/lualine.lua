-----------------------------------------------------------------------
-- 底部状态栏
-- docs: https://github.com/nvim-lualine/lualine.nvim
-----------------------------------------------------------------------
-- stylua: ignore
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        -- nvim 运行的目录
        local function project_name()
            return table.remove(vim.fn.split(vim.fn.getcwd(), "/"))
        end

        -- vite-server.nvim status
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

        -- TanNine/Codeium: free ai helper status
        local function ai_helper_status()
          local icon = "󱍄";
          local util = require("lazyvim.util");
          local helpers_lualine_map = {
            {
              name = "tabnine",
              plugin = "cmp-tabnine",
              lualine = util.lualine.cmp_source("cmp_tabnine", icon)
            },
            {
              name = "codeium",
              plugin = "codeium.nvim",
              lualine = util.lualine.cmp_source("codeium", icon)
            },
          }

          for _, helper in ipairs(helpers_lualine_map) do
            if util.has(helper.plugin) then
              return helper.lualine
            end
          end

          -- not install ai helper
          return function ()
            return ""
          end
        end

        return vim.tbl_deep_extend("force", opts, {
            options = {
                globalstatus         = true,                            -- 使用全局的状态栏(false 每个窗口显示不同的状态栏)
                component_separators = { left = "", right = "" },       -- 右侧默认: { left = "", right = "" },
                section_separators   = { left = "", right = "" },     -- 左侧分割符
            },
            sections = {
                lualine_a = { { "mode", icon = "󰕷" } },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = { "diff", "diagnostics", "searchcount" },
                lualine_x = {
                    vite_server_status,
                    ai_helper_status(),
                    "filetype",
                    "encoding",
                    "fileformat",
                    "filesize",
                },
                lualine_y = { { "location", icon = "󰕟" } },
                lualine_z = { { project_name, icon = "" } },
            },
        })
    end,
}
