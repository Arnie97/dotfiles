#!/bin/sh
""curl --create-dirs -Lo ~/.local/share/nvim/site/autoload/plug.vim \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
""exit # the magic polyglot is valid in both shell and vim

if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    finish
endif

call plug#begin('~/.local/share/nvim/site/pack/main/opt')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'arnie97/mru.vim', { 'on': 'MRU' }
Plug 'arnie97/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'tacahiroy/ctrlp-funky'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeToggleVCS'] }

Plug 'andrewRadev/sideways.vim'
Plug 'andrewRadev/splitjoin.vim'
Plug 'andrewRadev/switch.vim'

Plug 'amix/open_file_under_cursor.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'ryvnf/readline.vim'
Plug 'tmsvg/pear-tree'
Plug 'alvan/vim-closetag'
Plug 'chrisbra/unicode.vim', { 'do': ':nmap ga <plug>(UnicodeGA)' }
Plug 'inkarkat/vim-visualrepeat'
Plug 'easymotion/vim-easymotion'
Plug 'aykamko/vim-easymotion-segments'
Plug 'vim-scripts/cmdalias.vim'

Plug 'junegunn/vim-easy-align', { 'on': ['<plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'junegunn/rainbow_parentheses.vim'

if executable('fzf')
    Plug 'junegunn/fzf', { 'on': 'FZF' }
endif

if executable('ag')
    Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep --smart-case'
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags', { 'on': [] }
endif

if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

if has('python') || has('python3')
    Plug 'davidhalter/jedi-vim'
endif

if executable('flake8')
    Plug 'nvie/vim-flake8'
endif

if executable('go')
    Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
    let g:go_gopls_enabled = 0
    autocmd FileType go if line('$') < 5000 | let g:go_gopls_enabled = 1 | endif
endif

Plug 'ap/vim-css-color'
Plug 'chr4/nginx.vim'
Plug 'mattn/emmet-vim'
Plug 'solarnz/thrift.vim'
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'

Plug 'calincru/peaksea.vim'
Plug 'vim-scripts/peaksea'
Plug 'mhinz/vim-janah'
Plug 'flazz/vim-colorschemes'
Plug 'overcache/neoSolarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()


" switch between different case forms
" https://blog.othree.net/log/2017/11/16/naming-cases/
let g:switch_custom_definitions = [
    \ {
        \ '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
        \ '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
        \ '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
        \ '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
        \ '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \ }
\ ]


set noshowmode
let g:lightline = {
    \ 'component': {
        \ 'branch': '%{fugitive#head()}',
        \ 'modified': '%{&modifiable?(&readonly?"🔒":"").(&modified?"+":""):"-"}'
    \ },
    \ 'component_visible_condition': {
        \ 'branch': '(exists("*fugitive#head") && ""!=fugitive#head())',
    \ },
    \ 'active': {'left': [
        \ ['mode', 'paste'],
        \ ['branch', 'filename', 'modified']
    \ ]},
    \ 'inactive': {'left': [
        \ ['filename', 'modified']
    \ ]},
\ }


let g:ctrlp_extensions = ['tag', 'mixed', 'bookmarkdir', 'funky']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.local/share/nvim/ctrlp'
let g:ctrlp_funky_cache_dir = g:ctrlp_cache_dir
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_mruf_max = 5000
let g:ctrlp_mruf_exclude = '\v.*(/\.git/.*|_(BASE|LOCAL|REMOTE)_\d+[^/]*|\.orig$)'
let g:ctrlp_mruf_default_order = 1
" let g:ctrlp_tilde_homedir = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>'],
    \ 'AcceptSelection("h")': ['<c-s>'],
    \ 'AcceptSelection("v")': ['<c-v>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'PrtDeleteEnt()':       ['<c-x>'],
\ }


let g:user_emmet_mode = 'i'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = ','

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

let g:closetag_filetypes = 'html,php,asp,jsp,smarty,vue,javascript.jsx'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx'
autocmd FileType html,xhtml,xml,css,sass,scss,javascript,javascript.jsx,vue,eex,php,asp,jsp EmmetInstall

let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1

let g:gutentags_cache_dir = $HOME . '/.local/share/nvim/tag'
let g:python_highlight_all = 1
let g:signify_sign_change = '&'
let g:neosnippet#enable_snipmate_compatibility = 1


" snippet tab completion
imap <expr> <tab>
    \ pumvisible()? "\<c-n>":
    \ neosnippet#expandable_or_jumpable()?
    \ "\<plug>(neosnippet_expand_or_jump)": "\<tab>"

smap <expr> <tab>
    \ neosnippet#expandable_or_jumpable()?
    \ "\<plug>(neosnippet_expand_or_jump)": "\<tab>"

" expand the completed snippet trigger by <cr>
imap <expr> <cr>
    \ (pumvisible() && neosnippet#expandable()) ?
    \ "\<plug>(neosnippet_expand)": "\<cr>"


" command mode aliases
autocmd VimEnter * call s:CmdLineMappings()

function s:CmdLineMappings()
    Alias ag Ack
    Alias b ls<cr>:b
    Alias git Git
    Alias nt NERDTreeToggle
    Alias nf NERDTreeFind
    Alias ng NERDTreeToggleVCS
    Alias nv NERDTreeToggleVCS
endfunction
