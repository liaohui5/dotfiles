---------------------------------------------------------------------
-- UI 美化(代码提示|代码诊断)
-- docs: https://github.com/onsails/lspkind.nvim
---------------------------------------------------------------------
return {
  onstart = function(lspkind)
    lspkind.init({
      mode       = "symbol_text", -- 'text' | 'text_symbol' | 'symbol_text' | 'symbol'
      preset     = "default",     -- 'codeiconc' | 'default'
      symbol_map = {
        Text          = "",
        Method        = "",
        Function      = "",
        Constructor   = "",
        Field         = "ﰠ",
        Interface     = "",
        Unit          = " ",
        Value         = "",
        Enum          = "",
        Keyword       = "",
        Snippet       = "",
        Color         = "",
        File          = "",
        Reference     = "",
        Folder        = "",
        EnumMember    = "",
        Constant      = "",
        Struct        = "פּ",
        Event         = "",
        Operator      = "",
        TypeParameter = "",
        Class         = "",
        Module        = "",
        Property      = "",
        Variable      = "",
      },
    })
  end
}
