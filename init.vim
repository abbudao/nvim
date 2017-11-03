"providers
set cb+=unnamedplus
let g:python3_host_prog='python3'

"colors
set bg=dark tgc
colo molokai
au colorscheme * hi! normal guibg=None | hi! link signcolumn normal

"interface
let g:loaded_matchparen=1
set ls=0 shortmess+=I list nowrap lazyredraw
au vimresized * set ls=2 | cal timer_start(1,{->execute('set ls=0')})

"operators
map R <plug>(operator-replace)
map _ <plug>(operator-camelize-toggle)

"escape
let PvOpen={->len(filter(range(winnr('$')),{k->getwinvar(k+1,'&pvw')}))}
let CwOpen={->len(getcmdwintype())}
nno <expr><esc> PvOpen() ? ":pc!\<cr>" : v:hlsearch ? ":noh\<cr>" : CwOpen() ? ":q\<cr>" : "q:"

"search
set ignorecase smartcase gdefault inccommand=nosplit
nmap f /
nmap F ?
no ; f
no , F
ono f /\V/e<left><left>
nno gr :%s-

"buffers
set confirm hidden undofile noswapfile
let g:loaded_netrwPlugin=1
nno <c-f> :bn<cr>
nno <c-b> :bp<cr>
nno X :bd<cr>
nno Q :q<cr>
nno gs :w<cr>
nno gd :cd %:h<cr>
nno ge :CtrlPNav<cr>
nno gf :CtrlPRoot<cr>
nno gh :CtrlPMRU<cr>

"terminal
let $EDITOR='nvr --remote-wait'
nno gt :term<cr>
tno <esc> <c-\><c-n>

"completion
set completeopt+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
ino <expr><c-n> deoplete#manual_complete()

"languages
let g:LanguageClient_autoStart=1
let g:LanguageClient_serverCommands={}
let g:LanguageClient_serverCommands['c']=['clangd']
let g:LanguageClient_serverCommands['cpp']=['clangd']
let g:LanguageClient_serverCommands['python']=['pyls']
let g:LanguageClient_serverCommands['javascript']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['javascript.jsx']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['rust']=['rustup', 'run', 'nightly', 'rls']
nno K :cal LanguageClient_textDocument_hover()<cr>
nno gD :cal LanguageClient_textDocument_definition()<cr>
nno <f1> :cal LanguageClient_textDocument_codeAction()<cr>
nno <f2> :cal LanguageClient_textDocument_rename()<cr>
nno <f3> :cal LanguageClient_textDocument_references()<cr>
nno <f4> :cal LanguageClient_textDocument_documentSymbol()<cr>
nno <f5> :cal LanguageClient_textDocument_workspace_symbol()<cr>
nno <f6> :cal LanguageClient_textDocument_formatting()<cr>
