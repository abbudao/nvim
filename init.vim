" providers
set cb+=unnamedplus
let g:python3_host_prog='python3'

" colors
set bg=dark tgc
au colorscheme * hi! normal guibg=None | hi! link signcolumn normal
colo molokai

" interface
let g:loaded_matchparen=1
set ls=0 shortmess+=cI list nowrap lazyredraw
au vimresized * cal timer_start(0,{->execute('mod')})

" escape
nno <expr><esc>
      \ len(filter(range(winnr('$')),{k->getwinvar(k+1,'&pvw')})) ? ":pc!\<cr>"
      \ : &hlsearch && v:hlsearch ? ":noh\<cr>"
      \ : len(getcmdwintype()) ? ":q\<cr>"
      \ : ":norm q\<cr>q:k"

" operators
map R <plug>(operator-replace)
map - <plug>(operator-camelize-toggle)

" search
set ignorecase smartcase gdefault inccommand=nosplit
nno gr :%s-
vno gr :s-
map f <plug>(macrosearch-/)
map F <plug>(macrosearch-?)
ono f /\V/e<left><left>
ono F ?\V?e<left><left>
no ; f
no , F

" buffers
set confirm hidden undofile noswapfile wig+=./,../
let g:loaded_netrwPlugin=1
nno <c-j> :bn<cr>
nno <c-k> :bp<cr>
nno X :bd<cr>
nno Q :q<cr>
nno gs :w<cr>
nno gd :cd %:h<cr>
nno gh :cal compick#do('mru')<cr>
nno gf :cal compick#do('cwd')<cr>
au filetype compick-cwd ino <buffer><c-u> <esc>:cal compick#accept('..')<cr>
au bufenter * if isdirectory(expand('%')) | cd % | bd! | cal compick#do('cwd') | en

" terminal
let $EDITOR='nvr --remote-wait'
nno gt :te<cr>:tno <buffer><lt>esc> <lt>c-\><lt>c-n><cr>i

"completion
set completeopt+=menuone,noinsert,noselect
let g:deoplete#enable_at_startup=1
let g:deoplete#ignore_sources={}
ino <expr><c-space> deoplete#manual_complete()

"languages
let g:LanguageClient_autoStart=1
let g:LanguageClient_serverCommands={}
fu! s:lsp_ft()
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
fu! s:lsp(ft,cmd)
  let g:LanguageClient_serverCommands[a:ft]=a:cmd
  exe 'au filetype' a:ft 'cal s:lsp_ft()'
  let g:deoplete#ignore_sources[a:ft]=['member']
endf
cal s:lsp('c',['clangd'])
cal s:lsp('cpp',['clangd'])
cal s:lsp('python',['pyls'])
cal s:lsp('javascript.jsx',['javascript-typescript-stdio'])
cal s:lsp('rust',['rustup', 'run', 'nightly', 'rls'])
cal s:lsp('dart',[join([$HOME,'.pub-cache','bin','dart_language_server'],'/')])
