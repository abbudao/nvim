let g:mapleader="\<space>"

set clipboard+=unnamedplus
set completeopt=menuone,preview,noinsert,noselect
set confirm hidden noswapfile undofile undodir=~/.cache
set gdefault nohlsearch
set number relativenumber
set tabstop=2 shiftwidth=2 expandtab list

hi! link LineNr NonText
hi! link CursorLineNr NonText
hi! link StatusLine Question
hi! link StatusLineNC Visual

nmap <esc> q:k
nmap <c-p> :bp<cr>
nmap <c-n> :bn<cr>
nmap <leader>x :bd<cr>
nmap <leader>X :bd!<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>r q:i%s//<left>
nmap <leader>s :term<cr>
tmap <c-v> <c-\><c-n>

au CmdwinEnter * nmap <buffer><esc> :q<cr>

let s:dein_dir='~/.local/share/nvim/site/'
let s:dein_cache='~/.cache/dein'
let g:dein#types#git#clone_depth=1
if isdirectory(expand(s:dein_dir))

if dein#load_state(s:dein_cache)
call dein#begin(s:dein_cache)
call dein#add('Shougo/dein.vim', {'rtp': ''})

" interface

call dein#add('bling/vim-bufferline',
\ {'on_event': 'BufRead',
\  'hook_add':
\    join(['let g:bufferline_echo=0',
\          'let g:bufferline_show_bufnr=0',
\          'let g:bufferline_active_buffer_left=""',
\          'let g:bufferline_active_buffer_right=""'], '|'),
\  'hook_post_source':
\    'let &statusline="%#StatusLineNC# '
\      .'%{bufferline#refresh_status()}"'
\      .'.bufferline#get_status_string()'})

call dein#add('deris/vim-shot-f')

call dein#add('osyo-manga/vim-over')

" utilities

call dein#add('rliang/termedit.nvim')

call dein#add('tpope/vim-eunuch')

call dein#add('tpope/vim-rsi')

call dein#add('tpope/vim-repeat')

call dein#add('junegunn/vim-easy-align',
\ {'on_map': '<plug>(EasyAlign',
\  'hook_add':
\    join(['nmap <leader>a <plug>(EasyAlign)',
\          'vmap <leader>a <plug>(EasyAlign)'], '|')})

" navigation

call dein#add('junegunn/fzf',
\ {'build': './install --all'})

call dein#add('junegunn/fzf.vim',
\ {'depends': 'fzf',
\  'hook_add':
\    join(['nmap <leader>: :Commands<cr>',
\          'nmap <leader>; :History:<cr>',
\          'nmap <leader>b :Buffers<cr>',
\          'nmap <leader>f :Files<cr>',
\          'nmap <leader>g :GFiles<cr>',
\          'nmap <leader>h :History<cr>',
\          'nmap <leader>i :Snippets<cr>',
\          'nmap <leader>l :Lines<cr>',
\          'nmap <leader><tab> <plug>(fzf-maps-n)',
\          'xmap <leader><tab> <plug>(fzf-maps-x)',
\          'omap <leader><tab> <plug>(fzf-maps-o)'], '|')})

call dein#add('dylanaraps/root.vim',
\ {'on_event': 'BufRead',
\  'hook_add':
\    join(['let g:root#auto=1',
\          'let g:root#echo=0'], '|')})

" movement

call dein#add('kana/vim-textobj-user')

call dein#add('kana/vim-textobj-function',
\ {'depends': 'vim-textobj-user'})
call dein#add('kana/vim-textobj-indent',
\ {'depends': 'vim-textobj-user'})
call dein#add('beloglazov/vim-textobj-punctuation',
\ {'depends': 'vim-textobj-user'})
call dein#add('beloglazov/vim-textobj-quotes',
\ {'depends': 'vim-textobj-user'})
call dein#add('Julian/vim-textobj-brace',
\ {'depends': 'vim-textobj-user'})
call dein#add('Julian/vim-textobj-variable-segment',
\ {'depends': 'vim-textobj-user'})
call dein#add('glts/vim-textobj-comment',
\ {'depends': 'vim-textobj-user'})
call dein#add('sgur/vim-textobj-parameter',
\ {'depends': 'vim-textobj-user'})
call dein#add('vimtaku/vim-textobj-keyvalue',
\ {'depends': 'vim-textobj-user'})
call dein#add('thalesmello/vim-textobj-methodcall',
\ {'depends': 'vim-textobj-user'})

