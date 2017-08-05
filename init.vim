let $EDITOR='nvr'

let g:mapleader='g'

set cb+=unnamedplus

set ts=2 sw=2 et

fu! BufferString()
  retu join(map(filter(range(1, bufnr('$')), 'bufexists(v:val) && buflisted(v:val)'), 'join(v:val == bufnr("%") ? ["[ ", " ]"] : [" ", " "], fnamemodify(bufname(v:val), ":t"))'), " ")
endf
set list ls=1 title titlestring=%{BufferString()}

set tgc bg=dark
au VimEnter * colo one | hi Normal ctermbg=None guibg=None

set ic scs nohls
map f /
map F ?

set hid
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>

set cf
nn <leader>v :vsp<cr>
nn <leader>V :sp<cr>
nn X :Bdelete<cr>
nn Q :q<cr>

set udf noswf
nn <leader>s :w<cr>
nn <leader>S :SudoWrite<cr>

nn <leader>t :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

nn <leader>a :EasyAlign<space>
vn <leader>a :EasyAlign<space>

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:ctrlp_cmd='CtrlPMRU'
let g:ctrlp_map='<leader>h'
let g:ctrlp_working_path_mode=0
fu! NavInit()
  retu filter(glob('{,.}*', 1, 1, 1), 'v:val != "./"')
endf
fu! NavAccept(mode, str)
  if isdirectory(a:str)
    exe 'cd '.a:str
    cal ctrlp#exit()
    cal ctrlp#init(g:ctrlp_builtins + len(g:ctrlp_ext_vars))
  el
    cal ctrlp#acceptfile(a:mode, a:str)
  en
endf
au VimEnter * let g:ctrlp_ext_vars=[{'init': 'NavInit()', 'accept': 'NavAccept', 'lname': 'nav', 'sname': 'nav', 'type': 'file'}]
nn <leader>e :cal ctrlp#init(g:ctrlp_builtins + len(g:ctrlp_ext_vars))<cr>
nn <leader>d :cd %:h<cr>

let g:rooter_silent_chdir=1
let g:rooter_change_directory_for_non_project_files='current'

set cot+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_start_length=0
let g:deoplete#omni_patterns={'java': '[^. *\t]\.\w*'}
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/include/clang'
let g:deoplete#sources#rust#rust_source_path=$HOME.'/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#racer_binary=$HOME.'/.cargo/bin/racer'
nn <tab> :pclose!<cr>

fu! Multiple_cursors_before()
  call deoplete#disable()
endf
fu! Multiple_cursors_after()
  call deoplete#enable()
endf
