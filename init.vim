" basic options

set hidden confirm undofile noswapfile
set termguicolors laststatus=1 number relativenumber nohlsearch list
set expandtab tabstop=2 shiftwidth=2 completeopt+=menuone,noinsert,noselect
set clipboard+=unnamedplus
au CompleteDone * pclose!

" basic mappings

let g:mapleader='g'

nm <c-f> :bn<cr>
nm <c-b> :bp<cr>
nm <leader>s :w<cr>
nm <leader>e :e .<cr>
nm Q :q<cr>

nm <esc> :<c-f><up>
au CmdwinEnter * nm <buffer> <esc> :q<cr>

nm <leader>t :bot10sp +te<cr>
au TermOpen * tm <buffer> <esc> <c-\><c-n>
au TermOpen * au TermClose <buffer> bd!

" plugin manager

let s:conf_dir=expand('<sfile>:h')
let s:dein_repo='github.com/Shougo/dein.vim'
let g:dein_dir=s:conf_dir.'/repos/'.s:dein_repo
if !isdirectory(g:dein_dir) && executable('git')
  exe '!mkdir -p '.g:dein_dir
  exe '!git clone --depth=1 https://'.s:dein_repo.' '.g:dein_dir
endif
let &rtp.=','.g:dein_dir

" plugins

let g:python3_host_skip_check=1
let g:dein#types#git#clone_depth=1
if dein#load_state(s:conf_dir)
  if !has('python3') && executable('pip3')
    exec '!pip3 install --user neovim'
  endif
  call dein#begin(s:conf_dir)
  call dein#load_toml(s:conf_dir.'/plugins.toml')
  call dein#end()
  if dein#check_install()
    call dein#install()
  endif
  call dein#remote_plugins()
  call dein#save_state()
endif

filetype plugin indent on
