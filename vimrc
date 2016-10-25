" vim: set foldmethod=marker foldlevel=0:
" ============================================================================
" .vimrc of Khaja Minhajuddin

set nocompatible
"let g:loaded_syntastic_sass_sass_checker = 1 " disable syntastic for sass

" >>>>>>>>>>>>>	HELP {{{
" Installation
" 1. Install plug by running the following:
"  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. Open vim and run
"     PlugInstall
" 3. Install htmltidy from: https://github.com/htacg/tidy-html5
"}}}

">>>>>>>>>>>>>>>>>>>>		PLUGINS {{{
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'minhajuddin/vim-quickrun'
Plug 'minhajuddin/zainu-vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Group dependencies, vim-snippets depends on ultisnips, snippets
Plug 'tacahiroy/ctrlp-funky'
Plug 'tomasr/molokai' " colorscheme
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch' " async command execution
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' " git
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails' " rails stuff
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible' " sensible defaults
Plug 'tpope/vim-surround' " surround
Plug 'tpope/vim-unimpaired'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }
Plug 'vim-ruby/vim-ruby'
Plug 'Yggdroot/indentLine'

Plug 'matchit.zip'
call plug#end()
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Language plugs
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"		AUTOCOMMANDS
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"		VIM SETTINGS
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" TODO: Move these settings to: Plug 'minhajuddin/vimsettings'
colorscheme molokai

" settings for gvim
if has("gui_running")
  " maximizes the gvim window
  set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
  " set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline\ 11
  set lines=999 columns=999
  " No menus and no toolbar
  set guioptions-=m
  set guioptions-=T
endif

" settings for terminal vim
if !has("gui_running")
  set t_Co=256
endif

let loaded_matchparen=1 " don't automatically highlight the matching parens
let mapleader      = ' '
let maplocalleader = ' '
set autowriteall " autosave files
set background=dark
set clipboard=unnamedplus " Yanks go on clipboard
set cmdheight=2
set completeopt=menuone,preview,longest
set cursorline
set diffopt=filler,vertical,iwhite
set encoding=utf-8
set expandtab
set fileencoding=utf8
set fillchars= " unset pipe as the vertical seperator
set foldlevel=3
set foldlevelstart=99
set foldmethod=syntax
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds
set grepformat=%f:%l:%c:%m,%f:%l:%m
set grepprg=grep\ -nH\ $*
set guioptions=aci
set hidden
set hlsearch " CTRL-L / CTRL-R W
set ignorecase smartcase
set lazyredraw                  " don't redraw while in macros
" set list
set matchtime=0 " to stop automatic moving of cursor to matched paren
set modeline " read modeline from footer to detect filetype?
set mouse=a
set mousehide
set noautoread
set nojoinspaces
set number " show line number
set selectmode=key
set shiftwidth=2
set shortmess=atI               " shorten messages and don
set showfulltag " When completing by tag, show the whole tag, not just the function name
set showmatch " Show matching braces
set showmode
set smartindent
set softtabstop=2
set splitbelow
set synmaxcol=200 " Syntax coloring lines that are too long just slows down the world
set tabstop=2
set timeoutlen=500
set virtualedit=block
set whichwrap=b,s
set wildchar=9 " tab as completion character
set wildignore+=node_modules,deps,*.gif,*.fla,*.png,*.swf,*.jpg,tmp/*,public/assets/*,*.ogv,*.ico,*.pdf,node_modules,_build,vendor/assets/bower,__*,data/*,rel/*,priv/static/*
set wildmode=list:longest,full
set wrap!
syntax sync fromstart


" search stuff
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"		PLUGIN SETTINGS
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" NERDTree
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node

let g:NERDShutUp = 1 " disable warnings from NERDCommenter

" ultisnips
let g:UltiSnipsExpandTrigger="<C-o>"
"let g:UltiSnipsJumpForwardTrigger="<C-n>"
"let g:UltiSnipsJumpBackwardTrigger="<C-p>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" help bufferline
let g:bufferline_echo = 0 " hide bufferline from command bar
let g:bufferline_show_bufnr = 1
let g:bufferline_rotate = 2
"let g:bufferline_fixed_index =  0 "always first
" <<<<<

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" indent
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#333333'
"let g:indentLine_char = "┊"
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"		MAPPINGS
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"
" NERDTree
map <leader>nt :execute 'NERDTreeToggle'<cr>
map <leader>nn :execute 'NERDTree'<cr>

map <C-d> :execute 'QuickRun'<cr>


"Ack stuff
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :execute 'Ack'<cr>

let g:UltiSnipsSnippetsDir = "/home/minhajuddin/.vim/plugged/snippets/UltiSnips"
" Syntastic
let g:syntastic_eruby_ruby_quiet_messages =
      \ {'regex': 'possibly useless use of a variable in void context'}

