" swap keys
noremap 0 ^
noremap ^ 0
noremap x "-x
noremap Y y$
noremap <space> :
map <bslash> "
nnoremap & :&&<cr>
nnoremap mm :marks<cr>

" option toggles
nnoremap <expr> -b <sid>ToggleOption('background', 'light', 'dark')
nnoremap <expr> -e <sid>ToggleOption('expandtab')
nnoremap <expr> -f <sid>ToggleOption('foldmethod', 'syntax', 'indent')
nnoremap <expr> -i <sid>ToggleOption('ignorecase')
nnoremap <expr> -n <sid>ToggleOption('number')
nnoremap <expr> -p <sid>ToggleOption('paste')
nnoremap <expr> -s <sid>ToggleOption('spell')
nnoremap <expr> -t <sid>ToggleOption('list')
nnoremap <expr> -w <sid>ToggleOption('wrap')

" remove the Windows ^M - when the line endings gets messed up
nnoremap -m mmHmt:%s/<c-v><cr>//ge<cr>'tzt'm
nnoremap -y :SignifyToggle<cr>
nnoremap -c :SignifyHunkDiff<cr>
nnoremap -u :SignifyHunkUndo<cr>
nnoremap -a :let g:trim = !g:trim<bar> echo (g:trim? '  ': 'no').'trim'<cr>
nnoremap -d :lua require 'dapui'.toggle()<cr>
nnoremap -k :lua require 'dap'.toggle_breakpoint()<cr>
nnoremap -. :lua require 'dap'.continue()<cr>
nnoremap -/ :lua require 'dap-repl'.conditional_breakpoint()<cr>
nnoremap -- <plug>VinegarUp


" fast jump with sneak
if exists('g:plugs') && has_key(g:plugs, 'vim-sneak')
    nmap f  <plug>Sneak_f
    nmap F  <plug>Sneak_F
    nmap t  <plug>Sneak_t
    nmap T  <plug>Sneak_T
    nmap gz <plug>Sneak_s
    nmap gZ <plug>Sneak_S
    xmap z  <plug>Sneak_s
    xmap Z  <plug>Sneak_S
endif


" jump to conflict markers
if exists('g:plugs') && has_key(g:plugs, 'conflict-marker.vim')
    let g:conflict_marker_enable_mappings = 0
    map gxt <plug>(conflict-marker-themselves)
    map gxo <plug>(conflict-marker-ourselves)
    map gxn <plug>(conflict-marker-none)
    map gxb <plug>(conflict-marker-both)

    map [x <plug>(conflict-marker-prev-hunk)
    map ]x <plug>(conflict-marker-next-hunk)
endif


" cycle between buffers, quickfix list and location list
nnoremap [n :bprev<cr>
nnoremap ]n :bnext<cr>
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

if has('autocmd')
    autocmd FileType qf nnoremap <buffer> -o :cclose<cr>
    autocmd FileType qf nnoremap <buffer> -l :lclose<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-lsp')
    function s:enableLspMapping() abort
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> [u <plug>(lsp-references)
        nmap <buffer> ]u <plug>(lsp-references)
        nmap <buffer> [a <plug>(lsp-implementation)
        nmap <buffer> ]a <plug>(lsp-implementation)
        nmap <buffer> gy <plug>(lsp-type-definition)
        nmap <buffer> [y <plug>(lsp-peek-type-definition)
        nmap <buffer> ]y <plug>(lsp-peek-type-definition)
        nmap <buffer> gr <plug>(lsp-rename)
        nmap <buffer> [g <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]g <plug>(lsp-next-diagnostic)
        nmap <buffer> -g <plug>(lsp-document-diagnostics)
        nmap <buffer> K  <plug>(lsp-hover)

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
        \ "\<plug>(emmet-expand-abbr)": ';;'

    smap <expr> ;;
        \ neosnippet#expandable_or_jumpable()?
        \ "\<plug>(neosnippet_expand_or_jump)": ';;'

    let g:user_emmet_complete_tag = 1
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key = ';'
    let g:user_emmet_mode = 'i'

    autocmd FileType html,xhtml,xml,css,sass,scss,javascript,javascriptreact,typescript,typescriptreact,vue,eex,php,asp,jsp,smarty EmmetInstall
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

" :W sudo saves the file
if exists(':command')
    command! W execute 'w !sudo tee % > /dev/null'
endif

function <sid>ToggleOption(key, ...) abort
    let target = '!'
    if a:0 > 1
        let target = '='.(eval('&'.a:key) !=# a:1? a:1 : a:2)
    endif
    return ':setlocal '.a:key.target.' | set '.a:key."?\n"
endfunction
