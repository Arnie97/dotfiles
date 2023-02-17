" be IMproved
set nocompatible


" line number and cursor
set number
set nowrap
set cursorline
set scrolloff=2
set sidescrolloff=5
set mouse=nv


" folding and gutter
if has('folding')
    set foldlevel=255
    set foldmethod=syntax
    set foldtext=FoldText()
    set foldcolumn=1
    set updatetime=100

    function! FoldText()
        let first_line = substitute(getline(v:foldstart), '^\s*', '', '')
        let lines = ' { ' . (v:foldend - v:foldstart) . ' lines... }'
        let summary_text = substitute(first_line, '\s*{.*', '', '') . lines
        return repeat(' ', indent(v:foldstart)) . summary_text
    endfunction
endif


" indent, tab, and backspace
set modeline
set tabstop=4
set shiftwidth=0
set autoindent
set smartindent
set smarttab
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" searching experience
set magic
set ignorecase
set smartcase
set hlsearch
set incsearch


" ignore compiled files
set wildmenu
set wildmode=longest:full,full
set wildignore=*~,*.class,*.[newj]ar,*.py[cod],*.o,*.obj,*.a,*.lib,*.so,*.dll,*.dylib,*.out,*.elf,*.exe,.DS_Store


" show matching brackets
set showmatch
set matchtime=2


" don't redraw while executing macros
set lazyredraw


" timeout for key code sequence
set ttimeout
set ttimeoutlen=100


" delete comment character when joining commented lines
set formatoptions+=mB1
if has('patch-7.3.541')
    set formatoptions+=j
endif
if has('patch-8.2.4907') || has('nvim-0.7.1')
    set formatoptions+=/p
endif


" specify the behavior when switching between buffers
set hidden
set switchbuf=useopen,usetab,newtab
set showtabline=2
set splitbelow
set splitright


" backup and undo
set nobackup
set nowritebackup
set noswapfile

if has('persistent_undo')
    set undofile
    set undodir=~/.local/share/nvim/undo
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
endif


" set UTF-8 as the default encoding and en_US as the default language
" to avoid garbled characters in Chinese language Windows
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,gb18030,big5,shift-jis,latin1
set langmenu=en
set spelllang=en,cjk
if exists('+spelloptions')
    set spelloptions=camel
endif

" set LF as the default line ending
set fileformats=unix,dos,mac


" reload when a buffer is changed from the outside
set autoread

if has('autocmd')
    " check file changes on the disk
    autocmd FocusGained,BufEnter * checktime

    " return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

    " but not in commit messages
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

    " remove trailing spaces on save
    let g:trim = 1
    autocmd BufWritePre * call s:TrimWhitespace()

    function s:TrimWhitespace()
        if !g:trim
            return
        endif
        let save_cursor = getpos('.')
        let save_search = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', save_search)
    endfunction
endif

" visualize whitespaces
set list listchars=tab:\|\ ,trail:·,extends:>,precedes:<,conceal:…,nbsp:+


" show pending commands and the status line
set showcmd
set cmdheight=1
set history=1000

set laststatus=2
set statusline=\ %t\ %h%w%m%r\ %<%=%{&ff}\ %{&fenc}\ %{&ft}\ \ %(%l,%c%V\ \ %P\ %)
