"vim-plug
call plug#begin('~/.config/nvim/weapon')

Plug 'vim-airline/vim-airline'
Plug 'rakr/vim-one'
Plug 'luochen1990/rainbow'
Plug 'w0rp/ale', {'for':'java,c,cpp,cs,python,sql,xml,json,registry,conf,javascript,html,vue,css,sh,vim'} 
Plug 'cespare/vim-toml', {'for':'toml'} 
Plug 'maralla/completor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'mbbill/fencview'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

"设置为24bit颜色模式
if (has("termguicolors"))
	set termguicolors
endif


"主题设置
set background=light
let g:one_allow_italics = 1
let g:airline_theme='one'
colorscheme one 
hi Normal guibg=NONE ctermbg=NONE
let g:rainbow_active = 1

"主题自定义
if has('autocmd') && !has('gui_running')
	augroup colorset
		autocmd!
		autocmd ColorScheme one silent! call one#highlight('Normal', '', '000000', '')
	augroup END
endif

"indent line
set list listchars=tab:\┆\ ,trail:·,extends:»,precedes:«,nbsp:×

"剪贴板交互
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
	augroup END
end
"noremap <C-v> :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')
noremap <M-p> :r !/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard<CR>

set title
set clipboard=unnamed
set number		"行号
set hlsearch
set autochdir
set cursorline
set smartindent
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set matchtime=1
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set backspace=indent,eol,start
set directory=~/.config/nvim/tmp
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,sjis,euc-jp,euc-kr,latin1
set ts=4
set sw=4

"set plugin
let g:mkdp_preview_options = {'disable_filename': 1}

"keybind
nnoremap <M-u> :UndotreeToggle<CR>
noremap <silent> <M-t> :NERDTreeToggle<CR>
