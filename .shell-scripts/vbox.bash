#!/bin/bash

# virtual box 虚拟机对应的名字和 ip
declare -A vboxvms
vboxvms[centos7]='192.168.56.22'

function vbox() {
  if [[ $1 == 'start' ]]; then
    VBoxManage startvm "$2" --type headless
  elif [[ $1 == 'stop' ]]; then
    VBoxManage controlvm "$2" poweroff
  elif [[ $1 == 'ssh' ]]; then
    ssh root@"${vboxvms[$2]}"
  elif [[ $1 == 'ssh' ]]; then
    sftp root@"${vboxvms[$2]}"
  else
    echo 'Only supported [start, stop, ssh, sftp] commands'
  fi
}
