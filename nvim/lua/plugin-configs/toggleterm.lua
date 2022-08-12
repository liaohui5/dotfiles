-----------------------------------------------------------
-- 切换命令行
-- docs: https://github.com/akinsho/toggleterm.nvim
-----------------------------------------------------------

return {
  onstart = function(toggleterm)
    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15;
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.3;
        end
      end,
      direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
      -- open_mapping = [[<C-t>]],
      open_mapping = require("keybindings").toggletermKeys(),
    });

  end
}
