set nocompatible              " be iMproved, required
filetype off                  " required

set laststatus=2


" Vim fuzzy-finding
set path+=**
set wildmenu

" Use mouse scrolling but press : to scroll terminal
set mouse=nvi

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" utilities
Plugin 'junegunn/fzf' " better fuzzy-finder
Plugin 'junegunn/fzf.vim' " better fuzzy-finder
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'shumphrey/fugitive-gitlab.vim' " GitLab plugin for fugitive
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'vim-vdebug/vdebug' " Debugger
Plugin 'tpope/vim-surround' " Surround with cs + char to replace + char to replace with
Plugin 'nathanaelkane/vim-indent-guides' " Indent guides
Plugin 'luochen1990/rainbow' " Bracket pair colorizer
Plugin 'vim-syntastic/syntastic' " PHP syntax checker
Plugin 'easymotion/vim-easymotion' " Sweet motions
Plugin 'jistr/vim-nerdtree-tabs' " Keep NERDTree open across all tabs
Plugin 'tpope/vim-repeat' " Repeat plugin commands with .
Plugin 'jeetsukumaran/vim-buffergator' " Manage buffers
Plugin 'majutsushi/tagbar' " Show tags in sidebar
Plugin 'qpkorr/vim-bufkill' " Close buffers; not windows
Plugin 'tpope/vim-unimpaired' " [] shortcuts
Plugin 'junegunn/gv.vim' " Commit browser
    " Use :GV to show commits
    " Use :GV! to show commits for current file
    " Use :GV? to fill location list with revisions of current file
    " Use :GV or :GV? in visual mode to show changes to selected lines
Plugin 'mbbill/undotree' " Undo visualizer
Plugin 'posva/vim-vue' " Vue syntax highlighting

" Git Diff signs
Plugin 'airblade/vim-gitgutter'

" Git actions plugin
Plugin 'jreybert/vimagit' 

" Load standard powerline bundle if python3 version is not installed
if empty(glob("/usr/lib/python3/dist-packages/powerline/bindings/vim"))
    Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
endif

" colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'tyrannicaltoucan/vim-quantum'

" JavaScript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Laravel plugins
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-projectionist'
Plugin 'noahfrederick/vim-composer'
Plugin 'noahfrederick/vim-laravel'
Plugin 'jwalton512/vim-blade'

" More themes
Plugin 'flazz/vim-colorschemes'

" Emmet
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

set nocompatible " not compatible with vi
set autoread " detect when a file is changed

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set a map leader for more key combos
let mapleader = ','

" Tab control
"set noexpandtab " tabs ftw
set expandtab " Expand tabs to play nicely with other editors
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

set clipboard=unnamed

" faster redrawing
set ttyfast

" code folding settings
"set foldmethod=syntax " fold based on indent
set foldmethod=marker
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
" map space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Needed for buffers
set hidden

" Indent 
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" Bracket pair colorizer
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Keep A LOT of undos
set undodir=~/.vim/undofiles
set undofile
set undolevels=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" switch syntax highlighting on
syntax on

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
" colorscheme delek
" colorscheme base16-default-dark
" colorscheme gruvbox
colorscheme Tomorrow-Night
" colorscheme quantum
set updatetime=100

set relativenumber
set number " Show line numbers

set nostartofline " Stop certain movements from going to the first character

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

set shell=bash " enable bash aliases

set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the status line all the time

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Show partial commands in the last line of the screen
set showcmd

" if opening a file from :ls, :buffers, :files, etc. jump to open version
" of the file, if one exists
set switchbuf=useopen

" spell check comments
set nospell

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Better command-line completion
set wildmenu
set wildmode=longest,list,full

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

if exists('$TMUX')  " Support resizing in tmux
      set ttymouse=xterm2
endif

" green/red diffs
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000

" Current line customization
" high light current line in insert mode
" Enable CursorLine
set cursorline
" commented out 2019-06-19 to try to keep cursorline from disappearing
" autocmd InsertEnter * highlight  CursorLine ctermbg=236 ctermfg=None
" autocmd InsertLeave * highlight  CursorLine ctermbg=235 ctermfg=None

" Always show tabline
set showtabline=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <leader>ev :tabedit ~/.vimrc<cr> " edit ~/.vimrc
map <leader>ev :vsplit ~/.vimrc<cr>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <tab> %
vnoremap <tab> %

nnoremap ; :

" Map autocomplete to Ctrl + Space
inoremap <Nul> <C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
   endif
endfunction

" My Shorcuts
"
nmap <silent> <leader>/ :Commentary<cr>
" nmap <silent> <leader>q :q<cr>
nmap <silent> <leader>q :close<cr>
" nmap <silent> <leader>d :bd<cr>
nmap <silent> <leader>d :BD<cr>
nmap <silent> <leader>m :tabe <cr>
nmap <C-b> :BuffergatorToggle<cr>
" nmap <C-t> :BuffergatorTabsToggle<cr>

