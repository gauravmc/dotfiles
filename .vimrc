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
" Bundle 'peterjm/gitignore.vim'
Bundle 'matze/vim-move'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdtree'

" Go syntax
set rtp+=$GOROOT/misc/vim

filetype plugin indent on
syntax on

set wildignore+=*/generated/*,*/tmp/*,*.so,*.swp,*.zip,*/log/*,*/.git/*,*/public/*,*/tags/*,*/node_modules/*,*/doc/*

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
set winheight=40

" Stop vim from automatically adding comment syntax
" upon pressing enter and O/o
set formatoptions-=o
set formatoptions-=r

" Color
set background=light
colorscheme solarized

set showmatch
set matchtime=1
set incsearch
set laststatus=2
set hidden

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
nnoremap <s-j> <c-w>j
nnoremap <s-k> <c-w>k
nnoremap <s-h> <c-w>h
nnoremap <s-l> <c-w>l

" Git
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" save
map <c-s> <esc>:w<CR>
imap <c-s> <esc>:w<CR>

" tagbar toggle
nnoremap <silent> <leader>t :TagbarToggle<CR>

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" shell shortcut
map <leader>s <c-z>

" ag over grep and ack
set grepprg=ag\ --nogroup\ --nocolor\ --column
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" have to paste code from github or something sometimes
map <leader>p :set paste<CR>
map <leader>P :set nopaste<CR>

" paste multiple times
xnoremap p pgvy

" Vim move plugin override default modifier
let g:move_key_modifier = 'C'

"""""""
" CtrlP
"""""""

" Ignore some folders and files for CtrlP indexing
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.yardoc\|log\|tmp$',
"   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
"   \ }

" Make CtrlP plugin use ag
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
