PROMPT='%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'
RIGHT_SYMBOL=" %{$reset_color%}"
PROMPT+="%(?:%{$fg_bold[green]%}$RIGHT_SYMBOL:%{$fg_bold[red]%}$RIGHT_SYMBOL)"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}(%{$fg[green]%}󰘬"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%})"

