---@diagnostic disable: undefined-global
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

---@diagnostic disable-next-line: unused-local
return function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#272822"
  local background = "#272822"
  local foreground = "#f6f6f6"

  if tab.is_active then
    background = "#1a73e8"
  end

  local edge_foreground = background
  local left_arrow = SOLID_LEFT_ARROW
  if tab.tab_index == 0 then
    left_arrow = SOLID_LEFT_MOST
  end

  local process = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
  local index = tab.tab_index + 1
  local title = string.format(" %s:%s ", index, process)

  return {
    -- { Attribute = { Intensity = "Bold" } },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = left_arrow },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    -- { Text = id },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
    { Attribute = { Intensity = "Normal" } },
  }
end
