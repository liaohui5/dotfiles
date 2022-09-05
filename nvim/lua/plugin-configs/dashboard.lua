-----------------------------------------------------------
-- 启动页
-- docs: https://github.com/glepnir/dashboard-nvim
-- wiki: https://github.com/glepnir/dashboard-nvim/wiki/Ascii-Header-Text
-- preview: https://github.com/glepnir/dashboard-nvim/wiki/Header-Preview
-----------------------------------------------------------
local dashboard = loadModule("dashboard", "plugin-config")

local home = os.getenv('HOME');
-- dashboard.disable_at_vimenter = 0
dashboard.disable_statusline  = 1
dashboard.session_directory   = home .. '/.cache/nvim/session';

dashboard.custom_header = {
  '',
  '',
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  '',
  '',
  '',
  '',
}

dashboard.custom_center = {
  {
    icon = '  ',
    desc = 'Load rurrent directory session           ',
    action = '',
    shortcut = 'SPC RET',
  },
  {
    icon = '  ',
    desc = 'Recently latest sessions                 ',
    action = '',
    shortcut = 'SPC p r',
  },
  {
    icon = '  ',
    desc = 'Session list                             ',
    action = '',
    shortcut = 'SPC p p',
  },
  {
    icon = '  ',
    desc = 'Find  word                               ',
    action = '',
    shortcut = 'SPC s p'
  },
  {
    icon = '  ',
    desc = 'Find  File                               ',
    action = '',
    shortcut = '<C-p>  '
  },
  {
    icon = '  ',
    desc ='File Explorer                            ',
    action =  '',
    shortcut = '<C-t>  '
  },
  {
    icon = '  ',
    desc ='Command Line                             ',
    action =  '',
    shortcut = '<C-x>   '
  },
  {
    icon = '  ',
    desc ='Which Keys                               ',
    action =  '',
    shortcut = 'SPC    '
  },
}
