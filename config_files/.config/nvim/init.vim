" Install plug if it isn't installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
	Plug 'ap/vim-css-color'
	Plug 'mbbill/undotree'
	Plug 'liuchengxu/vim-which-key'
	Plug 'justinmk/vim-sneak'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
call plug#end()

" Switches from vi-compatible mode and enables useful vim functionality
set nocompatible

" dont break words when wrapping
set linebreak

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode.
set relativenumber

" Start scrolling when near bottom of page
set scrolloff=15

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Backspace over anything.
set backspace=indent,eol,start

" Allows hidden buffers
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
set nohlsearch

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nnoremap Q gq " map Q to format/break lines of current paragraph
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" Set leader key to space
let mapleader = " "

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Fix tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Smart indentation
set smartindent

" Use system clipboard always
set clipboard+=unnamedplus

" Enable autocompletion:
set wildmode=longest,list,full

" Splits open at the bottom and right
set splitbelow splitright

" Undodir and undofile
set undodir=~/.config/nvim/undodir
set undofile

" use terminal colors
set termguicolors

" put column for linting
set signcolumn=yes

" remaps for moving selected text
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

" remap for UndoTree
nnoremap <F5> :UndotreeToggle<CR>

"remap for vim whick key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" remap splits navigation to just Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remaps for adjusting split sizes
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

" Limelight-----------------------------------
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" ---------------------------------------------
