#!/bin/bash 

# generate .gitignore
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ; }

# generate mit license(username liaohui5)
function mitlicense(){ curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/LICENSE; }

# generate .editorconfig
function editorconfig(){ curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/.editorconfig; }

# generate .prettierrc.js
function prettierconfig(){ curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/.prettierrc.js; }

# query port
function lsport() {
  port="$1"
  lsof -n -i:${port}
}
