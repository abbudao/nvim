let s:cmds=[]
aug deferred
  au SourceCmd * cal add(s:cmds, 'so '.expand('<afile>'))
  au VimEnter * cal timer_start(0, {-> execute(remove(s:cmds, 0))}, {'repeat': len(s:cmds)})
  au VimEnter * au! deferred
aug END

let g:loaded_matchparen=1
set bg=dark tgc list nowrap laststatus=1 shortmess+=I
au ColorScheme * hi! Normal guibg=None | hi! SignColumn guibg=None
colo molokai

set cb+=unnamedplus
nn <silent> <tab> :noh\|pclose!<cr>
au TextChanged,InsertLeave * if len(@*)>1 | let @/='\V'.escape(@*,'\') | en

set ignorecase smartcase inccommand=nosplit
cno <c-y> .*
no f //e<home>
no F ?
xn gw :s-
nn gW :%s-

let $EDITOR='nvr --remote-wait'
nn gt :term<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

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

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :close<cr>

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
