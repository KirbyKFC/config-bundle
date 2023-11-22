-- for windows
vim.opt.encoding='utf-8'
vim.opt.autoread=true
vim.opt.mouse='a'
vim.opt.mousemodel='extend'
local dataPath=vim.fn.stdpath('data')

-- plugin
local lazypath=dataPath..'/weapon/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
	'vim-airline/vim-airline',
	'vim-airline/vim-airline-themes',
	'Th3Whit3Wolf/one-nvim',
	'mbbill/undotree',
	{
		'wfxr/minimap.vim',
		-- 		init=function() vim.fn['Minimap']() end,
	},
	{
		'mbbill/fencview',
		lazy=true,
		cmd={'FencAutoDetect','FencManualEncoding','FencView'},
	},
	{
		'tversteeg/registers.nvim',
		name = 'registers',
		keys={
			{'\'', mode={'n','v'}},
			{'<C-R>', mode='i'}
		},
		cmd='Registers',
		config=true,
	},
	{'tenxsoydev/karen-yank.nvim', config = true},
	{
		'ms-jpq/coq_nvim',
		branch='coq',
		init = function() vim.g.coq_settings = { auto_start = 'shut-up' } end,
		dependencies={
			{'ms-jpq/coq.artifacts',branch='artifacts'},
			{'ms-jpq/coq.thirdparty',branch='3p'},
		},
	},
	{
		'AckslD/muren.nvim',
		cmd={'MurenToggle','MurenOpen','MurenOpen','MurenUnique'},
		config = true,
	},
},{
	root = dataPath..'/weapon',
	lockfile = dataPath..'/weapon/lazy-lock.json'
})

-- theme
vim.opt.termguicolors=true
vim.opt.background='dark'
vim.g['one_allow_italics']=1
vim.g['airline#extensions#tabline#enabled']=1
vim.g['airline#extensions#tabline#show_buffers']=1
vim.g['airline#extensions#tabline#buffer_min_count']=2
vim.g['airline#extensions#tabline#tab_min_count']=2
vim.g['airline_theme']='onedark'
vim.cmd.colorscheme('one-nvim')

-- indent line
-- vim.opt.listchars='tab:\\┆\\ ,trail:·,extends:»,precedes:«,nbsp:×'
vim.opt.list=true
vim.opt.listchars={tab='┆ ', trail='·', extends='»', precedes='«', nbsp='×'}
vim.opt.clipboard='unnamed'
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.hlsearch=false
vim.opt.autochdir=true
vim.opt.cursorline=true
vim.opt.smartindent=true
vim.opt.showcmd=true
vim.opt.showmatch=true
vim.opt.matchtime=1
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.incsearch=true
vim.opt.backspace='indent,eol,start'
vim.opt.fileencodings='ucs-bom,utf-8,cp936,gb18030,big5,sjis,euc-jp,euc-kr,latin1'
vim.opt.ts=4
vim.opt.sw=4
vim.opt.swapfile=true
vim.opt.directory=dataPath..'/swap'

-- set plugin
vim.g['minimap_auto_start']=1

-- keybind
vim.keymap.set('n', '<M-u>', ':UndotreeToggle<CR>', {silent=true})
