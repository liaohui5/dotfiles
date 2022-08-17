----------------------------------------------------
-- LSP 启动配置
-- docs:
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
----------------------------------------------------
local status, cmp = pcall(require, "cmp")
if not status then
  vim.notify("[lsp]: cmp not found")
  return
end

local M = {}

M.onstart = function()
  -- 指定加载自定义 snippets 目录
  vim.g.vsnip_snippet_dir = "~/.config/nvim/custom-snippets";

  -- 其他配置: 比如图标,补全引擎之类的
  local cmp_config = {
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        local lspkind_icons = {
          Text          = "",
          Method        = "",
          Function      = "",
          Constructor   = "",
          Field         = "ﰠ",
          Variable      = "",
          Class         = "ﴯ",
          Interface     = "",
          Module        = "",
          Property      = "ﰠ",
          Unit          = "ﭧ",
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
          TypeParameter = ''
        }
        local meta_type = vim_item.kind
        vim_item.kind = lspkind_icons[vim_item.kind] .. ''
        vim_item.menu = ({
          nvim_lsp                = ' [' .. string.lower(meta_type) ..']',
          path                    = ' [path]',
          vsnip                   = ' [vsnip]',
          nvim_lua                = ' [nvim_lua]',
          buffer                  = ' [buffer]',
          nvim_lsp_signature_help = ' [signature_help]',
        })[entry.source.name]

        return vim_item
      end,
    },

    -- 默认选中的项
    preselect = cmp.PreselectMode.Item,

    -- 指定 snippets 引擎:
    -- docs: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    window = {
      -- 给代码提示框加上白色的边框
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    -- 可以摘这里找到更多的提示源: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    -- 但是建议不要太多, 很多事没用的信息, 且插件太多 会影响速度
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "vsnip" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "nvim_lsp_signature_help" },
    }),
  }

  -- 命令行搜搜补全
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
  cmp.setup.cmdline("?", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- 命令行命令补全
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "cmdline" } }, { { name = "path" } }),
  })

  -- 快捷键绑定
  cmp_config.mapping = cmp.mapping.preset.insert(require("keybindings").cmpKeys(cmp))

  -- 启动
  cmp.setup(cmp_config)
end

return M
