#!/usr/local/bin/bash

# query port status
function lsport() {
  local port="$1"
  lsof -n -i:"${port}"
}

# generate config file by templates
function tpl() {
  template_dir="$HOME/.shell-scripts/templates"
  templates=$(ls "$template_dir")
  declare -A template_arr

  echo 'please input template id:'
  local index=1
  echo "$templates" | while IFS= read -r item; do
    echo -e "  $index: $item"
    template_arr["$index"]=$item
    index=$((index + 1))
  done

  read -r input_id
  local filename=${template_arr["${input_id}"]}
  local filepath="$template_dir/$filename"
  if [[ -r "$filepath" ]]; then
    cp "$filepath" .
    echo "template $filename generate successfully"
  else
    echo "not found template id $input_id"
  fi
}
