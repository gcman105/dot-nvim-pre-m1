" Specify a directory for plugins For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

source /Users/gcman105/.config/.secrets
"-----------------------------------------------------------------------------
" vim-plug plugins {{{1
"-----------------------------------------------------------------------------
" Make sure you use single quotes

call plug#begin($XDG_CONFIG_HOME.'/nvim/plugged')
"call plug#begin('~/.config/nvim/plugged')
"Plug 'arnaud-lb/vim-php-namespace'
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
"Plug 'frankier/neovim-colors-solarized-truecolor-only',
"Plug 'hkupty/iron.nvim'
"Plug 'jeetsukumaran/vim-pythonsense'
"Plug 'kassio/neoterm'
"Plug 'leafgarland/typescript-vim'
"Plug 'mattn/emmet-vim'
"Plug 'mhartington/nvim-typescript'
"Plug 'rizzatti/dash.vim'
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/neomru.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-vinegar'
"Plug 'wincent/command-t'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-pug'
Plug 'dNitro/vim-pug-complete'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mhinz/vim-startify'
Plug 'posva/vim-vue'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'psf/black'
Plug 'racer-rust/vim-racer'
Plug 'sbdchd/neoformat', {'on': 'Neoformat'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Shougo/deoplete-zsh'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim',
Plug 'Shougo/neoinclude.vim'
Plug 'SirVer/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Order dependant plugins ----------------------------------------------------
Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
Plug 'deoplete-plugins/deoplete-jedi'

" ~/.vimrc, declare this variable before polyglot is loaded
let g:polyglot_disabled = ['python']
Plug 'sheerun/vim-polyglot'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()
" }}} end of vim-plug plugins ------------------------------------------------

"-----------------------------------------------------------------------------
" Settings {{{1
"-----------------------------------------------------------------------------
"Want a different map leader than \
let mapleader = ","

let g:python3_host_prog = expand('~/dotfiles/venv/bin/python')

let g:black_virtualenv = expand('~/dotfiles/venv')

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

set incsearch           " Set incremental searching"
set hlsearch            " Highlight searching
set wildmenu            " Command line completion

set mouse=a
set cmdheight=2
set autoindent

set spelllang=en_gb     " Set region to British English

set scrolloff=3         " Keep the cursor 3 lines off of bottom when scrolling
set timeoutlen=800     " A little bit more time for macros
set ttimeoutlen=50      " Make Esc work faster

" When completing by tag, show the whole tag, not just the function name
set showfulltag

"Syntax coloring lines that are too long just slows down the world
"set synmaxcol=2048
set synmaxcol=512

" Don't update the display while executing macros
set lazyredraw

"Switch between buffers without saving
set hidden

"command tabo, which makes the current tab the only tab
autocmd BufWinEnter,BufNewFile * silent tabo

"Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

set number              " Show lines numbers
set relativenumber      " Make line numbers relative
set laststatus=2        " Always show the status line
set clipboard=unnamed
set showmatch           " Show matching brackets.
set cpoptions+=$        " Show $ at the end of a change command
set virtualedit=all     " Allow cursor into places it cant normally go

set splitbelow          " More natural split below
set splitright          " More natural split right

set nostartofline       " Do not jump to first character with page commands.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set foldlevel=3         " Set the opening fold level
set foldcolumn=3        " Set the fold gutter width
set foldmethod=marker
set foldopen+=jump

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" important!!
set termguicolors
set background=dark     " or light
" the configuration options should be placed before `colorscheme edge`
"let g:edge_style = 'neon'
"let g:edge_disable_italic_comment = 1
colorscheme onedark
"colorscheme solarized

" }}} end of settings --------------------------------------------------------

"-----------------------------------------------------------------------------
" Keyboard mapping stuff {{{1
"-----------------------------------------------------------------------------
" Map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,

" Map Spanish key to do nothing in normal and visual modes
map <silent>´ <nop>
vmap <silent>´ <nop>
nnoremap <silent>` <nop>
vnoremap <silent>` <nop>

" Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :edit $MYVIMRC<CR>
nmap <leader>et :edit ~/.tmux.conf<CR>
nmap <leader>ez :edit ~/.zshrc<CR>
nmap <leader>sv :so $MYVIMRC<CR>
nmap <leader>st :so ~/.tmux.conf<CR>
nmap <leader>sz :so ~/.zshrc<CR>

noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>

" Shortcut keys vor the tagbar plugin
nmap <silent> <F8> :TagbarToggle<CR>

" Toggle spell checking on and off
nmap <silent> <F3> :set spell!<CR>

" Map escape key to jj -- much faster
imap jj <esc>
cmap jj <esc>

"Saves time; maps the spacebar to colon
nmap <space> :

" Gist keyboard mappings
noremap <leader>gl    :Gist -l<CR>
noremap <leader>gp    :Gist<CR>
vnoremap <leader>gv   :'<,'>Gist<CR>

" Press F2 to toggle showing white space on/off
nmap <F2> :set list!<CR>

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Emmet expandtab
imap <C-e><C-e> <C-y>,

" Align selected lines
vnoremap <leader>ib :!align<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

nnoremap <F9> :Black<CR>

" }}} end of Keyboard mapping stuff ----------------------

" Settings stuff {{{2 --------------------------------------------------------
"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Indent stuff
set smartindent
set autoindent
set shiftround

" }}} end of Settings stuff ------------------------------

" A way to iter through buffers
nnoremap <C-b> :buffers<CR>:buffer<Space>

" sudo write this
cmap W! w !sudo tee % >/dev/null

let g:gist_use_password_in_gitconfig = 1

" netrw setup and key bindings {{{2 ------------------------------------------
let g:netrw_home = '$HOME/dotfiles'
" }}} end of netrw setup and key bindings ----------------

" bookmarks setup and key bindings {{{2 --------------------------------------
"map <leader>m g:netrw-mB
" }}} end of bookmarks setup and key bindings ------------

" Ale setup and key bindings {{{2 --------------------------------------------
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
let g:ale_list_vertical = 1
" }}} end of Ale setup and key bindings ------------------

" deoplete setup and key bindings {{{2 ---------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
call deoplete#enable_logging('DEBUG', 'deoplete.log')
" }}} end of typescript setup and key bindings -----------

" ultisnips setup and key bindings {{{-2 -------------------------------------
let g:UltiSnipsExpandTrigger             =  "<F6>"
let g:UltiSnipsListSnippets              =  "<F5>"
let g:UltiSnipsJumpForwardTrigger        =  "<F6>"
let g:UltiSnipsJumpBackwardTrigger       =  "<F5>"
inoremap <c-x><c-k> <c-x><c-k>
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}} end of UltiSnips setup and key bindings ------------

