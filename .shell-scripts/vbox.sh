#!/bin/bash 

# virtualbox server start,poweroff,ssh commands
declare -A servers
servers[centos7]='192.168.56.22'
servers[debian11]='192.168.56.33'

function vbox() {
  if [[ $1 == 'start' ]]; then
      VBoxManage startvm "$2" --type headless
  elif [[ $1 == 'ssh' ]]; then
      ssh root@"${servers[$2]}"
  elif [[ $1 == 'halt' || $1 == 'stop' || $1 == 'poweroff' ]]; then
      VBoxManage controlvm "$2" poweroff
  else
      echo 'Only supported [start, ssh, halt] commands'
  fi
}
