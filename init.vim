set ts=2 sw=2 et cb+=unnamedplus

let g:mapleader='g'

set ls=1 tgc list
colo PaperColor
au ColorScheme * hi! NonText ctermfg=bg guifg=bg
au ColorScheme * hi! link DiffAdd Tag
au ColorScheme * hi! link DiffChange Comment
au ColorScheme * hi! link DiffDelete WarningMsg
au ColorScheme * hi! link SignColumn Normal
nm <leader>C :let &bg=(&bg=='dark'?'light':'dark')<cr>

set nohls
map / <plug>(incsearch-forward)
map ? <plug>(incsearch-backward)
map f <plug>(incsearch-fuzzy-/)
map F <plug>(incsearch-fuzzy-?)

set hid
nm <c-f> :bn<cr>
nm <c-b> :bp<cr>

set cf
nm <leader>w :vsp<cr>
nm X :Bdelete<cr>
nm Q :q<cr>

set udf noswf
nm <leader>s :w<cr>
nm <leader>S :SudoWrite<cr>

nm <esc> q:<up>
au CmdwinEnter * nm <buffer> <esc> :q<cr>

nm <leader>t :bot10sp +te<cr>
nm <leader>T :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>
au TermOpen * au TermClose <buffer> bd!

nm <leader>a :EasyAlign<space>
vm <leader>a :EasyAlign<space>

nm <leader>Q :Neoformat<cr>
vm <leader>Q :Neoformat<cr>

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
au CompleteDone *.* pc!

let g:ctrlp_map='<leader>h'
let g:ctrlp_cmd='CtrlPMRU'

let g:loaded_netrwPlugin=1
au FileType dirvish cd %
au FileType dirvish nm <buffer> h -
au FileType dirvish nm <buffer> l i
au FileType dirvish nm <buffer> ~ :e $HOME<cr>
nm <leader>e :e .<cr>

let g:rooter_silent_chdir=1
let g:rooter_change_directory_for_non_project_files='current'

let g:python_host_skip_check=1
let g:python3_host_skip_check=1
if !has('python') && executable('pip2')
  exe '!pip2 install --user neovim'
endif
if !has('python3') && executable('pip3')
  exe '!pip3 install --user neovim'
endif
packl
