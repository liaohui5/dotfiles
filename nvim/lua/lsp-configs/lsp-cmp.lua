----------------------------------------------------
-- LSP 启动配置
-- docs:
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
----------------------------------------------------
---------------------------------------------------
-- 载入补全引擎 和 补全 snippets 配置
---------------------------------------------------
-- 自定义代码诊断图标
local status2, lspkind = pcall(require, "lspkind")
if not status2 then
	vim.notify("[lsp]: lspkind not found")
	return
end

-- 自动完成
local status, cmp = pcall(require, "cmp")
if not status then
	vim.notify("[lsp]: cmp not found")
	return
end

-- 补全 snippets
local status1, luasnip = pcall(require, "luasnip")
if not status1 then
	vim.notify("[plugin]: luasnip not found")
	return
end

-- cmp
local M = {}

M.onstart = function()
	-- 从哪加载 snippets, load freindly-snippets
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_vscode").load({
		-- Load snippets from ~/.config/nvim/snippets folder
		paths = { "./custom-snippets" },
	})

	-- 其他配置: 比如图标,补全引擎之类的
	local cmp_config = {
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select   = false,
		},
		completion = {
			keyword_length = 1,
		},
		experimental = {
			ghost_text  = false,
			native_menu = false,
		},
		duplicates = {
			buffer   = 1,
			path     = 1,
			nvim_lsp = 1,
			luasnip  = 1,
		},
		duplicates_default = 1,
		formatting = {
      format     = lspkind.cmp_format({
        mode     = "symbol_text",
        maxwidth = 50,
        before   = function(entry, vim_item)
          vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
          return vim_item
        end,
      }),
    },
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			-- 给代码提示框加上白色的边框
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "cmp_tabnine" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			-- { name = "spell" },
			-- { name = "calc" },
			-- { name = "emoji" },
			{ name = "treesitter" },
			-- { name = "crates" },
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
	cmp_config.mapping = cmp.mapping.preset.insert(require("keybindings").cmpKeys(cmp, luasnip, cmp_config))

	-- 启动
	cmp.setup(cmp_config)
end

return M
