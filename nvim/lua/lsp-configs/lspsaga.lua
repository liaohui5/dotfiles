-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  UI 美化(代码提示|代码诊断)                                                  │
-- │  docs: https://github.com/glepnir/lspsaga.nvim                               │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local lspsaga = loadModule("lspsaga", "lsp");

return {
  onstart = function()
    local keys = require("keybindings").lspsagaKeys()
    lspsaga.init_lsp_saga({
      move_in_saga              = keys.move_in_saga,
      finder_action_keys        = keys.finder_action_keys,
      code_action_keys          = keys.code_action_keys,
      rename_action_quit        = keys.rename_action_quit,
      rename_in_select          = true,
      max_preview_lines         = 15,
      code_action_num_shortcut  = true,
      code_action_icon          = "", -- 我不喜欢写代码的时候有这个💡, 如果需要把这个符号放到""中
      definition_preview_icon   = "➜ ",
      -- diagnostic_header         = { "😡", "😥", "😤", "😐" },
      diagnostic_header         = { ' ', ' ', ' ', ' ' },
      finder_icons              = { def  = " ", ref  = " ", link = " " },
      code_action_lightbulb     = {
        enable            = false,
        cache_code_action = false,
      },
      symbol_in_winbar          = {
        enable = false, -- 暂时无法启用, 需要 neovim v0.8+
      },
      server_filetype_map       = {
        enable = false, -- 不知道这个有什么用, 所以关闭
      },
      show_outline              = {
        win_position = "right",
        win_with     = "NvimTree", -- NvimTree | neotree | defx | db_ui
        win_width    = 35,
        auto_enter   = true,
        auto_preview = true,
        virt_text    = "┃",
        jump_key     = keys.outline_enter_key,
        auto_refresh = true,
      },
    })
  end
}
