-- some lua utils functions for input.conf

function seek_backward_ms(amount)
    local time = mp.get_property_number("time-pos") - amount / 1000
    mp.set_property_number("time-pos", time)
end

function seek_forward_ms(amount)
    local time = mp.get_property_number("time-pos") + amount / 1000
    mp.set_property_number("time-pos", time)
end

mp.register_script_message("seek_backward_ms", seek_backward_ms)
mp.register_script_message("seek_forward_ms", seek_forward_ms)