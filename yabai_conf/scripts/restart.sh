#!/usr/bin/env bash
YabaiRestartServices() {
  brew services restart skhd
  brew services restart spacebar
  brew services restart yabai
  echo "services restart success"
}

YabaiRestartServices

