set clipboard+=unnamedplus
set completeopt=menuone,preview,noinsert,noselect
set confirm hidden noswapfile undofile
set tabstop=2 shiftwidth=2 expandtab
set number relativenumber list nohlsearch noincsearch smartcase

" replacements

map Y y$
map H ^
map L $
map f //e<left><left>
map t /
map F ?
map T ??e+<left><left><left>

" mappings

let g:mapleader='g'

nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>d :bd<cr>
nmap <leader>D :bd!<cr>
nmap <leader>q :q<cr>
nmap <leader>s :w<cr>
nmap <leader>r q:%s///g<esc>3hi

" cmdwin

nmap <esc> q:k
function! s:cmdwin()
  nmap <buffer> <esc> :q<cr>
endfunction
au CmdwinEnter * call s:cmdwin()

" terminal

nmap <leader>T :te<cr>
tmap <c-v> <c-\><c-n>
function! s:term()
  au TermClose <buffer> bd!
endfunction
au TermOpen * call s:term()

" netrw

let g:netrw_banner=0
let g:netrw_keepdir=0
let g:netrw_list_hide='\.\.\?\/'
nmap <leader>e :e.<cr>
function! s:netrw()
  setl ignorecase smartcase
  nmap <buffer> f /
  nmap <buffer> h -
  nmap <buffer> l <cr>
  nmap <buffer> <esc> :bd<cr>
  nmap <buffer> 0 :e /<cr>
  nmap <buffer> ~ :e $HOME<cr>
endfunction
au FileType netrw call s:netrw()

" plugins

let s:dein_dir='~/.local/share/nvim/site'
let s:dein_cache='~/.cache/dein'
let g:dein#types#git#clone_depth=1
if isdirectory(expand(s:dein_dir))
if dein#load_state(s:dein_cache)
call dein#begin(s:dein_cache)
call dein#add('Shougo/dein.vim', {'rtp': ''})

" interface

call dein#add('jonathanfilip/vim-lucius')

call dein#add('bling/vim-bufferline',
\ {'on_path': '.*',
\  'hook_add':
\    join(['let g:bufferline_echo=0',
\          'let g:bufferline_show_bufnr=0',
\          'let g:bufferline_active_buffer_left=""',
\          'let g:bufferline_active_buffer_right=""'], '|'),
\  'hook_post_source':
\    'let &statusline="%{bufferline#refresh_status()}"'
\      .'.bufferline#get_status_string()'})

call dein#add('moll/vim-bbye',
\ {'hook_add': 'cmap bd Bdelete'})

" utilities

call dein#add('rliang/termedit.nvim')

call dein#add('kassio/neoterm',
\ {'on_cmd': ['Ttoggle'],
\  'hook_add':
\    join(['let g:neoterm_size=10',
\          'let g:neoterm_autoinsert=1',
\          'nmap <leader>t :Ttoggle<cr>'], '|')})

call dein#add('tpope/vim-repeat',
\ {'on_map': {'n': '.'}})

call dein#add('tpope/vim-eunuch',
\ {'on_cmd': ['Remove', 'Move', 'Rename', 'Chmod',
\             'Mkdir', 'SudoWrite', 'SudoRead']})

call dein#add('junegunn/vim-easy-align',
\ {'on_cmd': ['EasyAlign', 'LiveEasyAlign']})

" navigation

call dein#add('dylanaraps/root.vim',
\ {'on_path': '.*',
\  'hook_add':
\    join(['let g:root#auto=1',
\          'let g:root#echo=0'], '|')})

call dein#add('junegunn/fzf',
\ {'lazy': 1, 'build': './install --all'})

call dein#add('junegunn/fzf.vim',
\ {'depends': 'fzf',
\  'on_cmd': ['Files', 'GFiles', 'History', 'Snippets'],
\  'hook_add':
\    join(['nmap <leader>f :Files<cr>',
\          'nmap <leader>F :GFiles<cr>',
\          'nmap <leader>h :History<cr>',
\          'nmap <leader>i :Snippets<cr>'], '|')})

" movement

