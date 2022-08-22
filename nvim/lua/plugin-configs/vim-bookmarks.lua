-----------------------------------------------------------
-- 书签管理
-- docs: https://github.com/MattesGroeger/vim-bookmarks
-----------------------------------------------------------
return {
  onstart = function()
    -- 不启用默认的快捷键
    vim.g.bookmark_sign = '';
    vim.g.bookmark_no_default_key_mappings = 1;
    require("keybindings").bookmarkKeys()
  end
}
