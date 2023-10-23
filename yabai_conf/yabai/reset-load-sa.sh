#!/usr/local/bin/bash

# 由于每次更新都需要手动更新 这个 sudoers/yabai 所有写了这个脚本,
# 注意: 需要 root 权限运行
echo "liaohui5 ALL=(root) NOPASSWD: sha256: $(shasum -a 256 $(which yabai))" >/private/etc/sudoers.d/yabai
