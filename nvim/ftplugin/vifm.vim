" 自动识别为 vim 语法
augroup vifmrc_to_vim_highlight
  autocmd! * <buffer>
  autocmd BufEnter <buffer> set filetype=vim
augroup END
