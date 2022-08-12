---------------------------------------------------------------------
-- 给 nvim-cmp 提供 lsp 的代码提示
-- docs:
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/glepnir/lspsaga.nvim
---------------------------------------------------------------------
local status, lspsaga = pcall(require, "lspsaga")
if not status then
	vim.notify("[lsp] lspsaga not found!")
	return
end
local status1, lspkind = pcall(require, "lspkind")
if not status1 then
	vim.notify("[lsp] lspkind not found!")
	return
end

local UI = {}
--------------------------------------
-- 设置代码诊断UI图标和文字信息
--------------------------------------
local setDiagnosticUI = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
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
		virtual_text     = false,   -- 是否显示显示提示文字
		update_in_insert = true,
		underline        = true,
		severity_sort    = true,
		signs = { active = signs }, -- 显示图标
		float = {
			focusable = false,
			style     = "minimal",
			border    = "rounded",
			source    = "always",
			header    = "",
			prefix    = "",
		},
	})
end

--------------------------------------
-- 设置代码提示的UI图标和文字信息
--------------------------------------
local initSagaUI = function()
	-- 绑定快捷键
	local keys = require("keybindings").lspUIKeys()
	lspsaga.init_lsp_saga({
		border_style              = "single", -- "single" | "double" | "rounded" | "bold" | "plus"
		saga_winblend             = 0,        -- 0-30
		move_in_saga              = keys.move_in_saga,
		diagnostic_header         = { "😡", "😥", "😤", "😐" },
		diagnostic_source_bracket = {},
		max_preview_lines         = 10,
		code_action_icon          = "💡",
		code_action_num_shortcut  = true,
    show_diagnostic_source    = true,
		code_action_lightbulb = {
			enable           = false, -- 启用会让 html 文件报错, 没有 textDocument/codeAction is not suppouted
			sign             = true,
			enable_in_insert = true,
			sign_priority    = 20,
			virtual_text     = true,
		},
		-- finder icons
		finder_icons = {
			def = "  ",
			ref = "諭 ",
			link = "  ",
		},
		finder_action_keys      = keys.finder_action_keys,
		code_action_keys        = keys.code_action_keys,
		rename_action_quit      = "<C-c>",
		rename_in_select        = true,
		definition_preview_icon = " ",
		-- show symbols in winbar must nightly
		symbol_in_winbar = {
			in_custom      = false,
			enable         = false,
			separator      = " ",
			show_file      = true,
			click_support  = false,
		},
		-- show outline
		show_outline = {
			win_position = "right",
			-- set special filetype win that outline window split.like NvimTree neotree, defx, db_ui
			win_with     = "NvimTree",
			win_width    = 30,
			auto_enter   = true,
			auto_preview = true,
			virt_text    = "┃",
			jump_key     = "o",
			-- auto refresh when change buffer
			auto_refresh = true,
		},
		-- if you don't use nvim-lspconfig you must pass your server name and
		-- the related filetypes into this table
		-- like server_filetype_map = { metals = { "sbt", "scala" } }
		server_filetype_map = {},
	})
end

--------------------------------------
-- 设置代码提示的UI图标
--------------------------------------
local initKindUI = function()
	lspkind.init({
		mode   = "symbol_text", -- 'text' | 'text_symbol' | 'symbol_text' | 'symbol'
		preset = "codicons",    -- 'codeiconc' | 'default'
		symbol_map = {
			Text          = "",
			Method        = "",
			Function      = "",
			Constructor   = "",
			Field         = "ﰠ",
			Interface     = "",
			Unit          = "塞",
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
			TypeParameter = " ",
			Class         = " ",
			Module        = " ",
			Property      = " ",
			Variable      = " ",
		},
	})
end

--------------------------------------
-- 启动
--------------------------------------
UI.onstart = function()
	-- 设置代码诊断侧边栏图标
	setDiagnosticUI()

  -- lspsaga
	initSagaUI()

  -- lspkind
  initKindUI();
end

return UI;
