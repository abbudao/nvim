let g:mapleader='g'

set cb+=unnamedplus

set ts=2 sw=2 et

set ls=1 sc ru list

set tgc
colo lucius
LuciusWhiteLowContrast
nm <leader>C :exe 'Lucius'.(&bg=='dark'?'WhiteLowContrast':'Dark')<cr>
au ColorScheme * hi! NonText ctermfg=bg guifg=bg

fu! TextObjBeg(...)
  norm! `[
endf
fu! TextObjEnd(...)
  norm! `]
endf
nn <silent> [a :set opfunc=TextObjBeg<cr>g@a
nn <silent> ]a :set opfunc=TextObjEnd<cr>g@a

set ic scs nohls
map f <plug>(incsearch-forward)
map F <plug>(incsearch-backward)

set hid
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>

set cf
nn <leader>w :vsp<cr>
nn X :Bdelete<cr>
nn Q :q<cr>

set udf noswf
nn <leader>s :w<cr>
nn <leader>S :SudoWrite<cr>

set shcf=-ic
nn <leader>t :te<space>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

nn <leader>a :EasyAlign<space>
vn <leader>a :EasyAlign<space>

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_expand_inside_quotes=1
let g:delimitMate_balance_matchpairs=1
let g:delimitMate_excluded_regions=""

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

set cot+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#auto_complete_start_length=0
let g:deoplete#auto_complete_delay=200
let g:deoplete#sources#latex#include_misc=1
let g:deoplete#sources#jedi#show_docstring=1
au InsertLeave,CompleteDone * if pumvisible()==0 | sil! pc! | endif

let g:ctrlp_map='<leader>h'
let g:ctrlp_cmd='CtrlPMRU'

let g:loaded_netrwPlugin=1
au FileType dirvish cd %
au FileType dirvish nm <buffer> h -
au FileType dirvish nm <buffer> l i
au FileType dirvish nm <buffer> ~ :e $HOME<cr>
nn <leader>e :e .<cr>

let g:rooter_silent_chdir=1
let g:rooter_change_directory_for_non_project_files='current'

let g:python_host_skip_check=1
let g:python3_host_skip_check=1

packl
