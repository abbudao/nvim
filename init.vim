let s:lazy=[]
aug lazy | aug end
au lazy sourcecmd * cal add(s:lazy,'so '.expand('<afile>'))
au lazy vimenter * cal timer_start(0,{->execute(remove(s:lazy,0))},{'repeat':len(s:lazy)})
au lazy vimenter * au! lazy

set bg=dark tgc
au colorscheme * hi! normal guibg=None | hi! signcolumn guibg=None
colo molokai

let g:loaded_matchparen=1
set ls=0 shm+=I list nowrap lazyredraw
au vimresized * set ls=2 | cal timer_start(0,{->execute('set ls=0')})

set cb+=unnamedplus
nno <tab> :noh\|pc!<cr>

map c <plug>(sad-change-forward)
map [ <plug>(operator-jump-head)
map ] <plug>(operator-jump-tail)
map R <plug>(operator-replace)
map ga <plug>(operator-assign)
map gz <plug>(operator-camelize-toggle)
map sa <plug>(operator-surround-append)
map sd <plug>(operator-surround-delete)
map sr <plug>(operator-surround-replace)

set ignorecase smartcase inccommand=nosplit
nor F ?
nor f /
ono f //e<home>
nno gr :s-
nno gR :%s-

au cmdwinenter * nno <buffer><esc> :close<cr>
nno <esc> q:<up>

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
au termopen * tno <buffer><esc> <c-\><c-n>
nno gt :term<cr>

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
