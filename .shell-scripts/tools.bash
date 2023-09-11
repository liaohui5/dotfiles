#!/bin/bash

# generate config file by templates
function tpl() {
  template_name="$1"
  filename=""
  if [[ $template_name == "prettier" ]]; then
    filename="prettier.config.mjs"
  elif [[ $template_name == "gitignore" ]]; then
    filename=".gitignore"
  elif [[ $template_name == "editorconfig" ]]; then
    filename=".editorconfig"
  else
    echo "not found template file $1"
    exit 1
  fi
  cmd="cp $HOME/.shell-scripts/templates/${filename} ./${filename}"
  eval $cmd
}

# query port status
function lsport() {
  port="$1"
  lsof -n -i:${port}
}
