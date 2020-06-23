" ==     __  ____   ____     _____ __  __ ____   ____
" ==    |  \/  \ \ / /\ \   / /_ _|  \/  |  _ \ / ___|
" ==    | |\/| |\ V /  \ \ / / | || |\/| | |_) | |
" ==    | |  | | | |    \ V /  | || |  | |  _ <| |___
" ==    |_|  |_| |_|     \_/  |___|_|  |_|_| \_\\____|
" ==
" ==            Originated by Rainbow Chen

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
" syntax enable
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
" for map timeout
set timeout
set timeoutlen=1500
" for keycode timeout
set ttimeout
set ttimeoutlen=10
set hlsearch
set incsearch
set ignorecase
set smartcase
set whichwrap=b,s
set shiftwidth=4
set tabstop=8
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=6
set cindent
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
" disable textwidth auto wrap
set formatoptions=q
set laststatus=2
" set working directory to the current file
set updatetime=100
set updatecount=100
set autochdir
set nolangremap
set indentexpr=
set ttyfast
set lazyredraw
set virtualedit=block
set completeopt=menuone
set termguicolors
set noshowmode
" shutdown the error bell
set noerrorbells
set novisualbell
set vb t_vb=
" recommender render 256 colors
set t_Co=256
" for devicons around brackets
set conceallevel=3
" swap file
set directory=$HOME/.cache/vim/swap
" file backup
set backup
set backupext=.bak
set backupdir=$HOME/.cache/vim/backup
" undo file
set undofile
set undodir=$HOME/.cache/vim/undo
" viminfo
set viminfo='1000,f1,<500
" cursor shape in i mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" cursor shape in r mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" cursor shape in normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" let vim with terminal be better
let &t_ut = ''
" set vim-specific sequences for RGB colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" go back the last line where you quit vim
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                  \ |   exe "normal! g`\"" | endif
" automatically deletes all trailing whitespace and newlines at end of file on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

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
" substitute
noremap <LEADER>s :%s///g<left><left><left>
" switch upper or lower
noremap <LEADER>u ~h
" open a terminal
noremap <LEADER>T :set splitbelow<CR>:term<CR>
" cute font
noremap <LEADER>fr :r !figlet<SPACE>
" lazygit
noremap <LEADER>gi :terminal lazygit<CR>
" oldfile
" noremap <LEADER>o :browse oldfile<CR>
" go to next buffer
noremap <LEADER>bn :bnext<CR>
" go to previous buffer
noremap <LEADER>bp :bprevious<CR>
" go to the buffer that you view just before
noremap <LEADER>bb <C-^>
" delete current buffer
noremap <LEADER>bd :bdelete<CR>
" alter the keymap between colemak with normal us keyboard
noremap <LEADER>bc :source $HOME/.vim/insert-colemak.vim<CR>
noremap <LEADER>bu :source $HOME/.vim/insert-normal.vim<CR>
" plus 1 to value in current location
noremap <LEADER>. <C-a>
" minus 1 to value in current location
noremap <LEADER>, <C-x>
" jump to the next placehold and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" search
noremap // /

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
" movement
noremap j h
noremap J b
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap L w
" visual movement
noremap gk gj
noremap gi gk
" s for substitute
nnoremap ss r

" move current line up
noremap <C-i> :<c-u>execute 'move -1-'. v:count1<cr>
" move current line down
noremap <C-k> :<c-u>execute 'move +'. v:count1<cr>
" move cusor to head of current line
noremap <C-j> 0
" move cusor to end of current line
noremap <C-l> $
" quit all buffers
" noremap <C-q> :qall<CR>
" save all buffers
" noremap <C-w> :wall<CR>
" <C-u> go to older position, <C-o> go to newer position
noremap <C-o> <C-i>
noremap <C-u> <C-o>
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

