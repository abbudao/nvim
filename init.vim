let $EDITOR='nvr --remote-wait'

set sw=2 et nowrap cb+=unnamedplus

let g:lucius_contrast='low'
let g:lucius_contrast_bg='high'
au ColorScheme * hi Normal ctermbg=None guibg=None
colo lucius
fu! BufferString()
  let a=map(range(bufnr('$')), {k,v -> fnamemodify(pathshorten(bufname(k + 1)), ':~:.')})
  let a=map(a, {k,v -> getbufvar(k + 1, '&mod') ? v.'+' : v})
  let a=map(a, {k,v -> k + 1 == bufnr('%') ? '【 '.v.' 】' : v})
  retu join(filter(a, {k,v -> bufexists(k + 1) && buflisted(k + 1)}), '  ')
endf
set tgc list ls=1 title titlestring=%{BufferString()}

set ic scs nohls
map f /
map F ?

set cf hid udf noswf
nn <c-f> :bn<cr>
nn <c-b> :bp<cr>
nn gv :vsp<cr>
nn gV :sp<cr>
nn X :Bdelete<cr>
nn Q :q<cr>
nn gs :w<cr>
nn gS :SudoWrite<cr>

nn gd :cd %:h<cr>
nn gh :CtrlPMRU<cr>
nn ge :CtrlPNav<cr>

nn gt :te<cr>
au TermOpen * tno <buffer> <esc> <c-\><c-n>

nn <esc> q:<up>
au CmdwinEnter * nn <buffer> <esc> :q<cr>

nn ga :EasyAlign<space>
xn ga :EasyAlign<space>

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

set cot+=menuone,noinsert,noselect
nn <tab> :pclose!<cr>

ino <expr><c-n> deoplete#manual_complete()
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#ignore_sources={'_': ['member']}
fu! g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete=1
endf
fu! g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete=0
endf

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

let g:loaded_remote_plugins=''
fu! LoadPlugins(paths)
  if !len(a:paths) | return | en
  exe 'pa '.fnamemodify(a:paths[0], ':t')
  cal timer_start(0, {-> LoadPlugins(a:paths[1:])})
endf
fu! LoadRemotePlugins()
  unl g:loaded_remote_plugins
  so $VIM/runtime/plugin/rplugin.vim
  cal timer_start(0, {-> LoadPlugins(glob(fnamemodify($MYVIMRC, ':h').'/pack/*/opt/*', 0, 1))})
endf
cal timer_start(0, {-> LoadRemotePlugins()})
