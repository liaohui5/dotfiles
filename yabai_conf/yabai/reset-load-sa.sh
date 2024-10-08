#!/bin/bash

# 由于每次更新都需要手动更新 这个 sudoers/yabai 所有写了这个脚本,
# 注意: 需要 root 权限运行, 注意这个 "secret" 是你的用户名, 不能用 $(whoami), 因为需要root权限,会变成root
echo "secret ALL=(root) NOPASSWD: sha256: $(shasum -a 256 $(which yabai))" >/private/etc/sudoers.d/yabai