" insert mode movement inner current line
inoremap <C-j> <Esc>I
inoremap <C-l> <Esc>A
" re-select view block after indent in v mode
xnoremap < <gv
xnoremap > >gv
" save
nnoremap S :w<CR>
nnoremap s <nop>
" quit
nnoremap Q :q<CR>
" refresh my vimrc
nnoremap R :source $MYVIMRC<CR>

" split windows
nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sj :set nosplitright<CR>:vsplit<CR>
nnoremap si :set nosplitbelow<CR>:split<CR>
nnoremap sk :set splitbelow<CR>:split<CR>

" alter size of the current window
noremap <up> :resize +5<CR>
noremap <down> :resize -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

" tab operation
nnoremap tj :-tabnext<CR>
nnoremap te :tabedit<CR>
nnoremap tl :+tabnext<CR>
nnoremap tmj :-tabmove<CR>
nnoremap tml :+tabmove<CR>
" make current window widest on left or top
nnoremap sv <C-w>H
nnoremap sh <C-w>K
" rotate windows
nnoremap sr <C-w>r
nnoremap sR <C-w>R

" compile and run (file scope or project scope)
noremap <F6> :AsyncTask file-build<CR>
noremap <F7> :call FileRun()<CR>
noremap <LEADER><F6> :AsyncTask project-build<CR>
noremap <LEADER><F7> :AsyncTask project-run<CR>
" Compile function
func! FileRun()
	exec "w"
	if &filetype == 'markdown'
	    exec "MarkdownPreview"
	else
	    set splitbelow
	    exec "AsyncTask file-run"
	endif
endfunc

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'francoiscabrol/ranger.vim'
" nvim need this for ranger.vim
" Plug 'rbgrouleff/bclose.vim'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
Plug 'liuchengxu/vista.vim'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-xtabline'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-signify'
Plug 'Shougo/echodoc.vim'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/suda.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'connorholyday/vim-snazzy'
" keep on last position
Plug 'ryanoasis/vim-devicons'

call plug#end()

" vim colorscheme
colorscheme onedark
"onedark
let g:onedark_terminal_italics = 1

" nord
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1

" airline
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
  let g:airline_symbol = {}
endif

" ycm
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python': ['re!\w{1}'],
  \ }
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gp :YcmCompleter GetParent<CR>
nnoremap g; :YcmCompleter GetDoc<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gn :YcmCompleter RefactorRename<SPACE>
nnoremap /F :YcmCompleter FixIt<CR>

" rainbow
let g:rainbow_active = 1

