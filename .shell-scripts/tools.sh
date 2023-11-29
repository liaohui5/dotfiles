#!/usr/local/bin/bash

# generate config file by templates
function tpl() {
  template_dir="$HOME/.shell-scripts/templates"
  # list template files and excude . .. and .DS_Store
  templates=$(ls -a "$template_dir" | grep -vE '^(.|..|.DS_Store)$')
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

function reload-shell-scripts() {
  source ~/.bashrc
  source ~/.bash_profile
  source ~/.zshrc
  source ~/.zsh_profile
  source ~/.shell-scripts/alias.sh
  source ~/.shell-scripts/tools.sh
  source ~/.shell-scripts/vmware.sh
}
