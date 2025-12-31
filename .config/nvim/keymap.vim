" swap keys
noremap x "-x
noremap X "-X
noremap Y y$
noremap <space> :
map <bslash> "
nnoremap & :&&<cr>
noremap <silent> <expr> 0 getline('.')[:col('.') - 2] =~ '^\s\+$'? '0': '^'

" remove the Windows ^M when the line endings gets messed up
nnoremap dm mmHmt:%s/<c-v><cr>//ge<cr>'tzt'm
nnoremap dr :call TrimWhitespace(1)<cr>
nnoremap dc :SignifyHunkUndo<cr>
nnoremap du :SignifyHunkUndo<cr>

" option toggles
nnoremap -b :SetCycle background  light dark            <cr>
nnoremap -e :setlocal expandtab!  <bar> set expandtab?  <cr>
nnoremap -f :SetCycle fileformat  dos unix mac          <cr>
nnoremap -i :setlocal ignorecase! <bar> set ignorecase? <cr>
nnoremap -n :setlocal number!     <bar> set number?     <cr>
nnoremap -p :setlocal paste!      <bar> set paste?      <cr>
nnoremap -a :setlocal autoread!   <bar> set autoread?   <cr>
nnoremap -s :setlocal spell!      <bar> set spell?      <cr>
nnoremap -t :setlocal list!       <bar> set list?       <cr>
nnoremap -w :setlocal wrap!       <bar> set wrap?       <cr>
nnoremap -z :SetCycle foldmethod  indent expr marker syntax<cr>

nnoremap -y :SignifyToggle<cr>
nnoremap -c :SignifyHunkDiff<cr>
nnoremap -m :marks<cr>
nnoremap -r :let g:trim = !g:trim<bar> echo (g:trim? '  ': 'no').'trim'<cr>
nnoremap -d :lua require 'dapui'.toggle()<cr>
nnoremap -k :lua require 'dap'.toggle_breakpoint()<cr>
nnoremap -. :lua require 'dap'.continue()<cr>
nnoremap -, :lua require 'dap-repl'.conditional_breakpoint()<cr>
nnoremap -/ <plug>VinegarUp
nnoremap -- :options<cr>


" fast jump with sneak
if exists('g:plugs') && has_key(g:plugs, 'vim-sneak')
    nmap f  <plug>Sneak_f
    nmap F  <plug>Sneak_F
    nmap t  <plug>Sneak_t
    nmap T  <plug>Sneak_T
    nmap gz <plug>Sneak_s
    nmap gZ <plug>Sneak_S
    nmap zz <plug>Sneak_s
    nmap zZ <plug>Sneak_S
    omap f  <plug>Sneak_f
    omap F  <plug>Sneak_F
    omap t  <plug>Sneak_t
    omap T  <plug>Sneak_T
    xmap f  <plug>Sneak_f
    xmap F  <plug>Sneak_F
    xmap t  <plug>Sneak_t
    xmap T  <plug>Sneak_T
    xmap z  <plug>Sneak_s
    xmap Z  <plug>Sneak_S
endif


" jump to conflict markers
if exists('g:plugs') && has_key(g:plugs, 'conflict-marker.vim')
    let g:conflict_marker_enable_mappings = 0
    nmap cxt <plug>(conflict-marker-themselves)
    nmap cxo <plug>(conflict-marker-ourselves)
    nmap cxn <plug>(conflict-marker-none)
    nmap cxb <plug>(conflict-marker-both)

    map [x <plug>(conflict-marker-prev-hunk)
    map ]x <plug>(conflict-marker-next-hunk)
endif


" cycle between buffers, quickfix list and location list
nnoremap [o :cprev<cr>
onoremap [o :cprev<cr>
nnoremap ]o :cnext<cr>
onoremap ]o :cnext<cr>
nnoremap -o :copen<cr>
nnoremap [l :lprev<cr>
onoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>
onoremap ]l :lnext<cr>
nnoremap -l :lopen<cr>
nnoremap g! :tabedit <cfile><cr>
vnoremap g! y:tabedit <c-r>"<cr>
nnoremap gb :Git blame<cr><c-w>12<<cr>
nnoremap gr <nop>

if has('autocmd')
    autocmd FileType qf nnoremap <buffer> -o :cclose<cr>
    autocmd FileType qf nnoremap <buffer> -l :lclose<cr>
    autocmd FileType qf nnoremap <buffer> -; :lclose<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-wordmotion')
    let g:wordmotion_prefix = ']'
    map [w ]b
    map [e ]ge
    map [b ]b
    map [ge ]ge
