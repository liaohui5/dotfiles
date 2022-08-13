------------------------------------------------------------------------------------
-- ##     ## ####     ######   #######  ##    ## ######## ####  ######    ######
-- ##     ##  ##     ##    ## ##     ## ###   ## ##        ##  ##    ##  ##    ##
-- ##     ##  ##     ##       ##     ## ####  ## ##        ##  ##        ##
-- ##     ##  ##     ##       ##     ## ## ## ## ######    ##  ##   ####  ######
-- ##     ##  ##     ##       ##     ## ##  #### ##        ##  ##    ##        ##
-- ##     ##  ##     ##    ## ##     ## ##   ### ##        ##  ##    ##  ##    ##
--  #######  ####     ######   #######  ##    ## ##       ####  ######    ######
------------------------------------------------------------------------------------
-- UI 插件不要开启太多, 影响编辑器速度, 而且会互相影响
------------------------------------------------------------------------------------

local UIPlugins = {
  { require_path = nil, config_name = "build-in" },
  { require_path = "lspsaga", config_name = "lspsaga" },
  { require_path = "lspkind", config_name = "lspkind" },
};

for _, item in pairs(UIPlugins) do
	local require_path = item["require_path"]
	local plugin_item = nil
	if require_path ~= nil then
		-- 如果 require_path 不是 nil, 就加载插件
		local status, plugin = pcall(require, require_path)
		if not status then
			vim.notify("[UI plugin]: " .. require_path .. " not found")
			return
		end
		plugin_item = plugin
	end

	-- 加载 config
	local config_name = "UI-configs." .. item["config_name"]
	local status, config = pcall(require, config_name)
	if not status then
		vim.notify("[UI config]: " .. config_name .. " not found")
		return
	end

	-- config 配置模块必须实现 onstart 方法
	config.onstart(plugin_item)
end
