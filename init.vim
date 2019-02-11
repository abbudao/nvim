" external
let $EDITOR='nvr --remote-wait'
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'
set cb+=unnamedplus
set relativenumber
set runtimepath+=~/.config/snippets/

" interface
set tgc ls=0 shm+=cI list nowrap lazyredraw
au vimresized * cal timer_start(0,{->execute('mod')})
au colorscheme * hi! normal guibg=none | hi! link signcolumn normal
let g:airline_theme='papercolor'
colorscheme pencil

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
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

"tests
let test#strategy = "dispatch"
nno <buffer><f6> :TestFile<CR>
nno <buffer><f7>  :TestSuite<CR>
""" languages
"ale
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
nn glt :ALEToggleBuffer<cr>
nn glf :ALEFix<cr>
let g:ale_fixers = {
      \   'javascript': ['prettier','stylelint','eslint'],
      \   'json':['fixjson'],
      \   'python': ['autopep8'],
      \   'css': ['prettier'],
      \   'yaml': ['prettier'],
      \   'go': ['gofmt'],
      \}

let g:ale_linters = {'jsx': ['prettier','stylelint', 'eslint'], 'json':['jsonlint']}
let g:ale_linter_aliases = {'jsx': 'css'}

"go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
let g:go_addtags_transform = "snakecase"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
