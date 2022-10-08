#!/usr/bin/env bash
YabaiStopServices() {
  brew services stop skhd
  brew services stop spacebar
  brew services stop yabai
  echo "services stop success"
}

YabaiStopServices

