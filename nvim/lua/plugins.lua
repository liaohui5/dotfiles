--  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------. .----------------.
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | |   ______     | || |   _____      | || | _____  _____ | || |    ______    | || |     _____    | || | ____  _____  | || |    _______   | |
-- | |  |_   __ \   | || |  |_   _|     | || ||_   _||_   _|| || |  .' ___  |   | || |    |_   _|   | || ||_   \|_   _| | || |   /  ___  |  | |
-- | |    | |__) |  | || |    | |       | || |  | |    | |  | || | / .'   \_|   | || |      | |     | || |  |   \ | |   | || |  |  (__ \_|  | |
-- | |    |  ___/   | || |    | |   _   | || |  | '    ' |  | || | | |    ____  | || |      | |     | || |  | |\ \| |   | || |   '.___`-.   | |
-- | |   _| |_      | || |   _| |__/ |  | || |   \ `--' /   | || | \ `.___]  _| | || |     _| |_    | || | _| |_\   |_  | || |  |`\____) |  | |
-- | |  |_____|     | || |  |________|  | || |    `.__.'    | || |  `._____.'   | || |    |_____|   | || ||_____|\____| | || |  |_______.'  | |
-- | |              | || |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
---@diagnostic disable
-- 所有插件在这里安装
-- 注意先安装插件管理器 Packer.nvim:
-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
-- docs: https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim';
local compile_path = install_path .. "/plugin/packer_compiled.lua";
local packer_bootstrap = nil;
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup({
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │                   Pakcer 插件列表 & 启动插件管理器 packer                    │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  function(use)
    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                        packer 包管理工具可以管理自己                         │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({ "wbthomason/packer.nvim" })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                基础工具函数库                                │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({ "nvim-lua/plenary.nvim" })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                          更好的编程语言语法高亮支持                          │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = [[require("plugin-configs.nvim-treesitter")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                              区域选择/移动增强                               │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      requires = "nvim-treesitter/nvim-treesitter",
    })
    -- use({
    --   "terryma/vim-expand-region",
    --   config = [[require("plugin-configs.vim-expand-region")]],
    -- })
    -- use({
    --   "RRethy/nvim-treesitter-textsubjects",
    --   requires = "nvim-treesitter/nvim-treesitter",
    -- })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                           不同对的括号不同颜色显示                           │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "p00f/nvim-ts-rainbow",
      requires = "nvim-treesitter/nvim-treesitter",
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                          自动装换字符串成模板字符串                          │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "axelvc/template-string.nvim",
      requires = "nvim-treesitter/nvim-treesitter",
      config = [[require("plugin-configs.template-string")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                 标签自动闭合                                 │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "windwp/nvim-ts-autotag",
      requires = "nvim-treesitter/nvim-treesitter",
      config = [[require("plugin-configs.nvim-ts-autotag")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  文件图标插                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugin-configs.nvim-web-devicons")]]
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   颜色主题                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- use({
    --   "tanvirtin/monokai.nvim",
    --   config = [[require("plugin-configs.monokai")]]
    -- })
    use({
      "navarasu/onedark.nvim",
      config = [[require("plugin-configs.onedark")]]
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                        文件管理插件 ranger/vifm 集成                         │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- use({
    --   "kevinhwang91/rnvimr",
    --   config = [[require("plugin-configs.rnvimr")]],
    -- })
    use({
      "vifm/vifm.vim",
      config = [[require("plugin-configs.vifm")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                            自动读取/自动保存文件                             │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({ "chrisbra/vim-autoread" })
    -- use({
    --   "Pocco81/auto-save.nvim",
    --   config = [[require("plugin-configs.auto-save")]],
    -- })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │             添加/删除/修改两边字符,两个插件功能一样,任意一个即可             │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- use({ "tpope/vim-surround" })
    use({
      "kylechui/nvim-surround",
      tag = "*",
      config = [[require("plugin-configs.nvim-surround")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                重复.命令增强                                 │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({ "tpope/vim-repeat" })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                              自动输入匹配的括号                              │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "windwp/nvim-autopairs",
      config = [[require("plugin-configs.nvim-autopairs")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   缩进显示                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = [[require("plugin-configs.indent_blankline")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                               颜色代码直接显示                               │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "norcalli/nvim-colorizer.lua",
      config = [[require("plugin-configs.colorizer")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   缩进美化                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "kevinhwang91/nvim-ufo",
      requires = "kevinhwang91/promise-async",
      config = [[require("plugin-configs.nvim-ufo")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                 替换增强插件                                 │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "nvim-pack/nvim-spectre",
      config = [[require("plugin-configs.spectre")]]
    })


    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   npm 操作                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
      config = [[require("plugin-configs.package-info")]]
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                      代码对齐插件, 类似 vim-easy-align                       │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "Vonr/align.nvim",
      config = [[require("plugin-configs.align")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  切换命令行                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "akinsho/toggleterm.nvim", tag = "v2.*",
      config = [[require("plugin-configs.toggleterm")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                     注释                                     │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "b3nj5m1n/kommentary",
      config = [[require("plugin-configs.kommentary")]],
    })
    use({
      "LudoPinelli/comment-box.nvim",
      config = [[require("plugin-configs.comment-box")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                           支持 .editorconfig 文件                            │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "gpanders/editorconfig.nvim",
      config = [[require("plugin-configs.editorconfig")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                        类似easy-montion的快速移动插件                        │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "phaazon/hop.nvim",
      branch = "v2",
      config = [[require("plugin-configs.hop")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                             which-key 快捷键菜单                             │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "folke/which-key.nvim",
      commit = "f11260251ad942ba1635db9bc25c2efaf75caf0a",
      config = [[require("plugin-configs.which-key")]]
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                          搜索文件/buffer/bookmarks                           │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "nvim-telescope/telescope.nvim",
      tag = "nvim-0.6",
      requires = "nvim-lua/plenary.nvim",
      config = [[require("plugin-configs.telescope")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                   书签管理                                   │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "MattesGroeger/vim-bookmarks",
      config = [[require("plugin-configs.vim-bookmarks")]],
    })
    use({
      "tom-anders/telescope-vim-bookmarks.nvim",
      requires = "MattesGroeger/vim-bookmarks"
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                顶部 buffer 栏                                │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- use({
    --   "romgrk/barbar.nvim",
    --   requires = "kyazdani42/nvim-web-devicons",
    -- })
    use({
      "akinsho/bufferline.nvim",
      tag = "v2.*",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[require("plugin-configs.bufferline")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  底部状态栏                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- use({
    --   "nvim-lualine/lualine.nvim",
    --   requires = {
    --     "kyazdani42/nvim-web-devicons",
    --     opt = true,
    --   },
    --   config = [[require("plugin-configs.lualine")]],
    -- })
    use({
      'feline-nvim/feline.nvim',
      config = [[require("plugin-configs.feline")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                               侧边栏文件目录树                               │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "kyazdani42/nvim-tree.lua",
      tag = "nightly",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[require("plugin-configs.nvim-tree")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                 git 状态显示                                 │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "lewis6991/gitsigns.nvim",
      tag = "release",
      config = [[require("plugin-configs.gitsigns")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  启动页插件                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    -- use({
    --   "glepnir/dashboard-nvim",
    --   config = [[require("plugin-configs.dashboard")]],
    -- })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │           session 管理, 类似 vscode 的 Project Manager 插件的功能            │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "Shatur/neovim-session-manager",
      requires = "nvim-lua/plenary.nvim",
      config = [[require("plugin-configs.session_manager")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                           在浏览器中预览 markdown                            │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
      ft = { "markdown" },
      config = [[require("plugin-configs.markdown-preview")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                               合并/切分当前行                                │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "AndrewRadev/splitjoin.vim",
      config = [[require("plugin-configs.splitjoin")]],
    })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                  格式化代码                                  │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({
      "mhartington/formatter.nvim",
      config = [[require("plugin-configs.formatter")]]
    })

    -- coc 代码提示, 自动完成, Node写的, 速度比Lua写的的LSP要慢
    -- 但是稳定, 所以放到这里方便切换
    -- 如果网速较慢, 建议开个梯子, 否则特别容易失败
    -- 注意, 需要提前安装好 Node.js 和 yarn
    -- use({
    --   'neoclide/coc.nvim',
    --   branch = 'release',
    --   run = 'yarn install --frozen-lockfile',
    --   config = [[require("plugin-configs.coc")]],
    -- });


    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                     LSP/CMP: 代码提示/ 补全配置/ UI增强                      │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({ "williamboman/mason.nvim" })               -- LSP/DAP 服务器安装管理工具
    use({ "williamboman/mason-lspconfig.nvim" })     -- LSP/DAP 服务器安装管理工具
    use({ "neovim/nvim-lspconfig" })                 -- lspconfig 配置 server 插件
    use({ "folke/lua-dev.nvim" })                    -- Lua 增强
    use({ "b0o/schemastore.nvim" })                  -- json 增强
    use({ "hrsh7th/nvim-cmp" })                      -- 补全引擎
    use({ "rafamadriz/friendly-snippets" })          -- 常见编程语言 snippets
    use({ "hrsh7th/vim-vsnip" })                     -- vim-vsnip 插件
    use({ "hrsh7th/cmp-vsnip" })                     -- 将vim-vsnip 插件提供的内容加载到补全引擎
    use({ "hrsh7th/cmp-nvim-lsp" })                  -- { name = 'nvim_lsp' }
    use({ "hrsh7th/cmp-buffer" })                    -- { name = 'buffer' },
    use({ "hrsh7th/cmp-path" })                      -- { name = 'path' }
    use({ "hrsh7th/cmp-cmdline" })                   -- { name = 'cmdline' }
    use({ "hrsh7th/cmp-nvim-lsp-signature-help" })   -- { name = 'nvim_lsp_signature_help' }
    use({ "hrsh7th/cmp-nvim-lua" })                  -- { name = 'nvim_lua' }
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- UI 增强
    -- use({ "jose-elias-alvarez/null-ls.nvim" })       -- 多语言代码检查工具, 功能类似 ESLint
    -- use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                               dap 代码调试插件                               │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    use({ "mfussenegger/nvim-dap" })
    use({ "theHamsta/nvim-dap-virtual-text" })
    use({ "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" })
    use({ "mxsdev/nvim-dap-vscode-js", requires = "mfussenegger/nvim-dap" });
    use({ "microsoft/vscode-js-debug", opt = true, run = "npm install --legacy-peer-deps && npm run compile" })

    -- ╭──────────────────────────────────────────────────────────────────────────────╮
    -- │                                 安装插件插件                                 │
    -- ╰──────────────────────────────────────────────────────────────────────────────╯
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  -- ╭──────────────────────────────────────────────────────────────────────────────╮
  -- │                               Pakcer 插件配置                                │
  -- ╰──────────────────────────────────────────────────────────────────────────────╯
  config = {
    -- 编译路径
    compile_path = compile_path,

    -- 下载插件最大并发数
    max_jobs = 32,

    -- 不设置超时时间, 如果网速较慢, 设置为 true, 可能插件安装失败
    clone_timeout = false,

    -- Packer 显示面板
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │                                寻找想要的插件                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ https://vimawesome.com                                                       │
-- │ https://github.com/rockerBOO/awesome-neovim                                  │
-- │ https://github.com/altermo/vim-plugin-list                                   │
-- │ https://github.com/neovim/neovim/wiki/Related-projects#plugins               │
-- │ https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md                   │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