endif

if exists('g:plugs') && has_key(g:plugs, 'nvim-lspconfig')
    function s:enableLspMapping() abort
        nnoremap <buffer> [;  :lua vim.diagnostic.goto_prev()   <cr>
        nnoremap <buffer> ];  :lua vim.diagnostic.goto_next()   <cr>
        nnoremap <buffer> -;  :lua vim.diagnostic.setloclist()   <cr>
        nnoremap <buffer> gO  :lua vim.lsp.buf.document_symbol()<cr>
        nnoremap <buffer> gd  :lua vim.lsp.buf.definition()     <cr>
        nnoremap <buffer> [u  :lua vim.lsp.buf.references()     <cr>
        nnoremap <buffer> ]u  :lua vim.lsp.buf.references()     <cr>
        nnoremap <buffer> [j  :lua vim.lsp.buf.references()     <cr>
        nnoremap <buffer> ]j  :lua vim.lsp.buf.references()     <cr>
        nnoremap <buffer> [n  :lua vim.lsp.buf.implementation() <cr>
        nnoremap <buffer> ]n  :lua vim.lsp.buf.implementation() <cr>
        nnoremap <buffer> [k  :lua vim.lsp.buf.incoming_calls() <cr>
        nnoremap <buffer> ]k  :lua vim.lsp.buf.outgoing_calls() <cr>
        nnoremap <buffer> K   :lua vim.lsp.buf.hover()          <cr>
        nnoremap <buffer> gra :lua vim.lsp.buf.code_action()    <cr>
        nnoremap <buffer> gre :lua vim.lsp.buf.rename()         <cr>
        nnoremap <buffer> grn :lua vim.lsp.buf.rename()         <cr>
        nnoremap <buffer> grt :lua vim.lsp.buf.type_definition()<cr>
    endfunction

    autocmd LspAttach * call s:enableLspMapping()
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-lsp')
    function s:enableLspMapping() abort
        nmap <buffer> [; <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]; <plug>(lsp-next-diagnostic)
        nmap <buffer> -; <plug>(lsp-document-diagnostics)
        nmap <buffer> gO <plug>(lsp-document-symbol)
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> [u <plug>(lsp-references)
        nmap <buffer> ]u <plug>(lsp-references)
        nmap <buffer> [j <plug>(lsp-references)
        nmap <buffer> ]j <plug>(lsp-references)
        nmap <buffer> [n <plug>(lsp-implementation)
        nmap <buffer> ]n <plug>(lsp-implementation)
        nmap <buffer> [k <plug>(lsp-call-hierarchy-incoming)
        nmap <buffer> ]k <plug>(lsp-call-hierarchy-outgoing)
        nmap <buffer> K  <plug>(lsp-hover)
        nmap <buffer> gra <plug>(lsp-code-action)
        nmap <buffer> gre <plug>(lsp-rename)
        nmap <buffer> grn <plug>(lsp-rename)
        nmap <buffer> grt <plug>(lsp-type-definition)

        if exists('+tagfunc')
            setlocal tagfunc=lsp#tagfunc
        endif
        setlocal omnifunc=lsp#complete
    endfunction

    autocmd User lsp_buffer_enabled call s:enableLspMapping()
endif

if exists('g:plugs') && has_key(g:plugs, 'unicode.vim')
    let g:Unicode_no_default_mappings = 1
    nmap ga <plug>(UnicodeGA)
endif


" run macros in visual mode
xnoremap @ :normal @


" move a line of text using alt-j / alt-k
nnoremap <m-j>     mz:m+<cr>`z
nnoremap <m-up>    mz:m+<cr>`z
nnoremap <m-k>     mz:m-2<cr>`z
nnoremap <m-down>  mz:m-2<cr>`z
vnoremap <m-j>     :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <m-up>    :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <m-k>     :m'<-2<cr>`>my`<mzgv`yo`z
vnoremap <m-down>  :m'<-2<cr>`>my`<mzgv`yo`z

" moving delimited text blocks using alt-h / alt-l
nnoremap <m-h>     :SidewaysLeft<cr>
nnoremap <m-left>  :SidewaysLeft<cr>
nnoremap <m-l>     :SidewaysRight<cr>
nnoremap <m-right> :SidewaysRight<cr>

" an argument, inner argument
omap aa <plug>SidewaysArgumentTextobjA
xmap aa <plug>SidewaysArgumentTextobjA
omap ia <plug>SidewaysArgumentTextobjI
xmap ia <plug>SidewaysArgumentTextobjI

