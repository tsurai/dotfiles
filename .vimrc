set nocompatible
set nomodeline
filetype off

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,gb18030,latin1,default

call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'jnwhiteh/vim-golang'
Plug 'rust-lang/rust.vim'
Plug 'jceb/vim-orgmode'
Plug 'luochen1990/rainbow'

let g:rainbow_active = 1
let g:rainbow_conf = {
\ 'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta']
\}

"" => airline
set timeoutlen=10000 ttimeoutlen=0
set laststatus=2
set noshowmode

let g:airline_theme='deus'
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"" => Colors
set t_Co=16
set background=dark
colorscheme kantan
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set encoding=utf8

"" => Display settings
" show current position
set ruler
set number
set relativenumber
set cursorline

let mapleader=" "
nnoremap <leader>rtw :%s/\s\+$//e<CR>

" Highlight search results
set hlsearch

" Show matching bracketsw
set showmatch

" No sound please
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set wildmenu
set wildcharm=<C-z>
set showmatch
set incsearch

"" => Text behavior
" Use spaces for tabs
set autoread
set history=100
set scrolloff=8
set expandtab
set smarttab

" tab props
set shiftwidth=4
set tabstop=4
set softtabstop=4

" ident & wrap
set lbr
set tw=500
set ai
set si
set wrap
set list

" buffer settings
set hidden
nnoremap <leader>n :enew<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>

"" => Functionality foo
" Moving though long lines
map j gj
map k gk
noremap <Down> gj
noremap <Up> gk

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" Visual mode pressing * or # searches for the current selection
" Idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Search shortcuts
map <space> /
map <c-space> ?

" Tab management keys
"nnoremap <C-tab> :tabnext<CR>
"nnoremap <C-S-tab> :tabprevious<CR>
"inoremap <C-S-tab> <ESC>:tabprevious<CR>i
"inoremap <C-Insert> <ESC>:tabprevious<CR>i
"inoremap <C-Delete> <ESC>:tabclose<CR>i
"nnoremap <A-1> 1gt
"nnoremap <A-2> 2gt
"nnoremap <A-3> 3gt
"nnoremap <A-4> 4gt
"nnoremap <A-5> 5gt
"nnoremap <A-6> 6gt
"nnoremap <A-7> 7gt
"nnoremap <A-8> 8gt
"nnoremap <A-9> 9gt
"nnoremap <A-0> 0gt

map <C-e> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1

nnoremap <C-u> :UndotreeToggle<CR>

" vim-orgmode
let g:org_agenda_files = ['~/org/index.org', '~/org/project.org']

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 1
let g:ycm_cache_omnifunc = 1

" Return to last edited position on opening
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin on
filetype plugin indent on
syntax on
syntax enable
