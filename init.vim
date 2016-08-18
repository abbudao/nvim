set clipboard+=unnamedplus
set completeopt=menuone,preview,noinsert,noselect
set confirm hidden noswapfile undofile
set tabstop=2 shiftwidth=2 expandtab
set number relativenumber list
set nohlsearch ignorecase smartcase

" mappings

let g:mapleader='g'

nm <leader>n :bn<cr>
nm <leader>p :bp<cr>
nm <leader>q :q<cr>
nm <leader>s :w<cr>
nm <leader>r :%s///g<left><left><left>
vm <leader>r :s///g<left><left><left>

nm <esc> :<c-f><up>
au CmdwinEnter * nm <buffer> <esc> :q<cr>

nm <leader>t :term<cr>
au TermOpen * tm <buffer> <esc> <c-\><c-n>
au TermOpen * au TermClose <buffer> bd!

" manager

let s:conf_dir=expand('<sfile>:h')
let s:dein_dir=s:conf_dir.'/repos/github.com/Shougo/dein.vim'
let &rtp.=','.s:dein_dir
if !isdirectory(s:dein_dir)
exe '!mkdir -p '.s:dein_dir
exe '!git clone --depth=1 https://github.com/Shougo/dein.vim '.s:dein_dir
endif

" plugins

let g:dein#types#git#clone_depth=1
if dein#load_state(s:conf_dir)
call dein#begin(s:conf_dir)
call dein#add('Shougo/dein.vim', {'rtp': ''})

" interface

call dein#add('jonathanfilip/vim-lucius')

call dein#add('bling/vim-bufferline',
\ {'on_event': 'BufRead',
\  'hook_add':
\    join(['let g:bufferline_echo=0',
\          'let g:bufferline_show_bufnr=0',
\          'let g:bufferline_active_buffer_left=""',
\          'let g:bufferline_active_buffer_right=""'], '|'),
\  'hook_post_source':
\    'let &statusline="%{bufferline#refresh_status()}".bufferline#get_status_string()'})

" utilities

call dein#add('rliang/termedit.nvim')

call dein#add('kana/vim-repeat',
\ {'on_map': {'n': ['.', 'u', 'U', '<c-r>', 'g-', 'g+']}})

call dein#add('tpope/vim-eunuch',
\ {'on_cmd': ['Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'SudoWrite', 'SudoRead']})

call dein#add('moll/vim-bbye',
\ {'on_cmd': 'Bdelete',
\  'hook_add': 'nmap <leader>d :Bdelete<cr>'})

call dein#add('mbbill/undotree',
\ {'on_cmd': 'UndotreeToggle',
\  'hook_add': 'nm <leader>u :UndotreeToggle<cr>'})

call dein#add('junegunn/vim-easy-align',
\ {'on_cmd': ['EasyAlign', 'LiveEasyAlign']})

" navigation

call dein#add('dylanaraps/root.vim',
\ {'on_event': 'BufRead',
\  'hook_add':
\    join(['let g:root#auto=1',
\          'let g:root#echo=0'], '|')})

call dein#add('ctrlpvim/ctrlp.vim',
\ {'on_cmd': 'CtrlPMRU',
\  'hook_add': 'nm <leader>h :CtrlPMRU<cr>'})

call dein#add('justinmk/vim-dirvish',
\ {'on_cmd': 'Dirvish',
\  'hook_add':
\    join(['let g:loaded_netrwPlugin=1',
\          'nm <leader>e :e .<cr>',
\          'au FileType dirvish cd %',
\            'nm <buffer> h -',
\            'nm <buffer> l <cr>',
\            'nm <buffer> ~ :e ~<cr>'], '|')})

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
\          'map s <plug>(easymotion-s)'], '|')})

call dein#add('haya14busa/incsearch.vim',
\ {'on_map': '<plug>(incsearch',
\  'hook_add':
\    join(['map f <plug>(incsearch-forward)',
\          'map F <plug>(incsearch-backward)'], '|')})

call dein#add('terryma/vim-multiple-cursors',
\ {'on_map': {'nv': ['<c-n>', '<c-f>']},
\  'hook_add': 'let g:multi_cursor_start_key="<c-f>"'})

call dein#add('tpope/vim-rsi',
\ {'on_map': {'ic': ['<c-a>', '<c-b>', '<c-d>', '<c-e>', '<c-f>', '<c-g>',
\                    '<m-bs>', '<m-b>', '<m-b>', '<m-f>', '<m-n>', '<m-p>']}})

call dein#add('tpope/vim-commentary',
\ {'on_map': {'n': 'gcl', 'nxo': 'gc'}})

