-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  文件 git 状态显示                                                           │
-- │  docs: https://github.com/lewis6991/gitsigns.nvim                            │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local gitsigns = loadModule("gitsigns", "plugin-configs")

gitsigns.setup({
  signcolumn              = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
  attach_to_untracked     = true,
  current_line_blame      = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  sign_priority           = 6,
  update_debounce         = 100,
  max_file_length         = 40000, -- Disable if file is longer than this (in lines)
  signs                   = {
    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  watch_gitdir            = {
    interval     = 1000,
    follow_files = true
  },
  current_line_blame_opts = {
    virt_text         = true,
    virt_text_pos     = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay             = 1000,
    ignore_whitespace = false,
  },
  preview_config          = {
    border   = 'single',
    style    = 'minimal',
    relative = 'cursor',
    row      = 0,
    col      = 1
  },
  yadm                    = {
    enable = false
  },
  on_attach               = function()
    -- 绑定快捷键
    require("keybindings").gitsignsKeys();
  end
});
