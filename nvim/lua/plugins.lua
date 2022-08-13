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
-- 所有插件在这里安装
-- 注意先安装插件管理器 Packer.nvim:
-- nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
-- docs: https://github.com/wbthomason/packer.nvim

vim.cmd([[packadd packer.nvim]])

---------------------------------------------------
-- Pakcer 插件配置
---------------------------------------------------
local packerConfig = {
	-- 下载插件最大并发数
	max_jobs = 16,

	-- 不设置超时时间, 如果网速较慢, 设置为 true, 可能插件安装失败
	clone_timeout = false,

	-- Packer 显示面板
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
}

-- 启动 packer & 插件列表 & 插件配置
return require("packer").startup({
	---------------------------------------------------
	-- Pakcer 插件列表
	---------------------------------------------------
	function(use)
		-- packer 包管理工具可以管理自己
		use({ "wbthomason/packer.nvim" })

		-- 基础工具函数库
		use({ "nvim-lua/plenary.nvim" })

		-- 更好的编程语言语法高亮支持
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})

		-- 文件图标插件
		use({ "kyazdani42/nvim-web-devicons" })

		-- 颜色主题 onedark
		use({ "navarasu/onedark.nvim" })
    use({ "tanvirtin/monokai.nvim" })
    use({ "marko-cerovac/material.nvim" })
    use({ "catppuccin/nvim", as = "catppuccin" })

		-- 文件概览导航
		use({
			"stevearc/aerial.nvim",
			requires = {
				"nvim-treesitter/nvim-treesitter",
			},
		})

		-- 顶部 buffer 栏
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- 底部状态栏
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				opt = true,
			},
		})

		-- 侧边栏文件目录树
		use({
			"kyazdani42/nvim-tree.lua",
			tag = "nightly",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
		})

    -- 文件管理插件 ranger 集成
    use({ 'kevinhwang91/rnvimr' })

		-- 自动读取/自动保存文件
		use({ "djoshea/vim-autoread" })
		use({ "Pocco81/auto-save.nvim" })

		-- 添加/删除/修改字符两边字符
		use({ "tpope/vim-surround" })

		-- repeat .重复功能增强
		use({ "tpope/vim-repeat" })

		-- easyclip, 粘贴增强
		-- use({ "svermeulen/vim-easyclip" })

		-- 搜索文件/buffer/bookmarks
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				{ "nvim-lua/plenary.nvim" },
			},
		})

		-- 切换命令行
		use({
			"akinsho/toggleterm.nvim",
			tag = "v2.*",
		})

		-- 自动注释
		use({ "numToStr/Comment.nvim" })

		-- 支持 .editorconfig 文件
		use({ "gpanders/editorconfig.nvim" })

		-- 类似easy-montion的快速移动插件
		use({
			"phaazon/hop.nvim",
			branch = "v2",
		})

		-- git 状态显示
		use({
			"lewis6991/gitsigns.nvim",
			tag = "release",
		})

		-- session 管理, 类似 vscode 的 Project Manager 插件的功能
		use({
			"Shatur/neovim-session-manager",
			requires = { "nvim-lua/plenary.nvim" },
		})

		-- 自动输入匹配的括号
		use({ "windwp/nvim-autopairs" })

		-- 缩进显示
		use({ "lukas-reineke/indent-blankline.nvim" })

		-- 替换增强插件
		use({ "nvim-pack/nvim-spectre" })

		-- 代码对齐插件, 类似的如: https://github.com/junegunn/vim-easy-align
		use({ "Vonr/align.nvim" })

		-- coc 代码提示, 自动完成, Node写的, 速度比Lua写的的LSP要慢
		-- 但是稳定, 所以放到这里方便切换
		-- 如果网速较慢, 建议开个梯子, 否则特别容易失败
		-- 注意, 需要提前安装好 Node.js 和 yarn
		-- use({
		--   'neoclide/coc.nvim',
		--   branch = 'release',
		--   run = 'yarn install --frozen-lockfile'
		-- });

		----------------------------------------------
		-- LSP/CMP: 代码提示/ 补全配置/ 代码格式化 / UI增强
		---------------------------------------------
		-- 代码提示/补全
		use({ "hrsh7th/nvim-cmp" })                    -- 补全引擎
		use({ "saadparwaiz1/cmp_luasnip" })            -- Snippet 引擎
		use({ "L3MON4D3/LuaSnip" })                    -- Snippet 引擎
		use({ "hrsh7th/cmp-nvim-lsp" })                -- { name = 'nvim_lsp' }
		use({ "hrsh7th/cmp-buffer" })                  -- { name = 'buffer' },
		use({ "hrsh7th/cmp-path" })                    -- { name = 'path' }
		use({ "hrsh7th/cmp-cmdline" })                 -- { name = 'cmdline' }
		use({ "hrsh7th/cmp-nvim-lsp-signature-help" }) -- { name = 'nvim_lsp_signature_help' }
    use({ "hrsh7th/cmp-nvim-lua" })                -- { name = 'nvim_lua' }
    use({ "ray-x/cmp-treesitter" })                -- { name = 'treesitter' }
    -- tabnine 资源内存占用高
    -- use({                                          -- { name = 'cmp_tabnine' },
		-- 	"tzachar/cmp-tabnine",
		-- 	run = "./install.sh",
		-- 	requires = "hrsh7th/nvim-cmp",
		-- })
		use({ "rafamadriz/friendly-snippets" })        -- 常见编程语言代码段
		use({ "mhartington/formatter.nvim" })          -- 代码格式化

    -- LSP
		use({ "williamboman/nvim-lsp-installer" })     -- LSP 服务器安装工具
		use({ "neovim/nvim-lspconfig" })               -- lspconfig 配置 server 插件
		use({ "folke/lua-dev.nvim" })                  -- Lua 增强
    use({ "b0o/schemastore.nvim" })                -- json 增强

		-- 代码提示 UI 增强
		use({ "glepnir/lspsaga.nvim", branch = "main" })
    use({ "onsails/lspkind.nvim" });
	end,
	config = packerConfig,
})

----------------------------------------------------
-- 寻找想要的插件
-- https://vimawesome.com/
-- https://github.com/rockerBOO/awesome-neovim
-- https://github.com/altermo/vim-plugin-list
-- https://github.com/neovim/neovim/wiki/Related-projects#plugins
-- https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md
----------------------------------------------------
