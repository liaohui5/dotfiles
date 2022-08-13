---------------------------------------------------------------------
-- UI 美化(代码提示|代码诊断)
-- docs: https://github.com/glepnir/lspsaga.nvim
---------------------------------------------------------------------
return {
  onstart = function(lspsaga)
    local keys = require("keybindings").lspUISagaKeys()
    lspsaga.init_lsp_saga({
      move_in_saga              = keys.move_in_saga,
      finder_action_keys        = keys.finder_action_keys,
      code_action_keys          = keys.code_action_keys,
      rename_action_quit        = keys.rename_action_quit,
      rename_in_select          = true,
      border_style              = "single", -- "single" | "double" | "rounded" | "bold" | "plus"
      saga_winblend             = 1, -- 0-30
      max_preview_lines         = 10,
      code_action_num_shortcut  = true,
      code_action_icon          = "", -- 我不喜欢写代码的时候有这个💡, 如果需要把这个emoji放到""中
      definition_preview_icon   = " 👉 ",
      show_diagnostic_source    = true,
      diagnostic_source_bracket = {},
      diagnostic_header         = { "😡", "😥", "😤", "😐" },
      finder_icons              = {
        def  = "  ",
        ref  = "諭 ",
        link = "  ",
      },
      code_action_lightbulb     = {
        enable = true, -- 启用会让 html 文件报错, 没有 textDocument/codeAction is not suppouted
      },
      symbol_in_winbar          = {
        enable = false, -- 暂时无法启用, 坐等官方修复
      },
      server_filetype_map       = {
        enable = false, -- 不知道这个有什么用, 所以关闭
      },
      show_outline              = {
        win_position = "right",
        win_with     = "neotree", -- NvimTree | neotree | defx | db_ui
        win_width    = 30,
        auto_enter   = true,
        auto_preview = true,
        virt_text    = "┃",
        jump_key     = "o",
        auto_refresh = true,
      },
    })
  end
}
