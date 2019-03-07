" nice defaults
" git clone https://github.com/amix/vimrc ~/.config/nvim
source ~/.config/nvim/vimrcs/basic.vim
source ~/.config/nvim/vimrcs/filetypes.vim
source ~/.config/nvim/vimrcs/plugins_config.vim
source ~/.config/nvim/vimrcs/extended.vim

" line numbers
set number
set cmdheight=1
set updatetime=100

let g:gitgutter_enabled = 1
let g:go_version_warning = 0

" remove trailing whitespaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" keep home directory clean
let MRU_File = $HOME . '/.config/nvim/temp_dirs/mru'
try
    set undodir=~/.config/nvim/temp_dirs/undodir
catch
endtry

" schemes: wombat, darcula, Dracula, powerline, jellybeans,
" solarized, landscape, Tomorrow_Night, PaperColor, Molokai
let g:lightline = {
    \ 'colorscheme': 'wombat',
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive'
	\ }}

function! LightlineReadonly()
	return &readonly ? 'READ ONLY' : ''
endfunction

function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction
