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
Plug 'alvan/vim-closetag'
Plug 'chrisbra/unicode.vim'
Plug 'inkarkat/vim-visualrepeat'
Plug 'easymotion/vim-easymotion'
Plug 'aykamko/vim-easymotion-segments'
Plug 'thalesmello/vim-slasher'
Plug 'vim-scripts/cmdalias.vim'
Plug 'vim-scripts/LargeFile'

Plug 'junegunn/vim-easy-align', { 'on': ['<plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'junegunn/rainbow_parentheses.vim', { 'on': 'RainbowParentheses' }

if executable('fzf')
    Plug 'junegunn/fzf', { 'on': 'FZF' }
endif

if executable('ag')
    Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep --smart-case'
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

if exists('*matchfuzzy')
    Plug 'mattn/ctrlp-matchfuzzy'
    let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
endif

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags', { 'on': [] }
endif

if has('nvim') || has('patch-7.4.849')
    Plug 'tmsvg/pear-tree'
else
    Plug 'raimondi/delimitMate'
endif

if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

if has('lambda') && has('timers') && exists('*json_encode')
    let g:go_code_completion_enabled = 0
    let g:go_def_mapping_enabled = 0
    let g:go_gopls_enabled = 0

    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif

if executable('go')
    if has('nvim') || has('patch-8.0.1453')
        Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
    else
        Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries', 'tag': 'v1.15' }
    endif
endif

Plug 'ap/vim-css-color'
Plug 'chr4/nginx.vim'
Plug 'mattn/emmet-vim'
Plug 'solarnz/thrift.vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'

Plug 'arnie97/peaksea.vim', { 'rtp': 'vim' }
Plug 'overcache/neoSolarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'mhinz/vim-janah'

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
        \ 'fileformat': '%{winwidth(0) < 70? "": &ff}',
        \ 'filetype': '%{winwidth(0) < 65? "": &ft !=# ""? &ft: "no ft"}',
        \ 'fileencoding': '%{winwidth(0) < 55? "": &fenc !=# "" ? &fenc: &enc}',
        \ 'percent': '%3p%%%<',
        \ 'modified': '%{&modifiable?(&readonly?"🔒":"").(&modified?"+":""):"-"}'
    \ },
    \ 'component_visible_condition': {
        \ 'branch': 'exists("*fugitive#head") && "" != fugitive#head()',
        \ 'fileformat': 'winwidth(0) >= 70',
        \ 'filetype': 'winwidth(0) >= 65',
        \ 'fileencoding': 'winwidth(0) >= 55',
    \ },
    \ 'active': {'left': [
        \ ['mode', 'paste'],
        \ ['branch', 'filename', 'modified']
    \ ]},
    \ 'inactive': {'left': [
        \ ['filename', 'modified']
    \ ]},
\ }

autocmd ColorScheme * call s:LightLineUpdate()
autocmd VimEnter    * call s:LightLineUpdate()

function s:LightLineUpdate()
    if !exists('g:loaded_lightline')
        return
    endif
    if &background == 'dark'
        let g:lightline.colorscheme = 'wombat'
    else
        let g:lightline.colorscheme = 'PaperColor'
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction


let g:ctrlp_types = ['buf', 'mru', 'fil']
let g:ctrlp_extensions = ['funky', 'tag', 'mixed', 'bookmarkdir']
let g:ctrlp_arg_map = 1
let g:ctrlp_cache_dir = $HOME . '/.local/share/nvim/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_funky_cache_dir = g:ctrlp_cache_dir
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_match_current_file = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_mruf_default_order = 1
let g:ctrlp_mruf_exclude = '\v.*(/\.git/.*|_(BASE|LOCAL|REMOTE)_\d+[^/]*|/\.[^/]+$|\.orig$)'
let g:ctrlp_mruf_max = 5000
let g:ctrlp_show_hidden = 1
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

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType lisp,clojure,scheme RainbowParentheses

let g:closetag_filetypes = 'html,php,asp,jsp,smarty,vue,javascript.jsx'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx'
autocmd FileType html,xhtml,xml,css,sass,scss,javascript,javascript.jsx,vue,eex,php,asp,jsp EmmetInstall

let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1

let g:LargeFile = 1
let g:gutentags_cache_dir = $HOME . '/.local/share/nvim/tag'
let g:lsp_diagnostics_float_cursor = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:rustfmt_autosave = 1
let g:signify_sign_change = '&'


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
    if !exists(':Alias')
        return
    endif

    Alias ack Ack
    Alias ag Ack
    Alias b ls<cr>:b
    Alias git Git
    Alias hdiff SignifyHunkDiff
    Alias hundo SignifyHunkUndo
    Alias hd SignifyHunkDiff
    Alias hu SignifyHunkUndo
    Alias tabg tab<space>Git
    Alias tg tab<space>Git
    Alias nt NERDTreeToggle
    Alias nf NERDTreeFind
    Alias ng NERDTreeToggleVCS
    Alias nv NERDTreeToggleVCS
endfunction
