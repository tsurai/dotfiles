set nocompatible
set nomodeline
filetype off

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,gb18030,latin1,default

let mapleader = " "
let g:ale_lint_on_text_changed = 'normal'

"" => Plugins
call plug#begin('~/.vim/plugged')

"" statusbar
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'

"" rainbow colored parentheses
Plug 'luochen1990/rainbow'

"" file system explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"" undo branch browser
Plug 'mbbill/undotree'

"" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" multi language syntax highlighting
Plug 'sheerun/vim-polyglot'

"" asynchronous lint engine
Plug 'w0rp/ale'

"" easy surrounding with parantheses, brackets and more
Plug 'tpope/vim-surround'

"" ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

"" fuzzy finding
if executable('fzf')
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim'
endif

"" rust
if executable('rustc')
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
endif

call plug#end()

"" => lightline
set timeoutlen=10000 ttimeoutlen=0
set laststatus=2
set showtabline=2
set noshowmode

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#ale#indicator_errors = '✘ '
let g:lightline#ale#indicator_warnings = '▲ '
let g:lightline#ale#indicator_ok = ''

let g:lightline = {
    \ 'colorscheme': 'kantan',
    \ 'active': {
    \   'right': [ ['lineinfo'],
    \              ['percent'],
    \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
    \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [],
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left',
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B'
    \ },
    \ }

"" => nerdtree
map <C-e> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1

"" => undotree
nnoremap <C-u> :UndotreeToggle<CR>

"" => gitgutter
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
" avoids delay with the bprevious binding
nmap <leader>gha <Plug>GitGutterStageHunk
nmap <leader>ghr <Plug>GitGutterUndoHunk
nmap <leader>ghp <Plug>GitGutterPreviewHunk

"" => fzf
nmap ; :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>

"" => ALE
let g:ale_linters = {
    \ 'cpp': ['clangcheck', 'clangtidy', 'cppcheck']
    \ }
let g:ale_cpp_clangtidy_options = 'p ./build/'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✘'
highlight link ALEWarningSign Constant
highlight link ALEErrorSign ErrorMsg

"" => Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta']
    \ }

"" => ctags
let g:gutentags_ctags_exclude = ["build", "target", ".git"]
nmap <F8> :TagbarToggle<CR>

"" => Rust
set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap <leader>rx <Plug>(rust-doc)
au FileType rust nmap <leader>rd <Plug>(rust-def)
au FileType rust nmap <leader>rs <Plug>(rust-def-split)

"" => Non-plugin settings

"" => Shortcuts
nnoremap <leader>rtw :%s/\s\+$//e<CR>
nmap \q :nohlsearch<CR>

"" => Colors
set t_Co=16
set background=dark
colorscheme kantan
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

"" => Display settings
" show current position
set ruler
set number
set relativenumber
set cursorline

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
set incsearch

"" => Text behavior
" Use spaces for tabs
set autoread
set history=100
set scrolloff=8
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" ident & wrap
set lbr
set tw=500
set ai
set si
set wrap

" buffer settings
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

" Return to last edited position on opening
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin indent on
syntax on
