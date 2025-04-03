#!/usr/bin/env zsh

###########################################################################################
# system proxy management
# v2rayU(http:1087 socks5:1080) clash(http:7890 socks5:7890) singbox(http:9090 socks5:9090)
###########################################################################################
function setproxy() {
  echo 'Please input action id to set system proxy:'
  echo '0: reset'
  echo '1: clash'
  echo '2: v2ray'
  echo '3: singbox'

  read -r action_id

  # reset
  if [[ $action_id -eq '0' ]]; then
    export https_proxy='' http_proxy='' all_proxy=''
    echo 'reset system proxy'
    return 0
  fi

  local proxy_name=''
  local proxy_http_port=''
  local proxy_socks5_port=''
  if [[ $action_id -eq '1' ]]; then
    proxy_name='clash'
    proxy_http_port='7890'
    proxy_socks5_port='7890'
  elif [[ $action_id -eq '2' ]]; then
    proxy_name='v2ray'
    proxy_http_port='1080'
    proxy_socks5_port='1080'
  elif [[ $action_id -eq '3' ]]; then
    proxy_name='singbox'
    proxy_http_port='9090'
    proxy_socks5_port='9090'
  else
    echo 'invalid action id'
    return 1
  fi

  local host='127.0.0.1'
  local http_proxy="http://$host:$proxy_http_port"
  local http_proxy="https://$host:$proxy_http_port"
  local socks5_proxy="socks5://$host:$proxy_socks5_port"
  eval "export https_proxy=$http_proxy http_proxy=$http_proxy all_proxy=$socks5_proxy"

  # print message and env vars
  echo "set system proxy to $proxy_name"
  echo "http_proxy : $http_proxy"
  echo "https_proxy: $https_proxy"
  echo "all_proxy  : $socks5_proxy"
}
