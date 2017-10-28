let s:lazy=[]
aug lazy
  au SourceCmd * cal add(s:lazy, 'so '.expand('<afile>'))
  au VimEnter * cal timer_start(0, {-> execute(remove(s:lazy, 0))}, {'repeat': len(s:lazy)})
  au VimEnter * au! lazy
aug END

set bg=dark tgc
au ColorScheme * hi! Normal guibg=None | hi! SignColumn guibg=None
colo molokai

let g:loaded_matchparen=1
set ls=0 shm+=I list nowrap lazyredraw
au VimResized * set ls=2 | cal timer_start(0, {-> execute('set ls=0')})

set cb+=unnamedplus
au TextChanged,InsertLeave * if len(@")>1 | let @/='\V'.escape(@",'\') | en
nn <silent> <tab> :noh\|pc!<cr>

set ignorecase smartcase inccommand=nosplit
cno <c-y> .*
no f //e<home>
no F ?
xn gw :s-
nn gW :%s-

if executable('nvr') | let $EDITOR='nvr --remote-wait' | en
au TermOpen * tno <buffer> <esc> <c-\><c-n>
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

au CmdwinEnter * nn <buffer> <esc> :close<cr>
nn <esc> q:<up>

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
nn K :call LanguageClient_textDocument_hover()<cr>
nn gD :call LanguageClient_textDocument_definition()<cr>
nn gR :call LanguageClient_textDocument_rename()<cr>
