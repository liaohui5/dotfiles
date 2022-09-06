-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                   缩进美化                                   │
-- │                docs: https://github.com/kevinhwang91/nvim-ufo                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local ufo = loadModule("ufo", "plugin-configs")

ufo.setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds     = {
    'imports',
    'comment',
  },
  preview = {
    win_config = {
      border = { '', '─', '', '', '', '─', '', '' },
      winhighlight = 'Normal:Folded',
      winblend     = 0
    },
    mappings = {
      scrollU = '<C-u>',
      scrollD = '<C-d>'
    }
  },
  provider_selector = function(bufnr, filetype, buftype)
    -- indent | treesitter | lsp
    local ftMap = {
      vim = 'indent',
      python = { 'indent' },
      git = ''
    }
    return ftMap[filetype]
  end
})

require("keybindings").ufoKeys(ufo);

-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
-- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
-- vim.keymap.set('n', 'K', function()
--   local winid = require('ufo').peekFoldedLinesUnderCursor()
--   if not winid then
--     -- choose one of them
--     -- coc.nvim
--     vim.fn.CocActionAsync('definitionHover')
--     -- nvimlsp
--     vim.lsp.buf.hover()
--   end
-- end)
