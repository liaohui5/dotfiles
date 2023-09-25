#!/usr/local/bin/bash

# generate config file by templates
function tpl() {
  declare -A templates
  templates[prettier]="prettier.config.mjs"
  templates[gitignore]=".gitignore"
  templates[editorconfig]=".editorconfig"
  templates[vite]="vite.config.ts"
  templates[viteenv]="vite-env.ts"
  templates[tsc]="tsconfig.json"
  templates[tscnode]="tsconfig.node.json"
  local key="$1"
  local filename="${templates[$key]}"
  if [[ -z "${filename}" ]]; then
    echo "not support paramter '$key'"
  fi

  filepath="$HOME/.shell-scripts/templates/${filename}"
  if [[ -r "${filepath}" ]]; then
    cp "${filepath}" "./${filename}"
    echo "config file '${filename}' generated"
  else
    echo "not found config file '${filename}'"
  fi

}

# query port status
function lsport() {
  local port="$1"
  lsof -n -i:"${port}"
}
