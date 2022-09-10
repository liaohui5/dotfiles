-- ╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
-- │ 底部状态栏美化插件                                                                                             │
-- │ docs: https://github.com/glepnir/galaxyline.nvim                                                               │
-- │ components: https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/default_components.lua           │
-- ╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

local feline       = loadModule("feline", "plugin-config")
local sessionLib   = loadModule("auto-session-library", "plugin-config")
local felineUtils  = loadModule("feline.utils", "plugin-config")
local lazy_require = felineUtils.lazy_require;
local vi_mode      = lazy_require('feline.providers.vi_mode')

local colors = {
  bg = '#080808',
  fg = '#e5e5e5',
  section_bg = '#38393f',
  blue = '#61afef',
  green = '#98c379',
  purple = '#c678dd',
  orange = '#e5c07b',
  red = '#e06c75',
  yellow = '#e5c07b',
  darkgrey = '#2c323d',
  middlegrey = '#8791A5',
  gitred = '#d44e32',
}
local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'red',
  INSERT = 'blue',
  VISUAL = 'purple',
  LINES = 'purple',
  BLOCK = 'purple',
  REPLACE = 'red',
  ['V-REPLACE'] = 'purple',
  ENTER = 'blue',
  MORE = 'blue',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'blue',
  NONE = 'yellow',
}
local mode_alias = {
  ['n'] = 'NORMAL',
  ['no'] = 'OP',
  ['nov'] = 'OP',
  ['noV'] = 'OP',
  ['no'] = 'OP',
  ['niI'] = 'NORMAL',
  ['niR'] = 'NORMAL',
  ['niV'] = 'NORMAL',
  ['v'] = 'VISUAL',
  ['V'] = 'V-LINE',
  [''] = 'V-BLOCK',
  ['s'] = 'SELECT',
  ['S'] = 'SELECT',
  [''] = 'V-BLOCK',
  ['i'] = 'INSERT',
  ['ic'] = 'INSERT',
  ['ix'] = 'INSERT',
  ['R'] = 'REPLACE',
  ['Rc'] = 'REPLACE',
  ['Rv'] = 'V-REPLACE',
  ['Rx'] = 'REPLACE',
  ['c'] = 'COMMAND',
  ['cv'] = 'COMMAND',
  ['ce'] = 'COMMAND',
  ['r'] = 'ENTER',
  ['rm'] = 'MORE',
  ['r?'] = 'CONFIRM',
  ['!'] = 'SHELL',
  ['t'] = 'TERMINAL',
  ['nt'] = 'NORMAL',
  ['null'] = 'NONE',
}

-- -----------------------------------------------------------------------------
-- 总体的 components & 工具函数
-- -----------------------------------------------------------------------------
local components = {
  active = { {}, {} }, -- statusline sections left & right
  inactive = { {} },
}

-- -----------------------------------------------------------------------------
-- VIM 模式信息提示(左)
-- -----------------------------------------------------------------------------
local function mode()
  return mode_alias[vim.api.nvim_get_mode().mode]
end

table.insert(components.active[1], {
  provider = function()
    return string.format(' %s ', mode())
  end,
  short_provider = function()
    return string.format(' %s ', mode():sub(1, 1))
  end,
  hl = function()
    return {
      fg = 'bg',
      bg = vi_mode.get_mode_color(),
      style = 'bold',
    }
  end,
  icon = ' ',
  right_sep = 'slant_right',
})

-- -----------------------------------------------------------------------------
-- session
-- 如果执行命令有参数(如: nvim a.txt)就不显示, 没有参数(如: nvim)就显示session名
-- -----------------------------------------------------------------------------
local hasCmdArgs = vim.v.argv[2];
if (not hasCmdArgs) then
  table.insert(components.active[1], {
    provider = function ()
      local session_name = sessionLib.current_session_name()
      return string.format(" %s", session_name)
    end,
    icon = "",
    hl = {
      fg = 'white',
      bg = 'oceanblue'
    },
    left_sep = {
      'slant_left_2',
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'oceanblue',
        },
      },
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'oceanblue',
        },
      },
      'slant_right',
    },
  });
end


-- -----------------------------------------------------------------------------
-- git 信息提示(左)
-- -----------------------------------------------------------------------------
table.insert(components.active[1], {
  provider = 'git_branch',
  icon = '  ',
  hl = {
    fg = 'fg',
    bg = 'gitred',
  },
  left_sep = {
    {
      hl = {
        fg = 'fg',
        bg = 'gitred',
      },
    },
    'slant_left_2',
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'fg',
        bg = 'gitred',
      },
    },
    'slant_right',
  },
})

table.insert(components.active[1], {
  provider  = 'git_diff_added',
  icon      = '+',
  hl        = {
    fg = 'green',
    bg = 'bg',
  },
  left_sep  = ' ',
  right_sep = ' ',
})
table.insert(components.active[1], {
  provider  = 'git_diff_changed',
  icon      = '~',
  hl        = {
    fg = 'orange',
    bg = 'bg',
  },
  left_sep  = ' ',
  right_sep = ' ',
})
table.insert(components.active[1], {
  provider = 'git_diff_removed',
  icon     = '-',
  hl       = {
    fg = 'red',
    bg = 'bg',
  },
})

-- -----------------------------------------------------------------------------
-- 代码诊断计数(左)
-- -----------------------------------------------------------------------------
local function get_diagnostic_count(severity)
  local count = #vim.diagnostic.get(0, { severity = severity })
  return count ~= 0 and count .. ' ' or ''
end

table.insert(components.active[1], {
  provider = function()
    return get_diagnostic_count(vim.diagnostic.severity.ERROR)
  end,
  icon = '  ',
  hl = {
    fg = 'red',
    bg = 'bg',
  },
})
table.insert(components.active[1], {
  provider = function()
    return get_diagnostic_count(vim.diagnostic.severity.WARN)
  end,
  icon = '  ',
  hl = {
    fg = 'orange',
    bg = 'bg',
  },
})

table.insert(components.active[1], {
  provider = function()
    return get_diagnostic_count(vim.diagnostic.severity.INFO)
  end,
  icon = '  ',
  hl = {
    fg = 'blue',
    bg = 'bg',
  },
})

-- -----------------------------------------------------------------------------
-- 文件图标/文件名(右)
-- -----------------------------------------------------------------------------
table.insert(components.active[2], {
  provider = 'file_info',
  right_sep = {
    ' ',
    {
      str = 'vertical_bar_thin',
      hl = { fg = 'fg' },
    },
  },
});


-- -----------------------------------------------------------------------------
-- 光标在当前文件的位置&百分比(右)
-- -----------------------------------------------------------------------------
table.insert(components.active[2], {
  provider = 'position',
  right_sep = ' ',
  left_sep = ' ',
});
table.insert(components.active[2], {
  provider = 'line_percentage',
  right_sep = {
    ' ',
    {
      str = 'vertical_bar_thin',
      hl = { fg = 'fg' },
    },
  },
});

-- -----------------------------------------------------------------------------
-- 文件大小(右)
-- -----------------------------------------------------------------------------
table.insert(components.active[2], {
  provider = 'file_size',
  right_sep = ' ',
  left_sep = ' '
});

feline.setup({
  theme = colors,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = {
    filetypes = {
      '^packer$',
      'NvimTree',
      '^qf$',
      '^help$',
      'Outline',
      'Trouble',
      'dap-repl',
      '^dapui',
    },
    buftypes = {},
    bufnames = {},
  },
})
