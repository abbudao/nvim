pa asyncpack.vim
au User asyncpack set clipboard+=unnamedplus

set bg=dark list nowrap shortmess+=I laststatus=1
let g:lucius_no_term_bg=1 | au User asyncpack:vim-lucius colo lucius

set nohlsearch
no f /
no F ?

set confirm hidden undofile noswapfile
let g:loaded_netrwPlugin=1
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>
nn X :bd<cr>
nn Q :q<cr>
nn gs :w<cr>
nn gd :cd %:h<cr>
nn gh :CtrlPMRU<cr>
nn ge :CtrlPNav<cr>

let $EDITOR='nvr --remote-wait'
nn gt :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

set completeopt+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
let g:deoplete#ignore_sources={'_': ['member']}
au User MultipleCursorsPre let g:deoplete#disable_auto_complete=1
au User MultipleCursorsPost let g:deoplete#disable_auto_complete=0
nn <tab> :pclose!<cr>
ino <expr><c-n> deoplete#manual_complete()

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