" Easymotion setup and key bindings {{{2 -------------------------------------
map <leader><leader> <Plug>(easymotion-prefix)
" }}} end of Easymotion setup and key bindings -----------

" NERDTree setup and key bindings {{{2 ---------------------------------------
nnoremap <leader>n :NERDTreeToggle<cr>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Hide certain files
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git', '.cache', '.idea', '.vscode', '.DS_Store', '.projectile', '.noseids', 'htmlcov', 'node_modules']

" }}} end of NERDTree setup and key bindings -------------

" Airline stuff {{{2 ---------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
" }}} end of Airline stuff -------------------------------

" Disable Python 2 support:
let g:loaded_python_provider = 1

" PhpInsertUse stuff {{{2 ----------------------------------------------------
" }}} end of PhpInsertUse stuff --------------------------

" FZF stuff {{{2 -------------------------------------------------------------
set rtp+=/usr/local/opt/fzf
" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

" Open buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

nnoremap <C-p> :GFiles<CR>

" }}} end of FZF stuff -----------------------------------

" OneDark theme stuff {{{2 ---------------------------------------------------
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
" }}} end of OneDark theme stuff -------------------------

" vim-lsp stuff {{{2 ---------------------------------------------------------
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    " refer to doc to add more commands
endfunction

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

let g:lsp_fold_enabled = 1

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'whitelist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))

"if has('python3')
    "let g:UltiSnipsExpandTrigger="<c-e>"
    "call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        "\ 'name': 'ultisnips',
        "\ 'whitelist': ['*'],
        "\ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        "\ }))
"endif
" }}} end of vim-lsp stuff -------------------------------

