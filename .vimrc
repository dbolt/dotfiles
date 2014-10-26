set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "ekalinin/Dockerfile.vim"
Bundle 'ciaranm/detectindent'
Bundle 'flazz/vim-colorschemes'
Bundle 'gmarik/vundle'
Bundle 'itchyny/lightline.vim'
Bundle 'jwhitley/vim-matchit'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'mitsuhiko/vim-jinja'
Bundle 'myusuf3/numbers.vim'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'wellle/targets.vim'
Bundle 'yegappan/mru'
Bundle 'fatih/vim-go'

syntax on
filetype on
filetype plugin on

colorscheme smyck

"Use spaces instead of tabs
autocmd Filetype java setlocal ts=4 sts=4 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
set tabstop=4 softtabstop=4 expandtab shiftwidth=4

"NERD Tree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

"Toggle Number / RelativeNumber
set nu
function! NumberToggle()
    if &nu == 1
        set rnu
    elseif &rnu == 1
        set nornu
    else
        set nu
    endif
endfunc

nnoremap L :call NumberToggle()<CR>

"Map Ctrl-W j,i,k,l to Ctrl-j,i,k,l. Used for switching to vim buffers easily
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
