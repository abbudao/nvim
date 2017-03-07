set ts=2 sw=2 et cb+=unnamedplus

set ls=1 tgc list
colo PaperColor
au ColorScheme * hi! NonText ctermfg=bg guifg=bg
au ColorScheme * hi! link DiffAdd Tag
au ColorScheme * hi! link DiffChange Comment
au ColorScheme * hi! link DiffDelete WarningMsg
au ColorScheme * hi! link SignColumn Normal
com! Cinv :let &bg=(&bg == 'dark' ? 'light' : 'dark')

let g:mapleader='g'

set nohls
map f <plug>(incsearch-fuzzy-/)
map F <plug>(incsearch-fuzzy-?)

set hid
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>

set cf
nn X :Bdelete<cr>
nn Q :q<cr>

set udf noswf
nn <leader>s :w<cr>
nn <leader>S :SudoWrite<cr>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

nn <leader>t :bot10sp +te<cr>
nn <leader>T :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>
au TermOpen * au TermClose <buffer> bd!

nn <leader>a :EasyAlign<space>
vn <leader>a :EasyAlign<space>

nn <leader>Q :Neoformat<cr>
vn <leader>Q :Neoformat<cr>

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
let g:deoplete#sources#latex#include_misc=1
let g:deoplete#sources#jedi#show_docstring=1
au CompleteDone * pc!

let g:rooter_silent_chdir=1
let g:rooter_change_directory_for_non_project_files='current'

let g:ctrlp_map='<leader>h'
let g:ctrlp_cmd='CtrlPMRUF'
let g:ctrlp_types=['mru']
au VimEnter * let g:ctrlp_ext_vars=[{
      \ 'init':  'glob("{,.}*", 1, 1)', 'accept': 'Navigate',
      \ 'lname': 'navigate', 'sname': 'nav', 'type': 'path'
      \ }]
fu! Navigate(mode, str)
  cal ctrlp#exit()
  if isdirectory(a:str)
    exe join(['cd', a:str], ' ')
    cal ctrlp#init(1, {'dir': getcwd()})
  else
    cal ctrlp#acceptfile(a:mode, a:str)
  end
endf

let g:python_host_skip_check=1
let g:python3_host_skip_check=1
if !has('python') && executable('pip2')
  exe '!pip2 install --user neovim'
endif
if !has('python3') && executable('pip3')
  exe '!pip3 install --user neovim'
endif
packl
