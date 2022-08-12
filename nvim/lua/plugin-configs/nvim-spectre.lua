----------------------------------------------------
-- 增强neovim默认的搜索替换操作
-- docs: https://github.com/nvim-pack/nvim-spectre
----------------------------------------------------
return {
  onstart = function(spectre)
    spectre.setup({
      color_devicons     = true,
      open_cmd           = 'vnew', -- 'vnew' | 'split new',
      live_update        = false, -- auto excute search again when you write any file in vim
      line_sep_start     = '┌------------------------------------------------------------',
      result_padding     = '¦  ',
      line_sep           = '└------------------------------------------------------------',
      replace_vim_cmd    = "cdo",
      is_open_target_win = true, -- open file on opener window
      is_insert_mode     = false, -- start open panel on is_insert_mode
      highlight          = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete"
      },

      -- 绑定快捷键
      mapping = require("keybindings").spectreKeys(),
    })
  end
}
