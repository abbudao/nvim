let $EDITOR='nvr --remote-wait'

set ts=2 sw=2 et

set cb+=unnamedplus

fu! BufferString()
  let a=map(range(bufnr('$')), {k,v -> fnamemodify(pathshorten(bufname(k + 1)), ':~:.')})
  let a=map(a, {k,v -> getbufvar(k + 1, '&mod') ? v.'+' : v})
  let a=map(a, {k,v -> k + 1 == bufnr('%') ? '[ '.v.' ]' : v})
  retu join(filter(a, {k,v -> bufexists(k + 1) && buflisted(k + 1)}), '  ')
endf
set list ls=1 title titlestring=%{BufferString()}

set tgc
let g:lucius_contrast='low'
let g:lucius_contrast_bg='high'
au ColorScheme * hi Normal ctermbg=None guibg=None
colo lucius

let g:mapleader='g'

set ic scs nohls
map f /
map F ?

set hid
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>

set cf
nn <leader>v :vsp<cr>
nn <leader>V :sp<cr>
nn X :Bdelete<cr>
nn Q :q<cr>

set udf noswf
nn <leader>s :w<cr>
nn <leader>S :SudoWrite<cr>

nn <leader>t :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

nn <leader>a :EasyAlign<space>
vn <leader>a :EasyAlign<space>

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

nn <leader>d :cd %:h<cr>
nn <leader>e :CtrlPNav<cr>
nn <leader>h :CtrlPMRU<cr>

set cot+=menuone,noinsert,noselect
nn <tab> :pclose!<cr>

au FileType java setl ofu=javacomplete#Complete
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_start_length=0
let g:deoplete#omni_patterns={'java': '[^. *\t]\.\w*'}
fu! Multiple_cursors_before()
  cal deoplete#disable()
endf
fu! Multiple_cursors_after()
  cal deoplete#enable()
endf

au VimEnter * set cfu=LanguageClient#complete
let g:LanguageClient_autoStart=1
let g:LanguageClient_signColumnAlwaysOn=0
let g:LanguageClient_serverCommands={}
let g:LanguageClient_serverCommands['c']=['clangd']
let g:LanguageClient_serverCommands['cpp']=['clangd']
let g:LanguageClient_serverCommands['python']=['pyls']
let g:LanguageClient_serverCommands['javascript']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['javascript.jsx']=['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['rust']=['rustup', 'run', 'nightly', 'rls']
