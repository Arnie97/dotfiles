if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

if has('autocmd')
    silent! colorscheme peaksea
    autocmd FileType python syntax keyword pythonDecorator True None False self
else
    silent! colorscheme slate
    finish
endif

" set termguicolors
" let g:quantum_black=1
" let g:quantum_italics=1
" colorscheme quantum

if &background == 'dark'
    highlight CursorLine cterm=none ctermbg=237
    highlight CursorLineNr cterm=none ctermbg=237 ctermfg=white
    highlight NonText cterm=none ctermbg=none ctermfg=239
else
    highlight CursorLine cterm=none ctermbg=231
    " highlight CursorLineNr cterm=none ctermbg=231 ctermfg=black
    highlight NonText cterm=none ctermbg=none ctermfg=247
endif

if !exists('g:lightline')
    finish
endif

if system('tput colors') == 256
    let g:lightline.separator    = {'left': '', 'right': ''}
    let g:lightline.subseparator = {'left': '', 'right': ''}
endif