" vim-surround
nmap <LEADER>" ysmW"
nmap <LEADER>' ysmW'
nmap <LEADER>) ysmW)
nmap <LEADER>{ ysmW{
nmap <LEADER>[ ysmW[
nmap <LEADER>/ ysmW*ysmW/f*a<SPACE><ESC>f*m<SPACE><ESC>b

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = 'g<C-n>'
let g:multi_cursor_start_key           = 'g<A-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<ESC>'

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" nerdtree
let g:NERDTreeMenuDown = "k"
let g:NERDTreeMenuUp = "i"
let g:NERDTreeMapOpenSplit = "a"
let g:NERDTreeMapJumpFirstChild = "I"
let g:NERDTreeMapJumpLastChild = "K"
let g:NERDTreeMapJumpNextSibling = "<C-k>"
let g:NERDTreeMapJumpPrevSibling = "<C-i>"
let g:NERDTreeMapToggleHidden = "h"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
noremap <LEADER>n :NERDTreeToggle<CR>

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

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1

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

" vim-fzf
noremap <LEADER>ff :Files<CR>
noremap <LEADER>fg :GFiles<CR>
noremap <LEADER>fb :Buffers<CR>
noremap <LEADER>fc :Colors<CR>
noremap <LEADER>fl :Lines<CR>
noremap <LEADER>ft :Tags<CR>
noremap <LEADER>fm :Marks<CR>
noremap <LEADER>fw :Windows<CR>
noremap <LEADER>fh :History<CR>
noremap <LEADER>fs :Snippets<CR>
noremap <LEADER>fM :Maps<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<C-d>"
let g:UltiSnipsJumpForwardTrigger="<C-d>"
let g:UltiSnipsListSnippets = "<C-w>"
let g:UltiSnipsJumpBackwardTrigger="<C-a>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/Ultisnips/', $HOME.'/.vim/plugged/vim-snippets/UltiSnips/']
let g:UltiSnipsEditSplit="horizontal"

" ranger
noremap <LEADER>w :RangerNewTab<CR>
" add this line if you use NERDTree
let g:NERDTreeHijackNetrw = 0
" open ranger when vim open a directory
let g:ranger_replace_netrw = 1

" vimspector
nnoremap <F3> :VimspectorReset<CR>
nnoremap <F4> :call vimspector#Restart()<CR>
nnoremap <F5> :call vimspector#Continue()<CR>
nnoremap <F8> :call vimspector#AddFunctionBreakpoint('<cexpr>')<CR>
nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <F10> :call vimspector#StepOver()<CR>
nnoremap <F11> :call vimspector#StepInto()<CR>
nnoremap <F12> :call vimspector#StepOut()<CR>
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.vim/vimspector_json_templation/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.vim/vimspector_json_templation',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" vim-markdown-toc
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0
let g:vmt_cycle_list_item_markers = 1
let g:vmt_include_headings_before = 0
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" vim-table-mode
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_relign_map = '<LEADER>tr'

" vim-easy-align
noremap ga <Plug>(EasyAlign)

" vista
noremap T :Vista!!<CR>
noremap <C-t> :Vista finder ctags<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_executive_for = {
  \ 'cpp': 'ctags',
  \ }

" vim-autoformat
noremap <LEADER>af :Autoformat<CR>

" vim-signature
let g:SignatureMap = {
    \ 'Leader'             :  "h",
    \ 'PlaceNextMark'      :  "h,",
    \ 'ToggleMarkAtLine'   :  "h.",
    \ 'PurgeMarksAtLine'   :  "h-",
    \ 'DeleteMark'         :  "dh",
    \ 'PurgeMarks'         :  "h<Space>",
    \ 'PurgeMarkers'       :  "h<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "]`",
    \ 'GotoPrevSpotByPos'  :  "[`",
    \ 'GotoNextMarker'     :  "]-",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListBufferMarks'    :  "h/",
    \ 'ListBufferMarkers'  :  "h?"
    \ }

" vim-easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" <Leader>f{char} to move to {char}
vmap /f <Plug>(easymotion-bd-f)
nmap /f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap /s <Plug>(easymotion-overwin-f2)
" Move to line
vmap /l <Plug>(easymotion-bd-jk)
nmap /l <Plug>(easymotion-overwin-line)
" Move to word
vmap  /w <Plug>(easymotion-bd-w)
nmap /w <Plug>(easymotion-overwin-w)

" xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
autocmd vimenter * :XTabTheme tomorrow
let g:xtabline_settings.indicators = {
  \ 'modified': '[+]',
  \ 'pinned': '[📌]',
  \}
let g:xtabline_settings.icons = {
  \'pin': '📌',
  \'star': '★',
  \'book': '📖',
  \'lock': '🔒',
  \'hammer': '🔨',
  \'tick': '✔',
  \'cross': '✖',
  \'warning': '⚠',
  \'menu': '☰',
  \'apple': '🍎',
  \'linux': '🐧',
  \'windows': '⌘',
  \'git': '',
  \'palette': '🎨',
  \'lens': '🔍',
  \'flag': '🏁',
  \}

" Goyo
nnoremap <LEADER>gy :Goyo<CR>
let g:goyo_width = '80'
let g:goyo_height = '80%'

" echodoc
let g:echodoc_enable_at_startup = 1

" suda.vim
nnoremap <LEADER>S :w suda://%<CR>
let g:suda#prompt = '(. > .) passwrod please: '

" asynctasks.vim
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']

unmap <TAB>

exec "nohlsearch"

" source $HOME/.vim/insert-colemak.vim
" source $HOME/.vim/insert-normal.vim
