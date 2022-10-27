#!/bin/sh
""curl --create-dirs -Lo ~/.local/share/nvim/site/autoload/plug.vim \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
""exit # the magic polyglot is valid in both shell and vim

if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    finish
endif

silent! call plug#begin('~/.local/share/nvim/site/pack/main/opt')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
Plug 'itchyny/lightline.vim'
Plug 'arnie97/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'tacahiroy/ctrlp-funky'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeToggleVCS'] }
Plug 'airblade/vim-rooter'

Plug 'rhysd/conflict-marker.vim'
Plug 'ryvnf/readline.vim'
Plug 'fidian/hexmode'
Plug 'ojroques/vim-oscyank'
Plug 'roxma/vim-paste-easy'
Plug 'wsdjeg/vim-fetch'
Plug 'arnie97/vim-hugefile'
Plug 'inkarkat/vim-visualrepeat'
Plug 'easymotion/vim-easymotion'
Plug 'aykamko/vim-easymotion-segments'
Plug 'chrisbra/unicode.vim'
Plug 'wellle/context.vim'
Plug 'andrewRadev/sideways.vim'
Plug 'thalesmello/vim-slasher'
Plug 'vim-scripts/cmdalias.vim'

if has('nvim') || has('patch-8.0.1394')
    Plug 'svermeulen/vim-yoink'
endif

Plug 'arnie97/rainbow_parentheses.vim', { 'on': 'RainbowParentheses' }
Plug 'junegunn/vim-easy-align', { 'on': ['<plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim', { 'on': 'GV' }

if executable('fzf')
    Plug 'junegunn/fzf', { 'on': 'FZF' }
endif

if has('nvim') || has('patch-8.1.0039')
    Plug 'yilin-yang/vim-markbar'
endif

if executable('ag')
    Plug 'mileszs/ack.vim'
    set grepprg=ag\ --vimgrep\ --smart-case\ $*
    set grepformat=%f:%l:%c:%m
    let g:ackprg = 'ag --vimgrep --smart-case'
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

if exists('*matchfuzzy')
    Plug 'mattn/ctrlp-matchfuzzy'
    let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
endif

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
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
    let g:go_imports_autosave = 0
    let g:go_version_warning = 0

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

    if has('nvim-0.5')
        Plug 'mfussenegger/nvim-dap'
        Plug 'rcarriga/nvim-dap-ui', { 'tag': 'v0.27.1' }
        Plug 'leoluz/nvim-dap-go'
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate', 'branch': '0.5-compat' }

        autocmd VimEnter * lua
            \ require 'dapui'.setup()
            \ require 'dap-go'.setup()
            \ require 'dap-repl'
    endif
endif

if !has('patch-8.2.3519')
    Plug 'cespare/vim-toml'
endif

Plug 'ap/vim-css-color'
Plug 'chr4/nginx.vim'
Plug 'mattn/emmet-vim'
Plug 'solarnz/thrift.vim'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'neovimhaskell/haskell-vim'

Plug 'arnie97/peaksea.vim', { 'rtp': 'vim' }
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()


set noshowmode
let s:branch = ''
let g:lightline = {
    \ 'component': {
        \ 'modified':     '%{&modifiable? (&readonly? "🔒": "").(&modified? "+": ""): "-"}',
        \ 'branch':       '%{LightLineBranch(0)}',
        \ 'fileformat':   '%{LightLineSpareSpace() < 10? "": &ff}',
        \ 'fileencoding': '%{LightLineSpareSpace() < 15? "": &fenc !=# "" ? &fenc: &enc}',
        \ 'filetype':     '%{LightLineSpareSpace() < 25? "": &ft !=# ""? &ft: "no ft"}',
        \ 'percent':      '%<%3p%%',
    \ },
    \ 'component_visible_condition': {
        \ 'branch':       'len(LightLineBranch(1))',
        \ 'fileformat':   'LightLineSpareSpace() >= 10',
        \ 'fileencoding': 'LightLineSpareSpace() >= 15',
        \ 'filetype':     'LightLineSpareSpace() >= 25',
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

function LightLineSpareSpace()
    return winwidth(0) - len(s:branch) - strlen(expand('%:t')) - 40
endfunction

function LightLineBranch(cached)
    if a:cached || !exists('*FugitiveHead')
        return s:branch
    endif

    let s:branch = FugitiveHead()
    if LightLineSpareSpace() > 0 || len(s:branch) <= 6
        return s:branch
    endif

    let base_name = strridx(s:branch, '/') + 1
    if base_name
        let s:branch = strpart(s:branch, base_name) . '&'
        if LightLineSpareSpace() > 0
            return s:branch
        endif
    endif

    let s:branch = strpart(s:branch, 0, 3) . '&'
    return s:branch
endfunction


let g:ctrlp_types = ['fil', 'buf', 'mru']
let g:ctrlp_extensions = ['funky', 'modified', 'tag']
let g:ctrlp_arg_map = 1
let g:ctrlp_cache_dir = $HOME . '/.local/share/nvim/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_funky_cache_dir = g:ctrlp_cache_dir
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_match_current_file = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_mruf_default_order = 1
let g:ctrlp_mruf_exclude = '\v(<|_)(temp|tmp)(_|>)|/(dev/shm|var/folders|node_modules|vendor|pkg/mod|rustlib|\.cargo/registry|\.git|\.svn|\.hg|\.bzr)/|_(BASE|LOCAL|REMOTE)_\d+|\.(orig|bak|swp)$|\.#override.conf'
let g:ctrlp_mruf_max = 2000
let g:ctrlp_show_hidden = 1
let g:ctrlp_tjump_shortener = [expand('~'), '~']
let g:ctrlp_tjump_skip_tag_name = 1
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
autocmd FileType html,xhtml,xml,css,sass,scss,javascript,javascript.jsx,vue,eex,php,asp,jsp,smarty EmmetInstall

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}', 'fold']]
autocmd FileType c,clojure,cpp,cs,dart,go,java,javascript,json,kotlin,lisp,objc,objcpp,perl,php,r,rust,scala,scheme,swift,thrift,typescript RainbowParentheses

let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 1

let g:context_highlight_tag = '<hide>'
let g:context_max_height = 11
let g:context_max_per_indent = 3

let g:go_fold_enable = ['block', 'import', 'package_comment']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_cache_dir = $HOME . '/.local/share/nvim/tag'
let g:gutentags_define_advanced_commands = 1
let g:gutentags_project_root = ['.gutentags']

let g:hugefile_trigger_size = 0.5
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:markbar_num_lines_context = 3
let g:markbar_persist_mark_names = v:false
let g:markbar_peekaboo_marks_to_display = '''"[]^.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:rooter_patterns = ['!/pkg/mod/', '.git', '.svn', '.hg', '.bzr']
let g:rustfmt_autosave = 1
let g:signify_sign_change = '&'

let g:yoinkSyncNumberedRegisters = 1
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkIncludeNamedRegisters = 0
if has('nvim')
    let g:yoinkSavePersistently = 1
endif


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

    if !exists(':Ack')
        Alias ag grep
    else
        Alias ag Ack
    endif

    Alias b ls<cr>:b
    Alias git Git
    Alias hd SignifyHunkDiff
    Alias hu SignifyHunkUndo
    Alias tabg tab<space>Git
    Alias tg tab<space>Git
    Alias nt NERDTreeToggle
    Alias nf NERDTreeFind
    Alias ng NERDTreeToggleVCS
endfunction
