" Leader
let mapleader = " "
let maplocalleader = " "

" Line numbers
set number
set relativenumber

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set breakindent

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Syntax
syntax on
filetype plugin indent on

" UI
set signcolumn=yes
set nocursorline
set scrolloff=8
set nowrap
set showmode
set showcmd
set mouse=a

" Splits
set splitright
set splitbelow

" Files
set noswapfile
set nobackup
set undofile

" Performance
set updatetime=250
set timeoutlen=1000

" Clipboard
set clipboard=unnamedplus

" File finding
set path+=**
set wildmenu

" Completion
set completeopt=menu,menuone,noinsert

" Disable space in normal and visual
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

" Escape from insert mode
inoremap <C-c> <Esc>

" Centered scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Move selections up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Paste without overwriting register
xnoremap <leader>p "_dP

" Indent and stay in visual
vnoremap < <gv
vnoremap > >gv

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Quickfix
nnoremap ]q <cmd>cnext<CR>zz
nnoremap [q <cmd>cprev<CR>zz

" Plugin emulations
nnoremap <leader>1 <cmd>Ex<CR>
nnoremap <leader>o :find<Space>
nnoremap <leader>f :grep<Space>
nnoremap <leader><Tab> :ls<CR>:b<Space>
nnoremap <leader>2 <cmd>marks<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
