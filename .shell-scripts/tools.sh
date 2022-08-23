#!/bin/bash 

# generate git ignore file
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ; }

# generate mit license file, username liaohui5
# alias mitlicense="curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/LICENSE"
function mitlicense(){ curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/LICENSE; }

# generate .editorconfig template file
function editorconfig(){ curl -sL https://raw.githubusercontent.com/liaohui5/study-notes/master/.editorconfig; }
