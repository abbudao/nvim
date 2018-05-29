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
nmap gC <plug>(operator-camelize-toggle)
nn ga :EasyAlign<space>
xn ga :EasyAlign<space>


nn <c-f> :bn<cr>
nn <c-b> :bp<cr>

" macros
fu! s:macro_a()
  nno <silent>q :cal <sid>macro_b()<cr>qq
endf
fu! s:macro_b()
  nno <silent>q q:cal <sid>macro_a()<cr>
endf
cal s:macro_a()

" search/replace
set ignorecase smartcase gdefault inccommand=nosplit
nno gr :%s-
vno gr :s-
nno f /
nno F ?
nno / f
nno ? F
nno * *``
nno # #``
nno gn "sy
vno gn "sy
au textyankpost * if v:event['regname']=='s' | let @/='\V\C'.escape(@s,'\')

" files
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
"
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
nn glt :ALEToggleBuffer<cr>
nn glf :ALEFix<cr>
let g:ale_fixers = {
      \   'javascript': ['eslint','stylelint'],
      \   'python': ['autopep8'],
      \}
let g:ale_linters = {'jsx': ['eslint','stylelint']}
let g:ale_linter_aliases = {'jsx': 'css'}

let $PATH=join(['~/.local/bin', '~/.pub-cache/bin', 'node_modules/.bin', $PATH],':')
let g:LanguageClient_autoStart=1
let g:LanguageClient_loadSettings=1
let g:LanguageClient_serverCommands={}
let g:LanguageClient_serverCommands['c']=['cquery', '--language-server']
let g:LanguageClient_serverCommands['cpp']=['cquery', '--language-server']
let g:LanguageClient_serverCommands['python']=['pyls']
let g:LanguageClient_serverCommands['rust']=['rustup', 'run', 'nightly', 'rls']
let g:LanguageClient_serverCommands['dart']=['dart_language_server']
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
