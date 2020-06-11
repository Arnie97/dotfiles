if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
elseif has('nvim')
    set termguicolors
else
    set term=screen-256color
endif

if has('autocmd')
    autocmd FileType python syntax keyword pythonDecorator True None False self
else
    silent! colorscheme slate
    finish
endif

silent! colorscheme peaksea

" set termguicolors
" let g:quantum_black=1
" let g:quantum_italics=1
" colorscheme quantum


if !exists('g:lightline')
    finish
endif

" schemes: wombat, powerline, jellybeans, PaperColor, seoul256
if &background == 'dark'
    let g:lightline.colorscheme = 'wombat'
    highlight CursorLine cterm=none ctermbg=237
    highlight CursorLineNr cterm=none ctermbg=237 ctermfg=white
    highlight NonText cterm=none ctermbg=none ctermfg=239
else
    let g:lightline.colorscheme = 'PaperColor'
    highlight CursorLine cterm=none ctermbg=231
    " highlight CursorLineNr cterm=none ctermbg=231 ctermfg=black
    highlight NonText cterm=none ctermbg=none ctermfg=247
endif

if system('tput colors') == 256
    let g:lightline.separator    = {'left': '', 'right': ''}
    let g:lightline.subseparator = {'left': '', 'right': ''}
endif