nnoremap <leader>. :CtrlPTag<cr>
"nnoremap <silent> <Leader>b :TagbarToggle<CR>
nmap <C-t> :TagbarToggle<cr>

nmap <silent> <leader>z :UndotreeToggle<cr>

nmap [og :GitGutterLineHighlightsEnable<cr>
nmap ]og :GitGutterLineHighlightsDisable<cr>

nmap <silent> <l;ader>h :set noh<cr> " Turn off search highlights
nmap <C-_> :set hlsearch!<cr> " Toggle search highlighting
nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>rv :source ~/.vimrc<cr> " Refresh vimrc
" nmap <silent> <leader>s :tabn<cr>
" nmap <silent> <leader>a :tabp<cr>
nmap <silent> <leader>s :bn<cr>
nmap <silent> <leader>a :bp<cr>
" Don't use - breaks Ctrl+I
" nmap <Tab> :tabn<cr>
" nmap <S-Tab> :tabp<cr>
nmap <silent> <leader>a :bp<cr>
nmap <silent> <leader>l :set relativenumber!<cr>cr " Toggle line number setting
nnoremap <leadeR>ed :VdebugEval<SPACE>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gvdiff<cr>
nnoremap <silent> <leader>gv :Gsdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Gbrowse<cr>
nnoremap <leader>gc :GV<cr>
nnoremap <leader>cl :GV<cr>
nnoremap <leader>cf :GV!<cr>
nnoremap <leader>cr :GV?<cr>
nnoremap <silent> <leader>p :<esc>oeval(\Psy\sh());<esc>
nnoremap <silent> <leader>- :exe "resize" . (winheight(0) - 5)<cr>
nnoremap <silent> <leader>= :exe "resize" . (winheight(0) + 5)<cr>
nnoremap <C-Down> :exe "resize" . (winheight(0) - 5)<cr>
nnoremap <C-Up> :exe "resize" . (winheight(0) + 5)<cr>
nnoremap <C-Left> :exe "resize" . (winwidth(0) - 5)<cr>
nnoremap <C-Right> :exe "resize" . (winwidth(0) + 5)<cr>
inoremap jj <ESC>
inoremap kk <ESC>:w<cr><ESC>
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Open new split panes to right and bottom
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fugitive GitLab plugin
" let g:fugitive_gitlab_domains = ['http://example.com']
" let g:gitlab_api_keys = {'example.com': 'd09x-dk39d874hdfkd02'}

" fix Glog not displaying in quickfix window:
" https://github.com/tpope/vim-fugitive/issues/214
autocmd QuickFixCmdPost *grep* cwindow

highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_liners = 1

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>ntt :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" keyboard shortcut
map <C-n> :NERDTreeToggle<CR>
" Start NERDTree on startup
" autocmd vimenter * NERDTree
" Quit if last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
map <C-p> :FZF<CR>

" The Silver Searcher
if executable('ag')
   " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
     "let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
silent! command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Bracket pair colorizer
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" PHP linter (vim-phpqa)
" Don't run messdetector on save (default = 1):tab
" let g:phpqa_messdetector_autorun = 0
" " Don't run codesniffer on save (default = 1)
" let g:phpqa_codesniffer_autorun = 0
" " Show code coverage on load (default = 0)
" let g:phpqa_codecoverage_autorun = 1
" Stop the location list opening automatically
" let g:phpqa_open_loc = 0
" silent! unmap <leader>qa
" silent! unmap <leader>qc
" Map the keys to garbage mappings to prevent qc and qa bindings
" nmap <unique> <Leader>66  <Plug>QAToolsToggle
" nmap <unique> <Leader>67  <Plug>CodeCoverageToggle

" Vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }

highlight Comment cterm=italic gui=italic

" Vdebug
if !exists('g:vdebug_options')
        let g:vdebug_options = {}
endif
" Don't break on first line with Vdebuv
" let g:vdebug_options_break_on_open = 0
let g:vdebug_options.break_on_open = 0
" Start listening immediately after debugging session is finished (pressed F6
" or Ctrl C to stop)
let g:vdebug_options.watch_window_style = 'compact'
let g:vdebug_options.continuous_mode = 1

" UndoTree
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif

" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Allow gf (go-to file) command to find vue, js, scss files
set suffixesadd=.js,.vue,.scss

" Check for powerline with python support
if !empty(glob("/usr/lib/python3/dist-packages/powerline/bindings/vim"))
    set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim
else 
    if !empty(glob("~/.vim/bundle/powerline/powerline/bindings/vim"))
        set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    endif
endif
