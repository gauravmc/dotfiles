set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My bundles
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'matze/vim-move'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'tpope/vim-bundler'
Plugin 'itchyny/lightline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'wincent/command-t'
Plugin 'mileszs/ack.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

" Color scheme
syntax enable
set background=dark
colorscheme solarized

set wildignore+=*/generated/*,*/tmp/*,*.so,*.swp,*.zip,*/log/*,*/.git/*,*/public/*,tags/*,*/node_modules/*,*/doc/*,vendor/*,venv/*

" line numbers
set nonumber

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

" Yank copies to clipboard as well
set clipboard=unnamed

" get current directory anywhere
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Diff tab management: open the current git diff in a tab

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>

command! W write

" Miscellaneous settings
set showmatch
set matchtime=1
set incsearch
set laststatus=2
set hidden
set autoread
set tags=.tags
set encoding=utf-8

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

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" shell shortcut
map <leader>s <c-z>

" Miscellaneous
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>r :windo e!<CR>

" ag over grep and ack
set grepprg=ag\ --nogroup\ --nocolor\ --column
nnoremap <leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" automatically paste properly indented text with Cmd+P!
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" paste multiple times
xnoremap p pgvy

" Vim move plugin override default modifier
let g:move_key_modifier = 'C'

" Stop command-t from using git root as current dir
let g:CommandTTraverseSCM = 'pwd'

" Lightline configuration

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'modified' ], [ 'syntastic' ] ]
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'warning',
      \ }
    \ }

" YCM modifications

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
