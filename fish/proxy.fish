#!/bin/fish

###########################################################################################
# system proxy management
# v2rayU(http:1087 socks5:1080) clash(http:7890 socks5:7890) singbox(http:9090 socks5:9090)
###########################################################################################

function setproxy
    # echo "please input proxy ip(default: 127.0.0.1)"
    # read -l ip
    # if test -z "$ip"
    #     set ip "127.0.0.1"
    # end
    set ip "127.0.0.1"

    echo -n "please input proxy port(default: 7890): "
    read -l port
    if test -z "$port"
        set port 7890
    end

    set -gx https_proxy "http://$ip:$port"
    set -gx http_proxy "http://$ip:$port"
    set -gx all_proxy "socks5://$ip:$port"

    echo "https_proxy is: $https_proxy"
    echo "http_proxy  is: $http_proxy"
    echo "all_proxy   is: $all_proxy"
end

function resetproxy
    set -gx https_proxy ""
    set -gx http_proxy ""
    set -gx all_proxy ""
end