call dein#add('tpope/vim-surround',
\ {'on_map': {'n': ['ds', 'cs', 'cS', 'ys', 'yS', 'yss', 'ySs', 'ySS'], 'x': ['S', 'gS']}})

call dein#add('PeterRincker/vim-argumentative',
\ {'on_map': {'n': ['>,', '<,'], 'xo': ['i,', 'a,'], 'nxo': ['[,', '],']}})

call dein#add('wellle/targets.vim')

call dein#add('kana/vim-textobj-user')

call dein#add('kana/vim-textobj-indent',
\ {'on_map': {'xo': ['ii', 'ai', 'iI', 'aI']}})

call dein#add('thinca/vim-textobj-between',
\ {'on_map': {'xo': ['if', 'af']}})

call dein#add('thalesmello/vim-textobj-methodcall',
\ {'on_map': {'xo': ['im', 'am', 'iM', 'aM']}})

call dein#add('saihoooooooo/vim-textobj-space',
\ {'on_map': {'xo': ['iS', 'aS']}})

call dein#add('beloglazov/vim-textobj-punctuation',
\ {'on_map': {'xo': ['iu', 'au']}})

call dein#add('Julian/vim-textobj-variable-segment',
\ {'on_map': {'xo': ['iv', 'av']}})

call dein#add('zandrmartin/vim-textobj-blanklines',
\ {'on_map': {'xo': ['i<space>', 'a<space>']}})

" insertion

call dein#add('Raimondi/delimitMate',
\ {'on_event': 'InsertEnter',
\  'hook_add':
\    join(['let g:delimitMate_expand_cr=1',
\          'let g:delimitMate_expand_space=1',
\          'let g:delimitMate_balance_matchpairs=1'], '|')})

call dein#add('Shougo/deoplete.nvim',
\ {'on_event': 'InsertEnter', 'if': has('python3'),
\  'hook_add':
\    join(['let g:deoplete#enable_at_startup=1',
\          'let g:deoplete#auto_completion_start_length=1',
\          'let g:deoplete#enable_smart_case=1'], '|')})

call dein#add('Shougo/neosnippet',
\ {'on_event': 'InsertEnter',
\  'hook_add':
\    join(['imap <tab> <plug>(neosnippet_expand_or_jump)',
\          'smap <tab> <plug>(neosnippet_expand_or_jump)',
\          'xmap <tab> <plug>(neosnippet_expand_target)'], '|')})

call dein#add('Shougo/neosnippet-snippets',
\ {'depends': 'neosnippet'})

" languages

call dein#add('sheerun/vim-polyglot')

call dein#add('rbonvall/vim-textobj-latex',
\ {'on_ft': ['tex', 'latex']})

call dein#add('artur-shaik/vim-javacomplete2',
\ {'on_ft': 'java', 'if': executable('javac'),
\  'hook_add': 'au FileType java setl omnifunc=javacomplete#Complete'})

call dein#add('zchee/deoplete-clang',
\ {'on_ft': ['c', 'cpp'], 'if': executable('clang'),
\  'depends': 'deoplete.nvim',
\  'hook_add':
\    join(['let g:deoplete#sources#clang#libclang_path="/usr/lib64/libclang.so"',
\          'let g:deoplete#sources#clang#clang_header="/usr/lib64/clang"',
\          'let g:deoplete#sources#clang#flags=[]'], '|')})

call dein#add('davidhalter/jedi-vim',
\ {'on_ft': 'python', 'if': has('python') || has('python3'),
\  'hook_add':
\    join(['let g:jedi#completions_enabled=0',
\          'let g:jedi#goto_command="<leader>D"',
\          'let g:jedi#goto_assignments_command="<leader>G"',
\          'let g:jedi#rename_command="<leader>R"',
\          'let g:jedi#usages_command="<leader>N"'], '|')})
call dein#add('zchee/deoplete-jedi',
\ {'depends': ['deoplete.nvim', 'jedi-vim']})

call dein#add('ternjs/tern_for_vim',
\ {'on_ft': 'javascript', 'if': executable('npm'), 'build': 'npm i',
\  'hook_add':
\    join(['let s:node_bin="node_modules/.bin"',
\          'let s:tern_dir="'.fnamemodify(s:dein_dir, ':h:h').'/ternjs/tern_for_vim"',
\          'let $PATH=join([s:node_bin, $PATH, s:tern_dir."/".s:node_bin], ":")',
\          'let g:tern#command=["tern"]',
\          'let g:tern#arguments=["--persistent"]'], '|')})
call dein#add('carlitux/deoplete-ternjs',
\ {'depends': ['deoplete.nvim', 'tern_for_vim']})

call dein#end()
if dein#check_install() | call dein#install() | endif
call dein#save_state()
endif

colorscheme lucius
LuciusWhiteLowContrast

filetype plugin indent on
