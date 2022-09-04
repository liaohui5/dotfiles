" gf command resolves the webpack alias path
augroup resolve_webpack_alias_path
 autocmd! * <buffer>
 autocmd BufEnter <buffer> setlocal includeexpr=substitute(v:fname,'^@\/','src/','')
 autocmd BufEnter <buffer> setlocal isfname+=@-@
augroup END
