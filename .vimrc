runtime! debian.vim

"vim-plug
call plug#begin('~/.vim/weapon')

Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'luochen1990/rainbow'
"Plug 'mileszs/ack.vim'
Plug 'w0rp/ale', {'for':'java,c,cpp,cs,python,sql,xml,json,registry,conf'} 
Plug 'mbbill/fencview'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', {'do':{ -> mkdp#util#install() }, 'for':'markdown'}

call plug#end()

"设置为24bit颜色模式
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif 

"覆盖onedark默认配置
if (has("autocmd"))
  augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "#000000" } })
  augroup END
endif
colorscheme onedark 

let g:rainbow_active = 1

"剪贴板交互
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
	augroup WSLYank
	        autocmd!
	        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
end
"noremap <C-v> :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')
noremap <C-v> :r !/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard<CR>

"完善鼠标支持
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

set background=dark
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
set directory=~/.vim/tmp
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,sjis,euc-jp,euc-kr,latin1
