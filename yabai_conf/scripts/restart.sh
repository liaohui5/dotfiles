#!/usr/bin/env bash

YabaiRestartServices() {
  # brew services restart spacebar
  brew services restart sketchybar
  yabai --restart-service
  skhd --restart-service
  echo "services restart success"
}

YabaiRestartServices
