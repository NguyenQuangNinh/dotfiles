set nocompatible              " be iMproved, required
filetype off                  " required

" Setup line number
set relativenumber
set number

"Enable mouse
"set ttyfast
"set mouse=a

" Softtab = 4 spaces
set tabstop=4		"Using tab
set shiftwidth=4	"Using reindent (<< | >>) operator
 
set laststatus=2 	"Always show status bar
set autoread 		"Auto reload files when they are changed outside
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

" Set auto indent
set autoindent
set smartindent
set copyindent

set pastetoggle=<F2> "F2 before pasting to preserve indentation

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'vim-scripts/vim-auto-save'
" Plugin 'jeaye/color_coded'
Plugin 'mhartington/oceanic-next'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf8

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui=0

let g:cpp_class_scope_highlight=1

let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("%c")}'

" Let CtrlP work with NERDTree
let g:NERDTreeChDirMode       = 2 	"Change CWD according to NERDTree
let g:ctrlp_working_path_mode = 0	"Use CWD as root to search 
" Use hotkey Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" AutoSave
let g:auto_save = 1  				" enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  	" do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  		" do not display the auto-save notification
" EasyMotion
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"let g:EasyMotion_smartcase = 1

"Close NERDTree when there is no file left
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" " buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
      if bufwinnr(t:NERDTreeBufName) != -1
		if winnr("$") == 1
			q
		endif
      endif
endif
endfunction

" Use Ag to search for CtrlP
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects
	"     .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Set Color Scheme
syntax enable
"let g:solarized_termtrans=1
set background=dark
"colorscheme solarized
colorscheme OceanicNext

let g:airline_theme='oceanicnext'

" NERDTree mapping
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :NERDTreeFind<CR>
"open .vimrc
nnoremap <leader>ev :e! ~/.vimrc<CR>
nnoremap <leader>sv :so ~/.vimrc<CR>	"Reload .vimrc
" YCM mapping 
nnoremap <F12> :YcmCompleter GoToDefinition<CR>
nnoremap <F11> :YcmCompleter GoToInclude<CR>
nnoremap <F10> :YcmCompleter GoToDeclaration<CR>
" EasyMotion mapping
nmap s <Plug>(easymotion-s2)
" Ag Search text in project files
nnoremap <leader>F :Ag <C-r><C-w><CR>
nnoremap <leader>f :Ag ""<LEFT>
" Switch mapping
imap <F2> .<C-o>:Switch<CR><C-o>A
" Delete line while in insert mode 
inoremap <c-d> <esc>ddi
" Navigation improve
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k

filetype plugin indent on    " required
