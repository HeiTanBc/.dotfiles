" general config

set shell=/bin/sh
set nocompatible
set history=500

filetype plugin on
filetype indent on
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
 set nobackup
 set nowb
 set noswapfile

" user interface config
set so=7
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set mat=2

"no error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1
"set colorcolumn=80
"highlight colorcolumn ctermbg=green
set number

let mapleader=","
let localleader= "\\"

" color and fonts
syntax enable
colorscheme skull
set background=dark
set encoding=utf8
set ffs=unix,dos,mac

" text, tab ,indent config
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap

"list completions
"set list
set wildmode=longest:list,full

"secure vimrc
set exrc
set secure

"Enable mouse
set mouse=a

" Visual mode pressing * or # searches for the current selection
 " Super useful! From an idea by Michael Naumann
 vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
 vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
 map <space> /
 map <c-space> ?
 
 " Disable highlight when <leader><cr> is pressed
 map <silent> <leader><cr> :noh<cr>
 
 " Smart way to move between windows
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l
 
 " Close the current buffer
 map <leader>bd :Bclose<cr>:tabclose<cr>gT
 
 " Close all the buffers
 map <leader>ba :bufdo bd<cr>
 
 map <leader>l :bnext<cr>
 map <leader>h :bprevious<cr>
 
 " Useful mappings for managing tabs
 map <leader>tn :tabnew<cr>
 map <leader>to :tabonly<cr>
 map <leader>tc :tabclose<cr>
 map <leader>tm :tabmove<cr>
 map <leader>t  :tabnext<cr>
 
 
 " Let 'tl' toggle between this and the last accessed tab
 let g:lasttab = 1
 nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
 au TabLeave * let g:lasttab = tabpagenr()
 
 
 " Opens a new tab with the current buffer's path
 " Super useful when editing files in the same directory
 map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
 
 " Switch CWD to the directory of the open buffer
 map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
 try
   set switchbuf=useopen,usetab,newtab
   set stal=2
 catch
 endtry
 
 " Return to last edit position when opening files (You want this!)
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 
" Status Line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Remap VIM 0 to first non-blank character
 map 0 ^
 
 " Move a line of text using ALT+[jk] or Command+[jk] on mac
 nmap <M-j> mz:m+<cr>`z
 nmap <M-k> mz:m-2<cr>`z
 vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
 vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
 
 if has("mac") || has("macunix")
   nmap <D-j> <M-j>
   nmap <D-k> <M-k>
   vmap <D-j> <M-j>
   vmap <D-k> <M-k>
 endif
 
 " Delete trailing white space on save, useful for some filetypes ;)
 fun! CleanExtraSpaces()
     let save_cursor = getpos(".")
     let old_query = getreg('/')
     silent! %s/\s\+$//e
     call setpos('.', save_cursor)
     call setreg('/', old_query)
 endfun
 
 if has("autocmd")
     autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
 endif


" functon Haspaste
 function! HasPaste()
     if &paste
         return 'PASTE MODE  '
     endif
     return ''
 endfunction

 " Vundle
 
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'xolox/vim-colorscheme-switcher'
 Plugin 'xolox/vim-misc'

 call vundle#end()

 let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

"   Syntastic
 let g:syntastic_enable_signs=1
 let g:syntastic_auto_jump=0
 let g:syntastic_auto_loc_list=1
 let g:symtastic_quiet_warnings=0
