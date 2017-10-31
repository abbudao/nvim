set cb+=unnamedplus
let g:python3_host_prog='python3'

set bg=dark tgc
au colorscheme * hi! normal guibg=None | hi! link signcolumn normal
colo molokai

let g:loaded_matchparen=1
set laststatus=0 shortmess+=I list nowrap lazyredraw
au vimresized * set ls=2 | cal timer_start(0,{->execute('set ls=0')})

let Pvw={->len(filter(range(winnr('$')),{k->getwinvar(k+1,'&pvw')}))}
let Cdw={->len(getcmdwintype())}
nno <expr><esc> Pvw() ? ":pc\<cr>" : v:hlsearch ? ":noh\<cr>" : Cdw() ? ":q\<cr>" : "q:"

nor ; f
nor , F
nor F ?
nor f /
ono f //e<home>
map c <plug>(sad-change-forward)
map R <plug>(operator-replace)
map H <plug>(operator-jump-head-out)
map L <plug>(operator-jump-tail-out)
map + <plug>(operator-assign)
map _ <plug>(operator-camelize-toggle)

set ignorecase smartcase gdefault inccommand=nosplit
nno gr :s-
nno gR :%s-
cno <c-o> .*
cno <c-x> \<\><left><left>

set confirm hidden undofile noswapfile
let g:loaded_netrwPlugin=1
nno <c-f> :bn<cr>
nno <c-b> :bp<cr>
nno X :bd<cr>
nno Q :q<cr>
nno gs :w<cr>
nno gd :cd %:h<cr>
nno ge :CtrlPNav<cr>
nno gh :CtrlPMRU<cr>

if executable('nvr') | let $EDITOR='nvr --remote-wait' | en
nno gt :term<cr>
tno <esc> <c-\><c-n>

set completeopt+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
ino <expr><c-n> deoplete#manual_complete()

let g:LanguageClient_autoStart=1
let g:LanguageClient_serverCommands={}
let g:LanguageClient_serverCommands['c']=['clangd']
let g:LanguageClient_serverCommands['cpp']=['clangd']
let g:LanguageClient_serverCommands['python']=['pyls']
let g:LanguageClient_serverCommands['javascript']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['javascript.jsx']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['rust']=['rustup', 'run', 'nightly', 'rls']
nno <f1> :cal LanguageClient_textDocument_hover()<cr>
nno <f2> :cal LanguageClient_textDocument_definition()<cr>
nno <f3> :cal LanguageClient_textDocument_references()<cr>
nno <f4> :cal LanguageClient_textDocument_rename()<cr>
nno <f5> :cal LanguageClient_textDocument_codeAction()<cr>
nno <f6> :cal LanguageClient_textDocument_formatting()<cr>
