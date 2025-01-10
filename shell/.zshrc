################################################################
# execute zprofile
# zshrc -> zprofile + bashrc -> bashprofile
################################################################
# bashrc and profile
if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi

if [[ -f "${HOME}/.bash_profile" ]]; then
    source "${HOME}/.bash_profile"
fi

# zsh profile
source "${HOME}/.zprofile"

# alias
source "${HOME}/.shell-scripts/.alias.sh"

