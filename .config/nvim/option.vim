" be IMproved
set nocompatible
set background=dark
filetype plugin indent on
syntax enable


" line number and cursor
set number
set nowrap
set cursorline
set scrolloff=2
set sidescrolloff=5


" folding and gutter
set foldlevel=3
set foldmethod=syntax
set foldtext=FoldText()
set foldcolumn=1
set updatetime=100

function! FoldText()
    let indent_level = indent(v:foldstart) - &foldcolumn
    let lines = '{ ' . (v:foldend - v:foldstart - 1) . ' lines... }'
    let summary_text = substitute(getline(v:foldstart), '{.*', lines, '')
    return repeat(' ', indent_level) . summary_text
endfunction


" indent, tab, and backspace
set tabstop=4
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
if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j
endif


" specify the behavior when switching between buffers
set hidden
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry


" backup and undo
set nobackup
set nowritebackup
set noswapfile

if has('persistent_undo')
    set undofile
endif


" use UTF-8 as the standard encoding and en_US as the standard language
" to avoid garbled characters in Chinese language Windows
set encoding=utf-8
let $LANG='en'
set langmenu=en
set spelllang=en,cjk
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


" use LF as the standard line ending
set fileformats=unix,dos,mac


" visualize whitespaces
set list listchars=tab:\|\ ,trail:·,extends:>,precedes:<,conceal:…,nbsp:+

function! CleanExtraSpaces()
    let save_cursor = getpos('.')
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction


" reload when a buffer is changed from the outside
set autoread

if has('autocmd')
    " check file changes from the outside
    autocmd FocusGained,BufEnter * checktime

    " remove trailing spaces on save
    autocmd BufWritePre * :call CleanExtraSpaces()

    " return to last edit position when opening files
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

    " but not in commit messages
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
endif


" show pending commands
set showcmd
set cmdheight=1
set history=1000


" always show the status line
set laststatus=2
set statusline=%f\ %h%w%{HasPaste()}%m%r\ %=%(%l,%c%V\ %=\ %P%)

function! HasPaste()
    if &paste
        return '[Paste]'
    endif
    return ''
endfunction