call dein#add('tpope/vim-surround',
\ {'on_map': {'n': ['ys', 'cs', 'ds']}})

call dein#add('tpope/vim-commentary',
\ {'on_map': '<plug>Commentary',
\  'hook_add':
\    join(['xmap <leader>c <plug>Commentary',
\          'nmap <leader>c <plug>Commentary',
\          'omap <leader>c <plug>Commentary',
\          'nmap <leader>cl <plug>CommentaryLine'], '|')})

call dein#add('Lokaltog/vim-easymotion',
\ {'on_map': '<plug>(easymotion',
\  'hook_add':
\    join(['let g:EasyMotion_keys="fhskalgvbcnrueiwotyqpdj"',
\          'let g:EasyMotion_do_shade=0',
\          'let g:EasyMotion_smartcase=1',
\          'let g:EasyMotion_use_upper=1',
\          'nmap s <plug>(easymotion-s)',
\          'vmap s <plug>(easymotion-s)',
\          'omap S <plug>(easymotion-s)',
\          'xmap S <plug>(easymotion-s)'], '|')})

call dein#add('terryma/vim-multiple-cursors',
\ {'hook_add':
\    join(['let g:multi_cursor_next_key="<c-f>"',
\          'let g:multi_cursor_prev_key="<c-b>"'], '|')})

" insertion

call dein#add('Raimondi/delimitMate',
\ {'on_event': 'InsertEnter',
\  'hook_add':
\    join(['let g:delimitMate_expand_cr=1',
\          'let g:delimitMate_expand_space=1',
\          'let g:delimitMate_balance_matchpairs=1'], '|')})

call dein#add('SirVer/ultisnips',
\ {'on_event': 'InsertEnter', 'on_if': has('python3'),
\  'hook_add':
\    join(['let g:UltiSnipsExpandTrigger="<tab>"',
\          'let g:UltiSnipsListSnippets="<c-tab>"',
\          'let g:UltiSnipsJumpForwardTrigger="<c-n>"',
\          'let g:UltiSnipsJumpBackwardTrigger="<c-p>"'], '|')})
call dein#add('honza/vim-snippets',
\ {'depends': 'ultisnips'})

call dein#add('Shougo/deoplete.nvim',
\ {'on_event': 'InsertEnter', 'on_if': has('python3'),
\  'hook_add':
\    join(['let g:deoplete#enable_at_startup=1',
\          'let g:deoplete#auto_completion_start_length=1',
\          'let g:deoplete#enable_smart_case=1'], '|')})

" languages

call dein#add('artur-shaik/vim-javacomplete2',
\ {'on_ft': 'java', 'on_if': executable('javac'),
\  'hook_add': 'au FileType java setl omnifunc=javacomplete#Complete'})

call dein#add('davidhalter/jedi-vim',
\ {'on_ft': 'python', 'on_if': has('python') || has('python3')})
call dein#add('zchee/deoplete-jedi',
\ {'depends': ['deoplete.nvim', 'jedi-vim']})

call dein#add('othree/yajs.vim',
\ {'on_ft': 'javascript'})
call dein#add('othree/es.next.syntax.vim',
\ {'depends': 'yajs.vim'})
call dein#add('ternjs/tern_for_vim',
\ {'on_ft': 'javascript', 'on_if': executable('npm'), 'build': 'npm i',
\  'hook_add': 'let $PATH="node_modules/.bin:".$PATH'})
call dein#add('carlitux/deoplete-ternjs',
\ {'depends': ['deoplete.nvim', 'tern_for_vim']})

call dein#end()
if dein#check_install() | call dein#install() | endif
call dein#save_state()
endif

else
exe '!git clone --depth=1 https://github.com/Shougo/dein.vim ~/.local/share/nvim/site'
endif

filetype plugin indent on
