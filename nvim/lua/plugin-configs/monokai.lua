----------------------------------------------------
-- 底部状态栏美化插件
-- docs: https://github.com/tanvirtin/monokai.nvim
----------------------------------------------------
local monokai = loadModule("monokai", "plugin-configs")

monokai.setup({
  italics = false,
  palette = {
    name        = 'monokai',
    base0       = '#23241f',
    base1       = '#23241f',
    base2       = '#23241f', -- backgound
    base3       = '#36352d', -- highlight current line
    base4       = '#383a3a', -- selected
    base5       = '#4d5154', -- linenumber color
    base6       = '#58595c', -- comment
    base7       = '#d3d3d3', -- telescope border
    white       = '#f1f1f1', -- variable
    pink        = '#e83967', -- keyworld
    green       = '#a6e22e', -- function backgound
    diff_change = '#23241f', -- git sign backgound
    aqua        = '#66d9ef', -- brackets
    yellow      = '#e6db74', -- string
    orange      = '#fd971f', -- snippet selected
    purple      = '#ae81ff', -- boolean
  },
});