" easier way to switch between buffers
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-l><c-l> <c-l>

if exists(':terminal')
    tnoremap <c-w> <c-\><c-n>
endif


" ctrlp family
if exists('g:plugs') && has_key(g:plugs, 'ctrlp.vim')
    nnoremap <expr> <cr>  !empty(&buftype)? "\<cr>":  ':CtrlPMRUFiles<cr>'
    nnoremap <expr> <c-b> !empty(&buftype)? "\<c-b>": ':CtrlPBuffer<cr>'
    nnoremap <expr> <c-n> !empty(&buftype)? "\<c-n>": ':CtrlPModified<cr>'
    nnoremap <expr> <c-f> !empty(&buftype)? "\<c-f>": ':CtrlPFunky<cr>'
    nnoremap <expr> <c-t> !empty(&buftype)? "\<c-t>": ':CtrlPTag<cr>'
    nnoremap [t :CtrlPtjump<cr>
    nnoremap ]t :CtrlPtjump<cr>
    vnoremap [t :CtrlPtjumpVisual<cr>
    vnoremap ]t :CtrlPtjumpVisual<cr>
endif


" omni completion
inoremap <expr> <tab>   pumvisible()? "\<c-n>": "\<tab>"
inoremap <expr> <s-tab> pumvisible()? "\<c-p>": "\<s-tab>"

if exists('g:plugs') && has_key(g:plugs, 'neosnippet')
    imap <expr> ;;
        \ neosnippet#expandable_or_jumpable()?
        \ "\<plug>(neosnippet_expand_or_jump)":
        \ &omnifunc ==# 'emmet#completeTag'?
        \ "\<plug>(emmet-expand-abbr)":
        \ !empty(&omnifunc)? "\<c-x><c-o>": ';;'

    imap <expr> <tab>
        \ pumvisible()? "\<c-n>":
        \ (col('.') > 1 && getline('.')[col('.')-2] =~ '\s')?
        \ "\<tab>":
        \ neosnippet#expandable_or_jumpable()?
        \ "\<plug>(neosnippet_expand_or_jump)":
        \ &omnifunc ==# 'emmet#completeTag'?
        \ "\<plug>(emmet-expand-abbr)":
        \ !empty(&omnifunc)? "\<c-x><c-o>": "\<tab>"

    smap <expr> ;;
        \ neosnippet#expandable_or_jumpable()?
        \ "\<plug>(neosnippet_expand_or_jump)": ';;'

    let g:user_emmet_complete_tag = 1
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key = ';'
    let g:user_emmet_mode = 'i'

    autocmd FileType html,xhtml,xml,css,sass,scss,javascript,javascriptreact,typescript,typescriptreact,mediawiki,vue,eex,php,asp,jsp,smarty EmmetInstall
endif


" clipboard control sequence, OSC 52
vnoremap <cr> "*y

if exists('g:plugs') && has_key(g:plugs, 'vim-oscyank')
    if !has('clipboard')
        vnoremap <cr> :OSCYank<cr>
    endif

    function s:yankOSC52()
        if v:event.regname =~# '[lo]'
            execute 'OSCYankReg ' . v:event.regname
        endif
    endfunction

    if exists("##TextYankPost")
        autocmd TextYankPost * call s:yankOSC52()
    endif
endif


" readline mappings for the command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" opens a new tab with the current buffer's path
cnoreabbrev    ed    edit <c-r>=expand('%:p:h')<cr>/
cnoreabbrev tabed tabedit <c-r>=expand('%:p:h')<cr>/
cnoreabbrev   spl   split <c-r>=expand('%:p:h')<cr>/
cnoreabbrev  vspl  vsplit <c-r>=expand('%:p:h')<cr>/
cnoreabbrev   chd   chdir <c-r>=expand('%:p:h')<cr>/
cnoreabbrev  lchd  lchdir <c-r>=expand('%:p:h')<cr>/
cnoreabbrev  tchd  tchdir <c-r>=expand('%:p:h')<cr>/
cnoreabbrev   sav  saveas <c-r>=expand('%:p:h')<cr>/

" :W sudo saves the file
if exists(':command')
    command! W execute 'w !sudo tee % > /dev/null'
    command! -nargs=+ SetCycle call s:SetCycle(<f-args>)

    function! s:SetCycle(option, ...) abort
        let changed = a:000[index(a:000, eval('&l:' . a:option)) - 1]
        execute 'setlocal ' . a:option . '=' . changed
        execute 'setlocal ' . a:option . '?'
    endfunction
endif
