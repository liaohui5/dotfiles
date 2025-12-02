---@diagnostic disable: undefined-global
-- some lua utils functions for input.conf

local function seek_backward_ms(amount)
    local time = mp.get_property_number("time-pos") - amount / 1000
    mp.set_property_number("time-pos", time)
end

local function seek_forward_ms(amount)
    local time = mp.get_property_number("time-pos") + amount / 1000
    mp.set_property_number("time-pos", time)
end

local function copy_current_time()
    local time_pos = mp.get_property_number("time-pos")
    if time_pos == nil then
      mp.osd_message("cannot get time-pos", 2)
      return
    end
    local hours = math.floor(time_pos / 3600)
    local minutes = math.floor((time_pos % 3600) / 60)
    local seconds = math.floor(time_pos % 60)
    local formatted_time = string.format("%02d:%02d:%02d", hours, minutes, seconds)

    -- execute system command for copy to clipboard
    os.execute(string.format("echo '%s' | pbcopy", formatted_time))
    mp.osd_message("copied: " .. formatted_time, 2)
end

mp.register_script_message("seek_backward_ms", seek_backward_ms)
mp.register_script_message("seek_forward_ms", seek_forward_ms)
mp.register_script_message("copy_current_time", copy_current_time)
