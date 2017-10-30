let s:lazy=[]
aug lazy | aug END
au lazy SourceCmd * cal add(s:lazy,'so '.expand('<afile>'))
au lazy VimEnter * cal timer_start(0,{->execute(remove(s:lazy,0))},{'repeat':len(s:lazy)})
au lazy VimEnter * au! lazy

set bg=dark tgc
au ColorScheme * hi! Normal guibg=None | hi! SignColumn guibg=None
colo molokai

let g:loaded_matchparen=1
set ls=0 shm+=I list nowrap lazyredraw
au VimResized * set ls=2 | cal timer_start(0,{->execute('set ls=0')})

set cb+=unnamedplus
nn <tab> :noh\|pc!<cr>

set ignorecase smartcase
no f //e<home>
no F ?

set inccommand=nosplit
nn gr :s-
nn gR :%s-
cno <c-l> .*

au TextYankPost * if v:event['regname']=='z' | let @/='\V\C'.escape(@z,'\') | en
fu! s:operate(t)
  cal feedkeys((a:t=='char' ? "`[v`]" : "gv").'"zc','n')
endf
nn c :set opfunc=<sid>operate<cr>g@
vn c :<c-u>cal <sid>operate(visualmode())<cr>

au CmdwinEnter * nn <buffer><esc> :close<cr>
nn <esc> q:<up>

if executable('nvr') | let $EDITOR='nvr --remote-wait' | en
au TermOpen * tno <buffer><esc> <c-\><c-n>
nn gt :term<cr>

set confirm hidden undofile noswapfile
let g:loaded_netrwPlugin=1
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>
nn X :bd<cr>
nn Q :q<cr>
nn gs :w<cr>
nn gd :cd %:h<cr>
nn ge :CtrlPNav<cr>
nn gh :CtrlPMRU<cr>

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
nn <f1> :cal LanguageClient_textDocument_hover()<cr>
nn <f2> :cal LanguageClient_textDocument_definition()<cr>
nn <f3> :cal LanguageClient_textDocument_references()<cr>
nn <f4> :cal LanguageClient_textDocument_rename()<cr>
nn <f5> :cal LanguageClient_textDocument_codeAction()<cr>
nn <f6> :cal LanguageClient_textDocument_formatting()<cr>
