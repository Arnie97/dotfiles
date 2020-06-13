" opens a new tab with the current buffer's path
cnoreabbrev tabed tabedit <c-r>=expand('%:p:h')<cr>/

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null'


" pressing @ executes an macro linewise over the selected range
" from Christoph Hermann
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<c-u>call <sid>ExecuteMacroOverVisualRange()<cr>

function s:ExecuteMacroOverVisualRange()
    echo '@'.getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction


" press * or # to search for the current selection in visual mode
" from Michael Naumann
" https://github.com/alexeyr/vimfiles/blob/master/plugin/visualsearch.vim
xnoremap <silent> * :<c-u>call <sid>VisualSelection('')<cr>/<c-r>=@/<cr><cr>
xnoremap <silent> # :<c-u>call <sid>VisualSelection('')<cr>?<c-r>=@/<cr><cr>

" press / to Ack for the selected text
xnoremap <silent> / :call <sid>VisualSelection('ack')<cr>

" press s to replace the selected text in the current buffer
xnoremap <silent> s :call <sid>VisualSelection('replace')<cr>

function s:VisualSelection(direction) range
    let l:saved_reg = @"
    execute 'normal! vgvy'

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, '\n$', '', '')

    if a:direction == 'ack'
        call feedkeys(':Ack "\b(' . l:pattern . ')\b" ')
    elseif a:direction == 'replace'
        call feedkeys(':%s' . '/\<'. l:pattern . '\>/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
