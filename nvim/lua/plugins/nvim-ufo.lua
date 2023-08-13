--------------------------------------------------------------
-- 折叠美化
-- docs: https://github.com/nvim-treesitter/nvim-treesitter
--------------------------------------------------------------
local fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" + fold %d lines "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
end

return {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    version = 'v1.*',
    build = 'npm install --frozen-lockfile',
    dependencies = {
        "kevinhwang91/promise-async",
    },
    opts = {
        fold_virt_text_handler = fold_virt_text_handler,
    }
}

--[[
    local previewFold = function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
        end
    end
    ["zj"] = {
        ufo.goNextClosedFold,
        "next closed fold",
      },
      ["zk"] = {
        ufo.goPreviousClosedFold,
        "prev closed fold",
      },
      ["zJ"] = {
        function()
          ufo.goNextClosedFold()
          ufo.peekFoldedLinesUnderCursor()
        end,
        "preview next closed fold",
      },
      ["zK"] = {
        function()
          ufo.goPreviousClosedFold()
          ufo.peekFoldedLinesUnderCursor()
        end,
        "preview prev closed fold",
      },
      ["zR"] = {
        ufo.openAllFolds,
        "open all folds",
      },
      ["zM"] = {
        ufo.closeAllFolds,
        "close all folds",
      },
      ["zr"] = {
        ufo.openFoldsExceptKinds,
        "open more folds",
      },
      ["zm"] = {
        ufo.closeFoldsWith,
        "close more folds",
      },
      ["zp"] = {
        previewFold,
        "preview fold content",
      },
--]]
