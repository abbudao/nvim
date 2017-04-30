let g:mapleader='g'

set cb+=unnamedplus

set ts=2 sw=2 et

set ls=1 title sc ru list

set bg=dark tgc
au ColorScheme * hi Normal guibg=None ctermbg=None
colo lucius
let g:bufferline_show_bufnr=0

fu! TextObjBeg(...)
  norm! `[
endf
fu! TextObjEnd(...)
  norm! `]
endf
nn <silent> [a :set opfunc=TextObjBeg<cr>g@a
nn <silent> ]a :set opfunc=TextObjEnd<cr>g@a

set ic scs nohls
map f /
map F ?

set hid
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>

set cf
nn <leader>v :vsp<cr>
nn X :Bdelete<cr>
nn Q :q<cr>

set udf noswf
nn <leader>s :w<cr>
nn <leader>S :SudoWrite<cr>

let g:neoterm_size=10
let g:neoterm_keep_term_open=0
nn <leader>t :T<space>
nn <leader>T :Tclose<cr>
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

let g:ctrlp_map='<leader>h'
let g:ctrlp_cmd='CtrlPMRU'

let g:loaded_netrwPlugin=1
au FileType dirvish cd % | nm <buffer> h - | nm <buffer> l i | nm <buffer> ~ :e $HOME<cr>
nn <leader>e :e .<cr>

let g:rooter_silent_chdir=1
let g:rooter_change_directory_for_non_project_files='current'

let g:python_host_skip_check=1
let g:python3_host_skip_check=1

packl
