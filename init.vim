" external
let $EDITOR='nvr --remote-wait'
let g:python3_host_prog='python3'
set cb+=unnamedplus

" interface
set tgc ls=0 shm+=cI list nowrap lazyredraw
colo pencil
au vimresized * cal timer_start(0,{->execute('mod')})
au colorscheme * hi! normal guibg=none | hi! link signcolumn normal

" miscellaneous
nno <expr><esc>
\ len(filter(range(winnr('$')),{k->getwinvar(k+1,'&pvw')})) ? ":pc!\<cr>"
\ : &hlsearch && v:hlsearch ? ":noh\<cr>"
\ : len(getcmdwintype()) ? ":q\<cr>"
\ : ":norm! q\<cr>q:k"
nno gt :ter<cr>:tno <buffer><lt>esc> <lt>c-\><lt>c-n><cr>i

" search/replace
set ignorecase smartcase gdefault inccommand=nosplit
nno gr :%s-
vno gr :s-
nno / f
nno ? F
nno f /
nno F ?
nno q :sil! cal repeat#invalidate()<bar>norm! q<cr>qe
nno n :cal repeat#set('@e',1)<bar>norm! q<cr>n
nno N :cal repeat#set('@e',1)<bar>norm! q<cr>N
nno gn "ey
vno gn "ey
au textyankpost * if v:event['regname']=='e' | let @/='\V\C'.escape(@e,'\')

" buffers
let g:loaded_netrwPlugin=1
set confirm hidden undofile noswapfile shada='1000,:1000 wig+=./,../
nno <c-j> :bn<cr>
nno <c-k> :bp<cr>
nno X :bd<cr>
nno Q :q<cr>
nno gs :w<cr>
nno gd :cd %:h<cr>
nno gh :cal compick#do('mru')<cr>
nno gf :cal compick#do('cwd')<cr>
au filetype compick-cwd ino <buffer><silent><c-u> <esc>:cal compick#accept(['..'])<cr>
au bufenter * if isdirectory(expand('%')) | cd % | bd! | cal compick#do('cwd') | en

" completion
set cot+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
let g:deoplete#ignore_sources={'_':['member']}
ino <expr><c-space> deoplete#manual_complete()

" languages
let g:LanguageClient_autoStart=1
let g:LanguageClient_serverCommands={}
let g:LanguageClient_serverCommands['c']=['clangd']
let g:LanguageClient_serverCommands['cpp']=['clangd']
let g:LanguageClient_serverCommands['python']=['pyls']
let g:LanguageClient_serverCommands['javascript.jsx']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['rust']=['rustup', 'run', 'nightly', 'rls']
let g:LanguageClient_serverCommands['dart']=join([$HOME,'.pub-cache','bin','dart_language_server'],'/')
fu! s:lsp_setup()
  nno <buffer>K :cal LanguageClient_textDocument_hover()<cr>
  nno <buffer>gD :cal LanguageClient_textDocument_definition()<cr>
  nno <buffer>gQ :cal LanguageClient_textDocument_formatting()<cr>
  vno <buffer>gq :cal LanguageClient_textDocument_rangeFormatting()<cr>
  nno <buffer><f1> :cal LanguageClient_textDocument_codeAction()<cr>
  nno <buffer><f2> :cal LanguageClient_textDocument_rename()<cr>
  nno <buffer><f3> :cal LanguageClient_textDocument_references()<cr>
  nno <buffer><f4> :cal LanguageClient_textDocument_documentSymbol()<cr>
  nno <buffer><f5> :cal LanguageClient_workspace_symbol()<cr>
endf
exe 'au filetype' join(keys(g:LanguageClient_serverCommands),',') 'cal s:lsp_setup()'
