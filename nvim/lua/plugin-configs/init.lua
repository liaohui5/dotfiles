------------------------------------------------------------------------
--         _                _                              __  _
--        | |              (_)                            / _|(_)
--  _ __  | | _   _   __ _  _  _ __     ___  ___   _ __  | |_  _   __ _
-- | '_ \ | || | | | / _` || || '_ \   / __|/ _ \ | '_ \ |  _|| | / _` |
-- | |_) || || |_| || (_| || || | | | | (__| (_) || | | || |  | || (_| |
-- | .__/ |_| \__,_| \__, ||_||_| |_|  \___|\___/ |_| |_||_|  |_| \__, |
-- | |                __/ |                                        __/ |
-- |_|               |___/                                        |___/
------------------------------------------------------------------------
-- 插件配置加载器: 加载所有的插件, 机器配置并启动, 不想要哪个
-- 插件的功能, 可以直接注释, 注意有些插件是直接自己启动的.
-- 需要在 plugins.lua 中注释, 并且执行 PackerClean 卸载掉
------------------------------------------------------------------------
local plugins = {
  { require_path = "nvim-web-devicons"       , config_name = "nvim-web-devicons" },
  { require_path = "monokai"                 , config_name = "monokai" },
  { require_path = "onedark"                 , config_name = "onedark" },
  { require_path = "which-key"               , config_name = "which-key" },
  { require_path = "align"                   , config_name = "align" },
  { require_path = "nvim-autopairs"          , config_name = "nvim-autopairs" },
  { require_path = "nvim-ts-autotag"         , config_name = "nvim-ts-autotag" },
  { require_path = "nvim-surround"           , config_name = "nvim-surround" },
  { require_path = "kommentary.config"       , config_name = "kommentary" },
  { require_path = "editorconfig"            , config_name = "editorconfig" },
  { require_path = "formatter"               , config_name = "formatter" },
  { require_path = "gitsigns"                , config_name = "gitsigns" },
  { require_path = "hop"                     , config_name = "hop" },
  { require_path = "lualine"                 , config_name = "lualine" },
  { require_path = "spectre"                 , config_name = "spectre" },
  -- { require_path = "nvim-tree"               , config_name = "nvim-tree" },
  { require_path = "indent_blankline"        , config_name = "indent_blankline" },
  { require_path = "bufferline"              , config_name = "bufferline" },
  -- { require_path = "bufferline"              , config_name = "barbar" },
  { require_path = "session_manager"         , config_name = "session_manager" },
  { require_path = "toggleterm"              , config_name = "toggleterm" },
  { require_path = "nvim-treesitter.configs" , config_name = "nvim-treesitter" },
  { require_path = "telescope"               , config_name = "telescope" },
  -- { require_path = nil                       , config_name = "rnvimr" },
  { require_path = nil                       , config_name = "vifm" },
  { require_path = nil                       , config_name = "vim-bookmarks" },
  -- { require_path = "auto-save"               , config_name = "auto-save" },
  -- { require_path = nil                       , config_name = "coc" },
}

for _, item in pairs(plugins) do
  local require_path = item["require_path"]
  local plugin_item = nil
  if require_path ~= nil then
    -- 如果 require_path 不是 nil, 就加载插件
    local status, plugin = pcall(require, require_path)
    if not status then
      vim.notify("[plugin]: " .. require_path .. " not found")
      return
    end
    plugin_item = plugin
  end

  -- 加载 config
  local config_name = "plugin-configs." .. item["config_name"]
  local status, config = pcall(require, config_name)
  if not status then
    vim.notify("[config]: " .. config_name .. " not found")
    return
  end

  -- config 配置模块必须实现 onstart 方法
  config.onstart(plugin_item)
end
