#!/bin/sh
""curl --create-dirs -Lo ~/.local/share/nvim/site/autoload/plug.vim \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
""exit # the magic polyglot is valid in both shell and vim

if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    finish
endif

function s:PlugCompat(...)
    if a:0 < 2 || type(a:2) != v:t_list
        return call('plug#', a:000)
    endif

    for rule in a:2
        let opts = {}
        if type(rule[-1]) == v:t_dict
            let [rule, opts] = [rule[:-2], rule[-1]]
        endif

        for cond in rule
            if type(cond) == v:t_string
                let cond = has(cond)
            endif
            if cond
                return plug#(a:1, opts)
            endif
        endfor
    endfor
endfunction

silent! call plug#begin('~/.local/share/nvim/site/pack/main/opt')
command! -nargs=+ -bar Plug call s:PlugCompat(<args>)

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" ctrlp
Plug 'arnie97/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'mattn/ctrlp-matchfuzzy', [[exists('*matchfuzzy')]]
Plug 'tacahiroy/ctrlp-funky'

" buffer load
Plug 'airblade/vim-rooter'
Plug 'arnie97/vim-hugefile'
Plug 'fidian/hexmode'
Plug 'wsdjeg/vim-fetch'

" clipboard
Plug 'ojroques/vim-oscyank'
Plug 'svermeulen/vim-yoink', [['nvim', 'patch-8.0.1394']]
Plug 'roxma/vim-paste-easy'

" motions
Plug 'andrewradev/sideways.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'inkarkat/vim-visualrepeat'
Plug 'justinmk/vim-sneak'
Plug 'rhysd/conflict-marker.vim'
Plug 'thalesmello/vim-slasher'

" panels
Plug 'chrisbra/unicode.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify', [['nvim', 'patch-8.0.902'], [{'branch': 'legacy'}]]
Plug 'wellle/context.vim'
Plug 'yilin-yang/vim-markbar', [['nvim', 'patch-8.1.0039']]

" command-line & insert mode
Plug 'ryvnf/readline.vim'
Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
Plug 'tmsvg/pear-tree', [['nvim', 'patch-7.4.849']]
Plug 'vim-scripts/cmdalias.vim'

if executable('ag')
    Plug 'mileszs/ack.vim'
    set grepprg=ag\ --vimgrep\ --smart-case\ $*
    set grepformat=%f:%l:%c:%m
    let g:ackprg = 'ag --vimgrep --smart-case'
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" language servers
if has('lambda') && has('timers') && exists('*json_encode')
    autocmd VimEnter * call
        \ asyncomplete#sources#neosnippet#get_source_options({})
        \ ->asyncomplete#register_source()
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
endif

" debug adapters
if has('nvim-0.5')
    autocmd VimEnter * lua
        \ require 'dapui'.setup()
        \ require 'dap-go'.setup()
        \ require 'dap-repl'
        \ require 'tree-sitter'
    Plug 'mfussenegger/nvim-dap'
    Plug 'leoluz/nvim-dap-go'
    Plug 'rcarriga/nvim-dap-ui', [
        \ ['nvim-0.6'],
        \ ['nvim-0.5', {'tag': 'v0.27.1'}]]
    Plug 'nvim-treesitter/nvim-treesitter', [
        \ ['nvim-0.8', {'tag': 'v0.8.1'}],
        \ ['nvim-0.7', {'tag': 'v0.7.2'}],
        \ ['nvim-0.6', {'commit': '6a437db'}],
        \ ['nvim-0.5', {'branch': '0.5-compat'}]]
    Plug 'p00f/nvim-ts-rainbow'
endif

" file types
Plug 'ap/vim-css-color'
Plug 'arnie97/rainbow_parentheses.vim', {'on': 'RainbowParentheses'}
Plug 'cespare/vim-toml', [[!has('nvim-0.6') && !has('patch-8.2.3519')]]
Plug 'chr4/nginx.vim'
Plug 'ludovicchabant/vim-gutentags', [[executable('ctags')]]
Plug 'mattn/emmet-vim'
Plug 'neovimhaskell/haskell-vim', [[executable('ghc')]]
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim', [[executable('rustc')]]
Plug 'solarnz/thrift.vim', [[executable('thrift')]]

" color schemes
Plug 'arnie97/peaksea.vim', {'rtp': 'vim'}
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()


" lightline
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


" ctrlp
let g:ctrlp_types = ['fil', 'buf', 'mru']
let g:ctrlp_extensions = ['funky', 'modified', 'tag']
let g:ctrlp_arg_map = 1
let g:ctrlp_cache_dir = $HOME . '/.local/share/nvim/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_funky_cache_dir = g:ctrlp_cache_dir
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_match_current_file = 1
let g:ctrlp_match_func = !exists('*matchfuzzy')? {}: {
    \ 'match': 'ctrlp_matchfuzzy#matcher'
\ }
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


" everything else
let g:context_highlight_tag = '<hide>'
let g:context_max_height = 11
let g:context_max_per_indent = 3

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

let g:netrw_altfile = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 30

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:quantum_black = 1
let g:quantum_italics = 1

autocmd FileType arduino,awk,c,clojure,cpp,cs,d,dart,dts,go,java,javascript,json,kotlin,lisp,objc,objcpp,perl,php,ps1,r,racket,rust,scala,scheme,swift,thrift,typescript RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}', 'fold']]
let g:rooter_patterns = ['!/pkg/mod/', '.git', '.svn', '.hg', '.bzr']
let g:rustfmt_autosave = 1
let g:signify_sign_change = '&'

let g:sneak#label = 1
let g:sneak#map_netrw = 0
let g:sneak#prompt = 'z'
let g:sneak#target_labels = ';23456789ftnqFTNGHLMURQ'

let g:yoinkSyncNumberedRegisters = 1
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkIncludeNamedRegisters = 0
if has('nvim')
    let g:yoinkSavePersistently = 1
endif


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
    Alias go make
    Alias hd SignifyHunkDiff
    Alias hu SignifyHunkUndo
    Alias tabg tab<space>Git
    Alias tg tab<space>Git
    Alias ud UndotreeToggle
    Alias ut UnicodeTable
endfunction
