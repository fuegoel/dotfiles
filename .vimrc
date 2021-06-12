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
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:NERDTreeWinSize=30
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable strange Vi defaults
set nocompatible

" Leader
let mapleader=" "
let maplocalleader="\\"

" General config
syntax on
set autoread
set number relativenumber
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set showcmd
set spelllang=en_us
set showmode
set hidden
set history=1000
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
set encoding=utf-8
nnoremap <C-e> 7<C-e>
nnoremap <C-y> 7<C-y>
nnoremap <silent> <leader>, :noh<CR>

" Color
if &t_Co >= 256
  set termguicolors
end
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = "medium"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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

" Autocomplete
imap <Tab> <C-P>
set complete=.,w,b,u,k,s,t
set wildmode=longest,list:longest
set completeopt=menu,preview

" Clipboard and copy/paste
set clipboard=unnamed
set pastetoggle=<F2>
vnoremap <C-c> "*y
map <silent><leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" Allow saving read-only files when using vim without sudo
cmap w!! w !sudo tee > /dev/null %

" Split resizing and movement
set winheight=10
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>x
nnoremap <C-o> <C-w>o
nnoremap <C-q> <C-w>q

" Open new split panes to right and bottom
set splitright
set splitbelow

" Buffer
nnoremap <leader>s :ls<CR>:buffer<Space>

" Buftabline
let g:buftabline_numbers = 2 " Ordinal number
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>10 <Plug>BufTabLine.Go(10)

" Use enter to create new lines without entering insert mode
nnoremap <CR> o<Esc>

" Fix issues in quickfix window
autocmd CmdWinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" For Go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
set updatetime=100
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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" For terraform
let g:terraform_align=1
let g:terraform_fold_section=1
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1

let g:currentmode={
       \ 'n'  : 'Normal',
       \ 'v'  : 'Visual',
       \ 'V'  : 'V-Line',
       \ '' : 'V-Block',
       \ 'i'  : 'Insert',
       \ 'R'  : 'Replace',
       \ 'Rv' : 'V-Replace',
       \ 'c'  : 'Command',
       \}

" Statusline
function! StlReadOnly() abort
  if &readonly || !&modifiable
    return ' '
  else
    return ''
endfunction

function! StlModified() abort
  if &modified
    return ' +'
  else
    return ''
endfunction

function! StlGit() abort
  let i = ''
  if fugitive#head() != ''
    return '  ' . i . ' ' . fugitive#head() . ' '
  else
    return ''
  endif
endfunction

set laststatus=2
set statusline=
set statusline+=%1*\%{StlGit()} " Git branch
set statusline+=%2*\ %f%{StlReadOnly()}%{StlModified()} " File name
set statusline+=%= " Switch to the right side
set statusline+=%y " File type
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}] " Encoding
set statusline+=\ %*
set statusline+=%3*\ %l/%L\ [%p%%] " Row number/total, percentage
set statusline+=\ %c " Column number
set statusline+=\ %*

hi User1 ctermbg=62 ctermfg=white
hi User2 ctermbg=239
hi User3 ctermbg=65 ctermfg=white
