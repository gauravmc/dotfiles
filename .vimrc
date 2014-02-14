" Basic
set nocompatible " No vi compatility
let mapleader=","

filetype off
filetype plugin indent off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-unimpaired'
Bundle 'peterjm/gitignore.vim'

" Go syntax
set rtp+=$GOROOT/misc/vim

filetype plugin indent on
syntax on

set wildignore+=*/generated/*

" line numbers
set number

" Softtabs
set tabstop=2
set shiftwidth=2
set expandtab

" prevent creation of temporary backup files
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" window minimum size
set winwidth=80
set winheight=30

" Stop vim from automatically adding comment syntax
" upon pressing enter and O/o
set formatoptions-=o
set formatoptions-=r

" Color
set background=light
colorscheme solarized

set showmatch
set incsearch
set laststatus=2

" get current directory anywhere
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Diff tab management: open the current git diff in a tab

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

"""""""""""""""""""
" Misc Key Mappings
"""""""""""""""""""

" go back and forth in opened buffers
nnoremap <leader><leader> <c-^>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Git
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" save
map <c-s> <esc>:w<CR>
imap <c-s> <esc>:w<CR>

" tagbar toggle
nnoremap <silent> <leader>t :TagbarToggle<CR>

" Bubble single lines
nmap <C-Down> ]e
nmap <C-Up> [e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" ag over grep and ack
set grepprg=ag\ --nogroup\ --nocolor
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

"""""""
" CtrlP
"""""""

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Make CtrlP plugin use ag
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
