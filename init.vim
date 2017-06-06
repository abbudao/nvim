let g:mapleader='g'

set cb+=unnamedplus

set ts=2 sw=2 et

set ls=1 title sc ru list

set bg=dark tgc
au VimEnter * colo one | hi Normal guibg=None ctermbg=None
let g:bufferline_show_bufnr=0

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

let g:ctrlp_map='<leader>h'
let g:ctrlp_cmd='CtrlPMRU'

let g:loaded_netrwPlugin=1
au FileType dirvish cd % | nm <buffer> h - | nm <buffer> l i | nm <buffer> ~ :e $HOME<cr>
nn <leader>e :e .<cr>

let g:rooter_silent_chdir=1
let g:rooter_change_directory_for_non_project_files='current'
let g:rooter_patterns=['.git/', 'Makefile', 'CMakeLists.txt', 'setup.py', 'node_modules', 'pom.xml']

let g:python_host_skip_check=1
let g:python3_host_skip_check=1

set cot+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_start_length=1
let g:deoplete#ignore_sources={'_': ['member', 'buffer']}
let g:deoplete#omni_patterns={'java': '[^. *\t]\.\w*'}
nn <tab> :pclose!<cr>

packl
