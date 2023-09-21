#!/bin/zsh

# generate config file by templates
function tpl() {
  typeset -A templates
  templates=(
    # sub-command template-filename
    "prettier" "prettier.config.mjs"
    "gitignore" ".gitignore"
    "editorconfig" ".editorconfig"
    "vite" "vite.config.ts"
    "vite-env" "vite-env.ts"
    "tsconfig" "tsconfig.json"
    "tsconfig-node" "tsconfig.node.json"
  )
  local key="$1"
  local val="${templates[$key]}"

  if [[ -n $val ]]; then
    loacl cmd="cp $HOME/.shell-scripts/templates/${filename} ./${filename}"
    eval $cmd
  else
    echo "not support paramter '$key'"
  fi
}

# query port status
function lsport() {
  local port="$1"
  lsof -n -i:${port}
}
