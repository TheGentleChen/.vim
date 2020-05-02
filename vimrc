" ==        _
" == __   _(_)_ __ ___  _ __ ___
" == \ \ / / | '_ ` _ \| '__/ __|
" ==  \ V /| | | | | | | | | (__
" ==   \_/ |_|_| |_| |_|_|  \___|
"
" ==
" - Auto load for the first time uses
" ==
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
filetype plugin indent on
syntax enable
syntax on

set encoding=utf-8
set title
set autoread
set number
set relativenumber
set cursorline
set wrap
set showcmd
set ruler
set wildmenu
set history=100
set ttimeout
set ttimeoutlen=0
set pastetoggle=<F10>
set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase
set nolangremap
set whichwrap=b,s
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=6
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir

" file backup
if has("vms")
          set nobackup
        else
          set backup
          set backupext=.bak
          if has('persistent_undo')
            set undofile
          endif
        endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_ut=''
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                  \ |   exe "normal! g`\""
                  \ | endif

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis

let mapleader=" "
" Open the vimrc file anytime
map <LEADER>rc :edit $MYVIMRC<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j
map <LEADER>L <C-w>L
map <LEADER>I <C-w>K
map <LEADER>J <C-w>H
map <LEADER>K <C-w>J
map <LEADER>bn :wnext<CR>
map <LEADER>bp :wprevious<CR>
map <LEADER>bb <C-^>
map <LEADER>bd :bd<CR>
map <C-j> 0
map <C-l> $
map <C-q> :qall<CR>
map <C-w> :wall<CR>

noremap - Nzz
noremap = nzz
noremap > >>
noremap < <<
noremap m i
noremap h m
noremap M I
noremap j h
noremap J 5h
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap L 5l
nnoremap Y "*yy

vnoremap Y "*y

map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <up> :resize +5<CR>
map <down> :resize -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

map te :tabedit<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

call plug#begin('~/.vim/plugged')

Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme snazzy

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
  let g:airline_symbol = {}
endif

" ycm
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
nnoremap gdf :YcmCompleter GoTODefinition<CR>
nnoremap gdc :YcmCompleter GoToDeclaration<CR>
nnoremap gi :YcmCompleter GoToInclude<CR>
nnoremap gt :YcmCompleter GoTo<CR>
nnoremap ht :YcmCompleter GetType<CR>
nnoremap hp :YcmCompleter GetParent<CR>
nnoremap hd :YcmCompleter GetDoc<CR>
nnoremap nr :YcmCompleter RefactorRename 


" rainbow
let g:rainbow_active = 1

" nerdcommenter
let g:NERDSpaceDelims = 1

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" nerdtree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
