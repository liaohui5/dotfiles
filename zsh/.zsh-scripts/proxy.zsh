#!/usr/bin/env zsh

###########################################################################################
# system proxy management
# v2rayU(http:1087 socks5:1080) clash(http:7890 socks5:7890) singbox(http:9090 socks5:9090)
###########################################################################################
function checkproxy() {
  echo "https_proxy is: ${https_proxy}"
  echo "http_proxy  is: ${http_proxy}"
  echo "all_proxy   is: ${all_proxy}"
}

function setproxy() {
  ip="127.0.0.1"

  echo "please input proxy port(default: 7890)"
  read -r port
  if [[ -z "$port" ]]; then
    port="7890"
  fi

  proxy="export https_proxy=http://${ip}:${port} http_proxy=http://${ip}:${port} all_proxy=socks5://${ip}:${port}"
  eval $proxy

  checkproxy
}

function resetproxy() {
  proxy="export https_proxy='' http_proxy='' all_proxy=''"
  eval $proxy
}