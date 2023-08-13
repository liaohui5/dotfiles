#!/bin/bash

# https://docs.vmware.com/cn/VMware-Fusion/13/com.vmware.fusion.using.doc/GUID-24F54E24-EFB0-4E94-8A07-2AD791F0E497.html

# 虚拟机对应的文件名和ip地址
declare -A vmfiles

vmfiles[centos7]='192.168.121.200'
vmfiles[ubuntu18]='192.168.121.201'
vmfiles[debian12]='192.168.121.202'

# 存放 .vmwarevm 文件的位置
vmware_save_path="$HOME/vms";

function vm() {
  if [[ $1 == 'start' ]]; then
    vmrun start "$vmware_save_path/$2.vmwarevm" nogui
  elif [[ $1 == 'stop' ]]; then
    vmrun stop "$vmware_save_path/$2.vmwarevm"
  elif [[ $1 == 'ssh' ]]; then
    ssh root@"${vmfiles[$2]}"
  elif [[ $1 == 'sftp' ]]; then
    sftp root@"${vmfiles[$2]}"
  else
    echo 'Only supported [start, stop, shh, sftp] commands'
  fi
}
