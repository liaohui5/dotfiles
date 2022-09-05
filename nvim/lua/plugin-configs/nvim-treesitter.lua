----------------------------------------------------
-- 侧边栏目录树
-- docs: https://github.com/nvim-treesitter/nvim-treesitter
----------------------------------------------------
local treesitterConfigs = loadModule("nvim-treesitter.configs", "plugin-configs")

local keys = require("keybindings").treesitterKeys()
treesitterConfigs.setup({
  sync_install = true,
  auto_install = true,
  ensure_installed = {
    "css",
    "dot",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "scss",
    "sql",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },

  keymaps = keys.keymaps,
  highlight = {
    -- 语法高亮
    enable                            = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    -- 允许使用 treesitter 来缩进
    enable = false
  },
  rainbow = {
    -- 不同括号不同颜色显示: https://github.com/p00f/nvim-ts-rainbow
    enable         = true,
    disable        = { "jsx" }, -- 对某些语言禁用该功能
    extended_mode  = true,
    max_file_lines = nil,
    -- colors         = {},
    -- termcolors     = {}
  },
  textsubjects = {
    -- 选中增强: https://github.com/RRethy/nvim-treesitter-textsubjects
    enable         = true,
    prev_selection = keys.textsubjects_prev_selection,
    keymaps        = keys.textsubjects_keymaps,
  },
  autotag = {
    -- xml标签自动闭合: https://github.com/windwp/nvim-ts-autotag
    enable = true
  },
  textobjects = {
    -- 众多功能集合体: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    swap = {
      -- 调换函数参数的位置
      enable = true,
      swap_next = {
        ["<leader>An"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>Ap"] = "@parameter.inner",
      },
    },
    move = {
      -- 快速移动
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]C"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[C"] = "@class.outer",
      },
    },
    lsp_interop = {
      -- LSP 交互
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>dF"] = "@function.outer",
        ["<leader>dC"] = "@class.outer",
      },
    },
  }
});


-- 自动允许 treeistter
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("my_treesitter_groups", { clear = true }),
  callback = function ()
    vim.cmd[[:TSEnable autotag]]
    vim.cmd[[:TSEnable textsubjects]]
    vim.cmd[[:TSEnable highlight]]
    vim.cmd[[:TSDisable indent]]
  end
})



