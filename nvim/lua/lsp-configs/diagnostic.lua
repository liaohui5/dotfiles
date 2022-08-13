-----------------------------------------------------------------------------
-- 内置的 API 更改代码诊断 UI
-----------------------------------------------------------------------------
return {
  onstart = function()
    local signs = {
      { name = "DiagnosticSignError", text = "💢" },
      { name = "DiagnosticSignWarn",  text = "😱" },
      { name = "DiagnosticSignHint",  text = "🤔" },
      { name = "DiagnosticSignInfo",  text = "😐" },
    }

    -- 提示信息图标设置
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text   = sign.text
      })
    end

    -- 配置代码诊断选项
    -- 文档: :h vim.diagnostic.config()
    vim.diagnostic.config({
      virtual_text     = true, -- 是否显示显示提示文字
      update_in_insert = true,
      underline        = true,
      severity_sort    = true,
      signs            = { active = signs }, -- 显示图标
      float            = {
        focusable      = false,
        style          = "minimal",
        border         = "rounded",
        source         = "always",
        header         = "",
        prefix         = "",
      },
    })
  end
}
