pa! asyncpack.vim
let $EDITOR='nvr --remote-wait'
set clipboard+=unnamedplus

au User asyncpack:vim-lucius set bg=dark | let g:lucius_no_term_bg=1 | colo lucius
fu! BufferString()
  let s=map(range(bufnr('$')), {k,v -> fnamemodify(pathshorten(bufname(k + 1)), ':~:.')})
  let s=map(s, {k,v -> getbufvar(k + 1, '&mod') ? v.'+' : v})
  let s=map(s, {k,v -> k + 1 == bufnr('%') ? '【 '.v.' 】' : v})
  retu join(filter(s, {k,v -> bufexists(k + 1) && buflisted(k + 1)}), '  ')
endf
set list nowrap shortmess+=I laststatus=1 title titlestring=%{BufferString()}

set nohlsearch
no f /
no F ?

set confirm hidden undofile noswapfile
let g:loaded_netrwPlugin=1
let g:ctrlp_match_window='results:0'
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>
nn gv :vsp<cr>
nn gV :sp<cr>
nn X :Bdelete<cr>
nn Q :q<cr>
nn gs :w<cr>
nn gS :SudoWrite<cr>
nn gd :cd %:h<cr>
nn gh :CtrlPMRU<cr>
nn ge :CtrlPNav<cr>

nn gt :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

nn ga :EasyAlign<space>
xn ga :EasyAlign<space>

set completeopt+=menuone,noinsert,noselect
nn <tab> :pclose!<cr>

ino <expr><c-n> deoplete#manual_complete()
let g:deoplete#enable_at_startup=1
let g:deoplete#ignore_sources={'_': ['member']}
au User MultipleCursorsPre let g:deoplete#disable_auto_complete=1
au User MultipleCursorsPost let g:deoplete#disable_auto_complete=0

let g:LanguageClient_autoStart=1
let g:LanguageClient_serverCommands={}
let g:LanguageClient_serverCommands['c']=['clangd']
let g:LanguageClient_serverCommands['cpp']=['clangd']
let g:LanguageClient_serverCommands['python']=['pyls']
let g:LanguageClient_serverCommands['javascript']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['javascript.jsx']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['rust']=['rustup', 'run', 'nightly', 'rls']
nn K :call LanguageClient_textDocument_hover()<cr>
nn gk :call LanguageClient_textDocument_definition()<cr>
nn gr :call LanguageClient_textDocument_rename()<cr>
