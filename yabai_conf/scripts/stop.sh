#!/usr/bin/env bash
YabaiStopServices() {
  brew services stop skhd
  brew services stop spacebar
  # brew services stop yabai
  yabai --stop-service
  echo "services stop success"
}

YabaiStopServices

