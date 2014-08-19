" Basic
set nocompatible " No vi compatility
let mapleader=","

filetype off
filetype plugin indent off

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My bundles
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'matze/vim-move'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'AndrewRadev/vim-eco'

" Go syntax
set rtp+=$GOROOT/misc/vim

call vundle#end()
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
set background=dark
colorscheme solarized

set showmatch
set matchtime=1
set incsearch
set laststatus=2
set hidden

" Yank copies to clipboard as well
set clipboard=unnamed

" get current directory anywhere
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Diff tab management: open the current git diff in a tab

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

command! W write

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
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