call dein#add('Lokaltog/vim-easymotion',
\ {'on_map': '<plug>(easymotion',
\  'hook_add':
\    join(['hi! link EasyMotionTarget2Second EasyMotionTarget',
\          'hi! link EasyMotionTarget2First EasyMotionTarget',
\          'let g:EasyMotion_keys="alskdjfh"',
\          'let g:EasyMotion_do_mapping=0',
\          'let g:EasyMotion_do_shade=0',
\          'let g:EasyMotion_smartcase=1',
\          'let g:EasyMotion_use_upper=1',
\          'map <leader>z <plug>(easymotion-s)'], '|')})

call dein#add('terryma/vim-multiple-cursors',
\ {'on_map': {'nv': '<c-n>'}})

call dein#add('tpope/vim-rsi',
\ {'on_map':
\   {'ic': ['<c-a>', '<c-b>', '<c-d>', '<c-e>', '<c-f>', '<c-g>',
\           '<m-bs>', '<m-b>', '<m-b>', '<m-f>', '<m-n>', '<m-p>']}})

call dein#add('tpope/vim-commentary',
\ {'on_map': {'n': 'gcl', 'nxo': 'gc'}})

call dein#add('tpope/vim-surround',
\ {'on_map': {'n': ['ds', 'cs', 'cS', 'ys', 'yS', 'yss', 'ySs', 'ySS'], 'x': ['S', 'gS']}})

call dein#add('PeterRincker/vim-argumentative',
\ {'on_map': {'n': ['>,', '<,'], 'xo': ['i,', 'a,'], 'nxo': ['[,', '],']}})

call dein#add('kana/vim-textobj-user')

call dein#add('zandrmartin/vim-textobj-blanklines',
\ {'on_map': {'xo': ['i<space>', 'a<space>']}})

call dein#add('saihoooooooo/vim-textobj-space',
\ {'on_map': {'xo': ['iS', 'aS']}})

call dein#add('beloglazov/vim-textobj-punctuation',
\ {'on_map': {'xo': ['iu', 'au']}})

call dein#add('kana/vim-textobj-indent',
\ {'on_map': {'xo': ['ii', 'ai', 'iI', 'aI']}})

call dein#add('rhysd/vim-textobj-anyblock',
\ {'on_map': {'vo': ['ib', 'ab']}})

call dein#add('Julian/vim-textobj-variable-segment',
\ {'on_map': {'xo': ['iv', 'av']}})

call dein#add('thalesmello/vim-textobj-methodcall',
\ {'on_map': {'xo': ['im', 'am', 'iM', 'aM']}})

" insertion

call dein#add('Raimondi/delimitMate',
\ {'on_event': 'InsertEnter',
\  'hook_add':
\    join(['let g:delimitMate_expand_cr=1',
\          'let g:delimitMate_expand_space=1',
\          'let g:delimitMate_balance_matchpairs=1'], '|')})

call dein#add('SirVer/ultisnips',
\ {'if': has('python3'), 'on_event': 'InsertEnter', 'on_cmd': 'Snippets'})

call dein#add('honza/vim-snippets',
\ {'depends': 'ultisnips'})

call dein#add('Shougo/deoplete.nvim',
\ {'if': has('python3'), 'on_event': 'InsertEnter',
\  'hook_add':
\    join(['let g:deoplete#enable_at_startup=1',
\          'let g:deoplete#auto_completion_start_length=1',
\          'let g:deoplete#enable_smart_case=1'], '|')})

" languages

call dein#add('sheerun/vim-polyglot')

call dein#add('artur-shaik/vim-javacomplete2',
\ {'if': executable('javac'), 'on_ft': 'java',
\  'hook_add': 'au FileType java setl omnifunc=javacomplete#Complete'})

call dein#add('davidhalter/jedi-vim',
\ {'if': has('python') || has('python3'), 'on_ft': 'python'})
call dein#add('zchee/deoplete-jedi',
\ {'depends': ['deoplete.nvim', 'jedi-vim']})

call dein#add('ternjs/tern_for_vim',
\ {'if': executable('npm'), 'build': 'npm i', 'on_ft': 'javascript',
\  'hook_add': 'let $PATH="node_modules/.bin:".$PATH'})
call dein#add('carlitux/deoplete-ternjs',
\ {'depends': ['deoplete.nvim', 'tern_for_vim']})

call dein#end()
if dein#check_install() | call dein#install() | endif
call dein#save_state()
endif

colorscheme lucius
LuciusWhiteLowContrast

else
exe '!git clone --depth=1 https://github.com/Shougo/dein.vim '.s:dein_dir
endif

filetype plugin indent on
