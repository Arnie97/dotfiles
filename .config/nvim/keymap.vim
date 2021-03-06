" swap keys
noremap 0 ^
noremap ^ 0
noremap <space> :
map <bslash> "
nnoremap mm :marks<cr>

" option toggles
nnoremap -b :let &background = &background != 'light'? 'light': 'dark'
                                \ <bar> set background? <cr>
nnoremap -f :let &l:foldmethod = &foldmethod != 'syntax'? 'syntax': 'indent'
                                \ <bar> set foldmethod? <cr>
nnoremap -c :setlocal cursorline! <bar> set cursorline? <cr>
nnoremap -e :setlocal expandtab!  <bar> set expandtab?  <cr>
nnoremap -h :setlocal hlsearch!   <bar> set hlsearch?   <cr>
nnoremap -i :setlocal ignorecase! <bar> set ignorecase? <cr>
nnoremap -n :setlocal number!     <bar> set number?     <cr>
nnoremap -p :setlocal paste!      <bar> set paste?      <cr>
nnoremap -r :setlocal autoread!   <bar> set autoread?   <cr>
nnoremap -s :setlocal spell!      <bar> set spell?      <cr>
nnoremap -t :setlocal list!       <bar> set list?       <cr>
nnoremap -w :setlocal wrap!       <bar> set wrap?       <cr>

" remove the Windows ^M - when the line endings gets messed up
nnoremap -m mmHmt:%s/<c-v><cr>//ge<cr>'tzt'm
nnoremap -g :SignifyToggle<cr>
nnoremap -/ :nohlsearch<cr>

" jump to camelCase segments
if exists('g:plugs') && has_key(g:plugs, 'vim-easymotion-segments')
    let g:EasyMotionSegments_do_mapping = 0
    map [   <plug>(easymotion-prefix)
    map ]   <plug>(easymotion-prefix)
    map [w  <plug>(easymotion-segments-LF)
    map ]w  <plug>(easymotion-segments-LF)
    map [b  <plug>(easymotion-segments-LB)
    map ]b  <plug>(easymotion-segments-LB)
    map [e  <plug>(easymotion-segments-RF)
    map ]e  <plug>(easymotion-segments-RF)
    map [ge <plug>(easymotion-segments-RB)
    map ]ge <plug>(easymotion-segments-RB)
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
    map gl <plug>(EasyAlign)
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


if exists('g:plugs') && has_key(g:plugs, 'vim-lsp')
    function s:enableLspMapping() abort
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> [u <plug>(lsp-references)
        nmap <buffer> ]u <plug>(lsp-references)
        nmap <buffer> [a <plug>(lsp-implementation)
        nmap <buffer> ]a <plug>(lsp-implementation)
        nmap <buffer> [t <plug>(lsp-type-definition)
        nmap <buffer> ]t <plug>(lsp-type-definition)
        nmap <buffer> gr <plug>(lsp-rename)
        nmap <buffer> [h <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]h <plug>(lsp-next-diagnostic)
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
    noremap <expr><c-f> !empty(&buftype)? "\<c-m>": ':<c-u>CtrlPRoot<cr>'
    noremap <expr><c-m> !empty(&buftype)? "\<c-m>": ':<c-u>CtrlPMRUFiles<cr>'
    noremap <expr><c-b> !empty(&buftype)? "\<c-b>": ':<c-u>CtrlPBuffer<cr>'
    noremap <expr><c-t> !empty(&buftype)? "\<c-t>": ':<c-u>CtrlPFunky<cr>'
    noremap <expr><c-/> !empty(&buftype)? "\<c-/>": ':<c-u>CtrlPtjump<cr>'
endif


" readline mappings for the command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" opens a new tab with the current buffer's path
cnoreabbrev tabed tabedit <c-r>=expand('%:p:h')<cr>/
cnoreabbrev   chd   chdir <c-r>=expand('%:p:h')<cr>/
cnoreabbrev  lchd  lchdir <c-r>=expand('%:p:h')<cr>/
cnoreabbrev  tchd  tchdir <c-r>=expand('%:p:h')<cr>/

" :W sudo saves the file
if exists(':command')
    command! W execute 'w !sudo tee % > /dev/null'
endif
