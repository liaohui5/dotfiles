-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  底部状态栏美化插件                                                          │
-- │  docs: https://github.com/nvim-lualine/lualine.nvim                          │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local lualine = loadModule("lualine", "plugin-configs")

lualine.setup({
  options           = {
    icons_enabled        = true,
    theme                = 'auto',
    always_divide_middle = true,
    globalstatus         = false,
    -- component_separators = { left = '', right = '' },
    -- section_separators   = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    section_separators   = { left = '', right = '' },
    disabled_filetypes   = {
      statusline = {
        -- 在 dapui 中禁用
        'dapui_scope',
        'dapui_breakpoints',
        'dapui_stacks',
        'dapui_watchers',
        'dapui_repl',
        'dapui_console',
      },
      winbar     = {},
    },
    refresh              = {
      statusline = 1000,
      tabline    = 1000,
      winbar     = 1000,
    }
  },
  sections          = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline           = {},
  winbar            = {},
  inactive_winbar   = {},
  extensions        = {}
});
