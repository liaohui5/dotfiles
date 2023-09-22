#!/usr/local/bin/bash

# generate config file by templates
function tpl() {
  declare -A templates
  templates[prettier]="prettier.config.mjs"
  templates[gitignore]=".gitignore"
  templates[editorconfig]=".editorconfig"
  templates[vite]="vite.config.ts"
  templates["vite-env"]="vite-env.ts"
  templates[tsconfig]="tsconfig.json"
  templates["tsconfig-node"]="tsconfig.node.json"
  local key="$1"
  local filename="${templates[$key]}"
  if [[ -n "${filename}" ]]; then
    cp "$HOME/.shell-scripts/templates/${filename}" "./${filename}"
    echo "config file '${filename}' generated"
  else
    echo "not support paramter '$key'"
  fi
}

# query port status
function lsport() {
  local port="$1"
  lsof -n -i:"${port}"
}
