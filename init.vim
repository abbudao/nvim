set clipboard+=unnamedplus
set completeopt=menuone,preview,noinsert,noselect
set confirm hidden noswapfile undofile
set tabstop=2 shiftwidth=2 expandtab
set number relativenumber list
set nohlsearch noincsearch ignorecase smartcase

" replacements

map Y y$
map H ^
map L $
map f //e<home>
map t /
map F ?
map T ??e+<home>

" mappings

let g:mapleader='g'

nm <leader>n :bn<cr>
nm <leader>p :bp<cr>
nm <leader>d :bd<cr>
nm <leader>q :q<cr>
nm <leader>s :w<cr>
nm <leader>r :%s///g<left><left><left>

nm <esc> :<c-f><up>
au CmdwinEnter * nm <buffer> <esc> :q<cr>

nm <leader>t :term<cr>
au TermOpen * tm <buffer> <esc> <c-\><c-n>
au TermOpen * au TermClose <buffer> bd!

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
\    'let &statusline="%{bufferline#refresh_status()}".bufferline#get_status_string()'})

" utilities

call dein#add('rliang/termedit.nvim')

call dein#add('tpope/vim-repeat',
\ {'on_map': {'n': '.'}})

call dein#add('tpope/vim-eunuch',
\ {'on_cmd': ['Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'SudoWrite', 'SudoRead']})

call dein#add('junegunn/vim-easy-align',
\ {'on_cmd': ['EasyAlign', 'LiveEasyAlign']})

" navigation

call dein#add('dylanaraps/root.vim',
\ {'on_path': '.*',
\  'hook_add':
\    join(['let g:root#auto=1',
\          'let g:root#echo=0'], '|')})

call dein#add('justinmk/vim-dirvish',
\ {'on_cmd': 'Dirvish',
\  'hook_add':
\    join(['nm <leader>e :Dirvish<cr>',
\          'au FileType dirvish cd %',
\            'nm <buffer> h -',
\            'nm <buffer> l <cr>',
\            'nm <buffer> ~ :Dirvish ~<cr>'], '|')})

call dein#add('junegunn/fzf',
\ {'lazy': 1, 'build': './install --all'})

call dein#add('junegunn/fzf.vim',
\ {'depends': 'fzf',
\  'on_cmd': ['Files', 'GFiles', 'History', 'Snippets'],
\  'hook_add':
\    join(['nm <leader>f :Files<cr>',
\          'nm <leader>F :GFiles<cr>',
\          'nm <leader>h :History<cr>',
\          'nm <leader>i :Snippets<cr>',
\          'au FileType fzf tun <buffer> <esc>'], '|')})

" movement

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
