"""""""""""""""""""""""""""""""""""""
" NINHNQ Vimrc configuration 
"""""""""""""""""""""""""""""""""""""

"""" START PackageManager Configuration 

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug '907th/vim-auto-save'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'christoomey/vim-tmux-navigator'

" Generic Programming Support 
Plug 'Townk/vim-autoclose'
Plug 'vim-syntastic/syntastic'

" Theme / Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" OSX stupid backspace fix
set backspace=indent,eol,start

" Initialize plugin system
call plug#end()
"""" END PackageManager Configuration 

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
set nocompatible
syntax off
set nowrap
colorscheme slate

" Set Font
set encoding=utf8

" Setup line number
set number
set mouse=a
highlight LineNr ctermfg=grey

set hidden
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set clipboard=unnamed

" Softtab = 4 spaces
set tabstop=4        "Using tab
set shiftwidth=4    "Using reindent (<< | >>) operator

set laststatus=2     "Always show status bar
set autoread         "Auto reload files when they are changed outside
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

" Set auto indent
set autoindent
set smartindent
set copyindent

" change the mapleader from \ to ,
let mapleader=","
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:neocomplete#enable_at_startup = 1 " Enable Code Hint on Startup

" Unite
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" Easy Tags
set tags=./tags;
let g:easytags_dynamic_files = 1

" NERDTree
nnoremap <leader>3 :NERDTreeToggle<CR>
nnoremap <leader>4 :NERDTreeFind<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>e :CtrlPMRU<CR>
nnoremap <c-p> :CtrlP<CR>
nnoremap <c-b> :CtrlPBuffer<CR>
nnoremap <leader>w :bd<CR> " Close current file
nnoremap <leader>f :Ag! <c-r>=expand("<cword>")<cr><cr>

" Navigate between splits
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy & Paste like Ctrl_C Ctrl_V
noremap <leader>c "*y
noremap <leader>v "*p

nmap <silent> ,/ :nohlsearch<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Let CtrlP work with NERDTree
let g:NERDTreeChDirMode       = 2     "Change CWD according to NERDTree
let g:ctrlp_working_path_mode = 0    "Use CWD as root to search

" Use Ack to search for CtrlP
if executable('ack')
" Use Ack over Grep
set grepprg=ack\ --nogroup\ --nocolor

" Use ack in CtrlP for listing files. Lightning fast and respects
"     .gitignore
let g:ctrlp_user_command = 'ack %s --nocolor -f'
endif


" Beautiful Status Bar
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("%c")}'

" Navigation improve
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

" Press esc to cancel search hilighting
map <esc> :noh<cr>
