if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/dhruvasagar/vim-table-mode.git'
Plug 'https://github.com/bronson/vim-trailing-whitespace.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plug 'pearofducks/ansible-vim'
Plug 'zhaocai/GoldenView.Vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'hashivim/vim-terraform'

call plug#end()

"let g:NERDTreeWinSize=31
let g:goldenview__enable_default_mapping = 0

" Disable strange Vi defaults
set nocompatible

" Leader
let mapleader=" "
let maplocalleader="\\"

"""""""""""""""""""
" Vim Airline
"""""""""""""""""""
let g:airline_theme='powerlineish'

set laststatus=2
set t_Co=256
set ttimeoutlen=50

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Powerline symbols
let g:airline_left_sep = '▓▒░'
let g:airline_left_alt_sep = '▒'
let g:airline_right_sep = '░▒▓'
let g:airline_right_alt_sep = '░'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1
let g:airline_powerline_fonts=1
let g:airline_exclude_preview=0

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message=''
let g:airline#extensions#branch#vcs_priority=["git", "mercurial"]
let g:airline#extensions#branch#format=1
let g:airline#extensions#virtualenv#enabled=1

let g:airline_skip_empty_sections=1
let g:airline_section_warning=0
let g:airline_section_y=0

" Enable buffer listing, show filename only, and show tab and tab number
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#tab_nr_type=1

"""""""""""""""""""
" General config
"""""""""""""""""""
syntax on
set autoread
set number relativenumber
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set showcmd
set spelllang=en_us
set showmode
set hidden
set history=10000
set scrolloff=7
set sidescrolloff=15
set sidescroll=1
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set ruler
set noswapfile
set nowritebackup
set nobackup
set linebreak
set cursorline
nnoremap <C-e> 7<C-e>
nnoremap <C-y> 7<C-y>
nnoremap <silent> <leader>, :noh<CR>

" Color
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" Toggle absolute and relative numbering
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \,trail:.

" Indentation
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nowrap
filetype plugin on
filetype indent on

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Fuzzy finder
set path=$PWD/**
set wildmenu

"Autocomplete
imap <Tab> <C-P>
set complete=.,w,b,u,k,s,t
set wildmode=longest,list:longest
set completeopt=menu,preview

" Clipboard and copy/paste
set clipboard=unnamed
set pastetoggle=<F2>
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" Allow saving read-only files when using vim without sudo
cmap w!! w !sudo tee > /dev/null %

" File browsing
"let g:netrw_banner=0
"let g:netrw_browse_split=2
"let g:netrw_winsize=20
"let g:netrw_altv=1
"let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Split resizing and movement
set winheight=10
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>x
nnoremap <C-o> <C-w>o
nnoremap <C-q> <C-w>q

" Buffer
nnoremap ,n :bnext<CR>
nnoremap ,p :bprevious<CR>
nnoremap ,e :enew<CR>
nnoremap ,d :bdelete<CR>
nnoremap ,b :ls<CR>:buffer<Space>

" Open new split panes to right and bottom
set splitright
set splitbelow

" Tab
nnoremap <C-Up> :tabnew<CR>
nnoremap <C-Down> :tabclose<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Use enter to create new lines without entering insert mode
nnoremap <CR> o<Esc>
" Fix issues in quickfix window
autocmd CmdWinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" For Go
let g:go_fmt_command = "goimports"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
set updatetime=100
"let g:go_auto_sameids = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
set autowrite
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>v :vsp <CR>:exe "GoDef" <CR>
autocmd FileType go nmap <leader>s :sp <CR>:exe "GoDef" <CR>
autocmd FileType go nmap <leader>t :tab split <CR>:exe "GoDef" <CR>
autocmd BufNewFile,BufRead *.go setlocal tabstop=4 shiftwidth=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" For terraform
let g:terraform_align=1
let g:terraform_fold_section=1
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1
