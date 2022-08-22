" 用 ranger 替换默认的 Netrw 文件管理器
let g:rnvimr_enable_ex = 1

" 选择文件后隐藏 ranger
let g:rnvimr_enable_picker = 1

" 用这个命令替换 ranger rc.conf 中的 $EDITOR
let g:rnvimr_edit_cmd = 'drop'

" 隐藏 .gigignore 文件中忽略的文件
let g:rnvimr_hide_gitignore = 1

" 边框属性
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}

" 当 buffer 中的文件被ranger删除时, 关闭对应的buffer
let g:rnvimr_enable_bw = 1

" 遮罩层
let g:rnvimr_shadow_winblend = 70

" 启动 ranger 命令
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']

" 高亮 ranger 光标所在行
highlight link RnvimrNormal CursorLine

" 切换显示/隐藏ranger窗口
nnoremap <silent> <C-n> :RnvimrToggle<CR>
tnoremap <silent> <C-n> <C-\><C-n>:RnvimrToggle<CR>

" Map Rnvimr action
" 快捷键映射: 
" <C-e> 用 nvim 编辑
" ges:  用 nvim 编辑, 并且上下分屏
" gev:  用 nvim 编辑, 并且左右分屏
let g:rnvimr_action = {
            \ '<Enter>': 'NvimEdit edit',
            \ 'o': 'NvimEdit edit',
            \ 'ges': 'NvimEdit split',
            \ 'gev': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" ranger 打开时的最大大小(宽度/高度), 如果不设置
" 就使用 ranger 的 rc.conf 中的配置
" let g:rnvimr_ranger_views = [
"             \ {'minwidth': 90, 'ratio': []},
"             \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
"             \ {'maxwidth': 49, 'ratio': [1]}
"             \ ]

" ranger 打开时距离编辑器左上角的距离(width/height/col/row)
" let g:rnvimr_layout = {
"             \ 'relative': 'editor',
"             \ 'width': float2nr(round(0.6 * &columns)),
"             \ 'height': float2nr(round(0.8 * &lines)),
"             \ 'col': float2nr(round(0.2 * &columns)),
"             \ 'row': float2nr(round(0.1 * &lines)),
"             \ 'style': 'minimal'
"             \ }

" ranger 打开时全屏
" let g:rnvimr_presets = [{}]
" let g:rnvimr_layout = {
"            \ 'relative': 'editor',
"            \ 'width': &columns,
"            \ 'height': &lines - 2,
"            \ 'col': 0,
"            \ 'row': 0,
"            \ 'style': 'minimal'
"            \ }
