set nocompatible
filetype off

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,gb18030,latin1,default

"" => Vundle Settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'jnwhiteh/vim-golang'
Plugin 'wting/rust.vim'

"" => Colors
set t_Co=16
set background=dark
colorscheme kantan
set guifont=Meslo\ LG\ S:h12
set encoding=utf8

"" => Display settings
" show current position
set ruler
set number
set cursorline

" Always show status line
set laststatus=2

" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=
set statusline+=[%n]\ %* " buffer
set statusline+=%<%F%*\ " file path
set statusline+=[%{strlen(&fenc)?&fenc:'none'}/ " encoding
set statusline+=%{&ff}] " file format
set statusline+=%m%* " modified
set statusline+=%=%5l%*\/%L%* " current/total lines
set statusline+=%4v\ %* " current column
set statusline+=0x%04B\ %* " selected character code

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
set shiftwidth=2
set tabstop=2
set softtabstop=2

" ident & wrap
set lbr
set tw=500
set ai
set si
set wrap
set list

"" => Functionality foo
" Moving though long lines
map j gj
map k gk
noremap <Down> gj
noremap <Up> gk

" Visual mode pressing * or # searches for the current selection
" Idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Search shortcuts
map <space> /
map <c-space> ?

" Tab management keys
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <C-e> :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 1
let g:ycm_cache_omnifunc = 1

func Backspace()
    if col('.') == 1
          if line('.')  != 1
                  return  "\<ESC>kA\<Del>"
          else
                  return ""
          endif
    else
          return "\<Left>\<Del>"
    endif
endfunc

inoremap <BS> <c-r>=Backspace()<CR>

" Return to last edited position on opening
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

filetype plugin on
filetype plugin indent on
syntax on
