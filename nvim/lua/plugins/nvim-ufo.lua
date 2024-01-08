--------------------------------------------------------------
-- 美化折叠样式插进
-- github: https://github.com/kevinhwang91/nvim-ufo
--------------------------------------------------------------
return {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    version = "v1.*",
    build = "npm install --frozen-lockfile",
    enabled = false,
    dependencies = {
        "kevinhwang91/promise-async",
    },
    opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
            fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
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
            end,
        })
    end,
}
