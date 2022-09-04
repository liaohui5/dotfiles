-----------------------------------------------------------
-- 书签管理
-- docs: https://github.com/folke/which-key.nvim
-----------------------------------------------------------
return {
  onstart = function(wk)
    wk.setup({
      ignore_missing     = false,
      hidden             = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<Plug>" },
      show_help          = true,
      triggers           = "auto", -- 所有键都显示提示
      -- 只有这些键可以触发 which-key, 修改这个设定会让一些插件的功能失效
      -- 比如: nvim-surround, 如果没有 y 提示, yss 就会失效
      -- triggers           = { "<leader>", "g", "d", "y" ,"s", "v", "\"", "'" },
      triggers_blacklist = {
        -- 不能触发的按键 i insert模式 v visual 模式
        i = { "j", "k" },
        v = { "j", "k" },
      },

      plugins = {
        marks     = true,                -- 查看所有标记用 ' 和 ` 触发
        registers = true,                -- 查看所有寄存器(registers) 用 " 触发
        spelling  = { enabled = false }, -- 单词检测
        presets   = {
          -- which-key 内置的按键提示
          operators    = true,
          motions      = true,
          text_objects = true,
          windows      = true,
          nav          = true,
          z            = true,
          g            = true,
        },
      },
      operators = { gc = "Comments" },
      key_labels = {
        -- 特殊按键显示的样式
        ["<space>"] = "<Space>",
        ["<cr>"]    = "<Enter>",
        ["<tab>"]   = "<Tab>",
      },
      icons = {
        breadcrumb = "»",
        separator  = "➜",
        group      = "+",
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- 如果按键太多, 向下滚动
        scroll_up   = '<c-u>', -- 如果按键太多, 向下滚动
      },
      window = {
        border   = "none",         -- none | single | double | shadow
        position = "bottom",       -- bottom | top
        margin   = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding  = { 3, 0, 3, 0 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
      },
      layout = {
        height  = { min = 4, max = 30 },
        width   = { min = 20, max = 50 },
        spacing = 4,
        align   = "center", -- left | center | right
      },
    });
  end
}
