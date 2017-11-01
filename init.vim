set cb+=unnamedplus
let g:python3_host_prog='python3'

set bg=dark tgc
colo molokai
au colorscheme * hi! normal guibg=None | hi! link signcolumn normal

let g:loaded_matchparen=1
set ls=0 shortmess+=I list nowrap lazyredraw
au vimresized * set ls=2 | cal timer_start(0,{->execute('set ls=0')})

let g:PvOpen={->len(filter(range(winnr('$')),{k->getwinvar(k+1,'&pvw')}))}
nno <expr><esc> PvOpen() ? ":pc!\<cr>" : v:hlsearch ? ":noh\<cr>" : "q:"
au cmdwinenter * nno <buffer><esc> :q<cr>

no c "zc
no Y "zy
map R <plug>(operator-replace)
map _ <plug>(operator-camelize-toggle)
au textyankpost * if v:event['regname']=='z' | let v:hlsearch=1 | redr
au textyankpost * let @/='\V\C'.join(split(escape(@z,'\'),'\n'),'\n')

set ignorecase smartcase gdefault inccommand=nosplit
no ; f
no , F
no F ?\V
no f /\V
ono f /\V/e<left><left>
nno gr :s-
nno gR :%s-

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

let $EDITOR='nvr --remote-wait'
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
nno K :cal LanguageClient_textDocument_hover()<cr>
nno gd :cal LanguageClient_textDocument_definition()<cr>
nno <f1> :cal LanguageClient_textDocument_codeAction()<cr>
nno <f2> :cal LanguageClient_textDocument_rename()<cr>
nno <f3> :cal LanguageClient_textDocument_references()<cr>
nno <f4> :cal LanguageClient_textDocument_documentSymbol()<cr>
nno <f5> :cal LanguageClient_textDocument_workspace_symbol()<cr>
nno <f6> :cal LanguageClient_textDocument_formatting()<cr>
