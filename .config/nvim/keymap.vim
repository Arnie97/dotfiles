" swap keys
noremap 0 ^
noremap ^ 0
noremap <space> :
map <bslash><bslash> "
nnoremap mm :marks<cr>


" option toggles
nnoremap -b :let &background = &background != 'light'? 'light': 'dark'
            \                     <bar> set background? <cr>
nnoremap -f :let &foldmethod = &foldmethod != 'marker'? 'marker': 'syntax'
            \                     <bar> set foldmethod? <cr>
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
let g:EasyMotionSegments_do_mapping = 0
map <leader>   <plug>(easymotion-prefix)
map <leader>w  <plug>(easymotion-segments-LF)
map <leader>b  <plug>(easymotion-segments-LB)
map <leader>e  <plug>(easymotion-segments-RF)
map <leader>ge <plug>(easymotion-segments-RB)


" jump to conflict markers
let g:conflict_marker_enable_mappings = 0
map gxt <plug>(conflict-marker-themselves)
map gxo <plug>(conflict-marker-ourselves)
map gxn <plug>(conflict-marker-none)
map gxb <plug>(conflict-marker-both)

map [x <plug>(conflict-marker-prev-hunk)
map ]x <plug>(conflict-marker-next-hunk)
map gl <plug>(EasyAlign)


" cycle between buffers, quickfix list and location list
noremap [b :bprev<cr>
noremap ]b :bnext<cr>
noremap [o :cprev<cr>
noremap ]o :cnext<cr>
noremap -o :copen<cr>
noremap [l :lprev<cr>
noremap ]l :lnext<cr>
noremap -l :lopen<cr>


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

if exists(':terminal') == 2
    tnoremap <c-w> <c-\><c-n>
endif


" ctrlp family
noremap <c-p> :<c-u>CtrlP<cr>
noremap <c-f> :<c-u>CtrlPMixed<cr>
noremap <c-b> :<c-u>CtrlPBuffer<cr>
noremap <c-t> :<c-u>CtrlPTag<cr>
noremap <c-m> :<c-u>CtrlPMRUFiles<cr>
noremap <c-/> :<c-u>CtrlPtjump<cr>

" make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>


" readline mappings for the command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" opens a new tab with the current buffer's path
cnoreabbrev tabe tabedit <c-r>=expand("%:p:h")<cr>/

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


" press * or # to search for the current selection in visual mode
" from Michael Naumann
" https://github.com/alexeyr/vimfiles/blob/master/plugin/visualsearch.vim
xnoremap <silent> * :<c-u>call <sid>VisualSelection('')<cr>/<c-R>=@/<cr><cr>
xnoremap <silent> # :<c-u>call <sid>VisualSelection('')<cr>?<c-R>=@/<cr><cr>

" press / to Ack for the selected text
xnoremap <silent> / :call <sid>VisualSelection('ack')<cr>

" press s to replace the selected text in the current buffer
xnoremap <silent> s :call <sid>VisualSelection('replace')<cr>

function s:VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'ack'
        call feedkeys(':Ack "\b(' . l:pattern . ')\b" ')
    elseif a:direction == 'replace'
        call feedkeys(":%s" . '/\<'. l:pattern . '\>/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" pressing @ executes an macro linewise over the selected range
" from Christoph Hermann
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<c-u>call <sid>ExecuteMacroOverVisualRange()<cr>

function s:ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
