        _
 __   _(_)_ __ ___  _ __ ___
 \ \ / / | '_ ` _ \| '__/ __|
  \ V /| | | | | | | | | (__
   \_/ |_|_| |_| |_|_|  \___|


" ==     __  ____   ____     _____ __  __ ____   ____ 
" ==    |  \/  \ \ / /\ \   / /_ _|  \/  |  _ \ / ___|
" ==    | |\/| |\ V /  \ \ / / | || |\/| | |_) | |    
" ==    | |  | | | |    \ V /  | || |  | |  _ <| |___ 
" ==    |_|  |_| |_|     \_/  |___|_|  |_|_| \_\\____|
" ==
" Auto load plugs for the first time uses
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" file path of swap, backup, undo files
if !isdirectory($HOME.'/.cache/vim')
    call mkdir($HOME.'/.cache/vim')
endif

" nocompatible mode
set nocompatible
" open filetype, plugin, indent
filetype plugin indent on
" open syntax
syntax on

exec "nohlsearch"
" for man, just type ':Map echo' for test
exec "runtime! ftplugin/man.vim"

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
" for map timeout
set timeout
set timeoutlen=1500
" for keycode timeout
set ttimeout
set ttimeoutlen=10
set pastetoggle=<F10>
set hlsearch
set incsearch
set ignorecase
set smartcase
set whichwrap=b,s
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=6
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
" disable textwidth auto wrap
set formatoptions-=tc
set laststatus=2
" set working directory to the current file
set autochdir
set nolangremap
set textwidth=0
set indentexpr=
set ttyfast
set lazyredraw
set virtualedit=block
" swap file
set directory=$HOME/.cache/vim/swap
set updatecount=100
" file backup
set backup
set backupext=.bak
set backupdir=$HOME/.cache/vim/backup
" undo file
set undofile
set undodir=$HOME/.cache/vim/undo

" cursor shape in i mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" cursor shape in r mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" cursor shape in normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" let vim with terminal be better
let &t_ut = ''
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" go back the last line where you quit vim
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                  \ |   exe "normal! g`\"" | endif

" diff current file with backup file
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" leader map
let g:mapleader=" "
" Open the vimrc file
noremap <LEADER>rc :edit $MYVIMRC<CR>
" shut dowm the highlight of last search
noremap <LEADER><CR> :nohlsearch<CR>
" move cursor to other window
noremap <LEADER>l <C-w>l
noremap <LEADER>i <C-w>k
noremap <LEADER>j <C-w>h
noremap <LEADER>k <C-w>j
" swith the position of current window
noremap <LEADER>L <C-w>L
noremap <LEADER>I <C-w>K
noremap <LEADER>J <C-w>H
noremap <LEADER>K <C-w>J
" indent fold
noremap <LEADER>a za
" smart screen refresh
nnoremap <LEADER>c :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
noremap <LEADER>s :%s//g<left><left>
" switch upper or lower
noremap <LEADER>u ~h
" open a terminal
noremap <LEADER>t :set splitbelow<CR>:term<CR>
" cute font
noremap <LEADER>f :r !figlet 
" go to next buffer
noremap <LEADER>bn :bnext<CR>
" go to previous buffer
noremap <LEADER>bp :bprevious<CR>
" go to the buffer that you view just before
noremap <LEADER>bb <C-^>
" delete current buffer
noremap <LEADER>bd :bdelete<CR>

" go next or previous searched text and keep in middle of screen
nnoremap - Nzz
nnoremap = nzz
" change indent
nnoremap < <<
nnoremap > >>
" go into insert mode
noremap m i
noremap M I
" mark
noremap h m
noremap H :marks<CR>
" move
noremap j h
noremap J 5h
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap L 5l
" s for substitute
nnoremap s r

" move current line up
noremap <C-i> :<c-u>execute 'move -1-'. v:count1<cr>
" move current line down
noremap <C-k> :<c-u>execute 'move +'. v:count1<cr>
" move cusor to head of current line
noremap <C-j> 0
" move cusor to end of current line
noremap <C-l> $
" quit all buffers
noremap <C-q> :qall<CR>
" save all buffers
noremap <C-w> :wall<CR>
noremap <C-u> <C-i>
noremap <C-g> :terminal lazygit<CR>
" use sys-clipboard in normal mode
nnoremap <C-y> "+yy
nnoremap <C-p> o<Esc>"+p

" go the end of the current line but ignore the return char
xnoremap <C-l> g_
" use sys-clipboard in v mode
xnoremap <C-y> "+y
xnoremap <C-p> "+p

" command mode movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-j> <Left>
cnoremap <C-l> <Right>

" re-select view block after indent in v mode
xnoremap < <gv
xnoremap > >gv
" save
noremap S :w<CR>
noremap s <nop>
" quit
nnoremap Q :q<CR>
" refresh my vimrc
noremap R :source $MYVIMRC<CR>

" split windows
noremap sl :set splitright<CR>:vsplit<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>
noremap si :set nosplitbelow<CR>:split<CR>
noremap sk :set splitbelow<CR>:split<CR>

" alter size of the current window
noremap <up> :resize +5<CR>
noremap <down> :resize -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

" tab operation
noremap te :tabedit<CR>
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>
" alter direction of the current window
noremap sv <C-w>t<C-w>H
noremap sh <C-w>t<C-w>K
" rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap r :call CompileRun()<CR>
" Compile function
func! CompileRun()
	exec "w"
	if &filetype == 'c'
        set splitbelow
		exec "!gcc % -o %<"
		exec "terminal ./%<"
        exec "resize -10"
	elseif &filetype == 'cpp'
        set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
        exec "terminal ./%<"
        exec "resize -10"
	elseif &filetype == 'java'
        set splitbelow
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!bash %
	elseif &filetype == 'python'
        set splitbelow
		exec "terminal python3 %"
        exec "resize -10"
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	endif
endfunc

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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

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
nnoremap <C-n> :NERDTreeToggle<CR>

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

" markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
