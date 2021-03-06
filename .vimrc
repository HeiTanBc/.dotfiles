set shell=/bin/sh/

"Plugin Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin() " Plugin start

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'google/vim-jsonnet'

call vundle#end()  "Plugin end

"Extra config vundle
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" =====================  General config
colorscheme x
set history=1000                " Store lots of :cmdline history
set lazyredraw                  " Don't redraw screen during macros
set tf                          " Improves redrawing for newer computers
set sc                          " Show incomplete command at bottom right
set timeoutlen=500              " Lower timeout for mappings
set cot=menu                    " Don't show extra info on completions
set mousemodel=popup
set spelllang=en_us
set complete+=kspell
let &colorcolumn=join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Search home directory path on cd. But can't complete.
set cdpath+=~
set cdpath+=~/Projects

set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=tags,./tags,tmp/tags,doc/tags
map <LocalLeader>gt :!ctags --extra=+f -R<CR><CR>

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s

set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

" set autochdir
let bufpane_showhelp = 0
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink

" =========================  No ERROR SOUNDS

set noerrorbells                " No noise
set novisualbell                " No blinking
set visualbell t_vb=            " disable any beeps or flashes on error
set shortmess=atI

set laststatus=2   " Always show the status line

" ========================= Mouse in term
set selectmode+=mouse
set mouse=a
set mousehide                 " Hide mouse after chars typed

set showmatch           " Show matching brackets.

"====================== Highlight when CursorMoved.
set cpoptions-=m
set matchtime=3
set matchpairs+=<:>     " Highlight <>.
set formatoptions=tcrqn
set magic               " Set magic on

set hidden
set title

"======================= Turn on syntax highlighting
syntax on

"======================= Search
set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing
set gdefault                   " search/replace "globally" (on a line) by default

set viminfo='100,f1            " Save up to 100 marks, enable capital marks

" ====================== Backup 

set backup              " make backup file
set backupdir=~/.cache/vim,/tmp  " where to put backup file
set directory=~/.cache/vim,/tmp   " directory is the directory for temp file
set noswapfile
set nowb
autocmd filetype crontab setlocal nobackup nowritebackup
set autowrite                   " Writes on make/shell commands
set autoread                    " Reload files changed outside vim

" no ex mode
nnoremap Q <nop>

" ====================== VIM SECURITY

set exrc
set secure

"============= Indent config: ================

set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set wrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

set splitbelow
set splitright

set wildmode=list:longest
set completeopt+=preview

set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*vendor/rails/**
set wildignore+=*vendor/cache/**
set wildignore+=*.gem
set wildignore+=*log/**
set wildignore+=*tmp/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.a,*.lib,*.so,CVS,vendor/qor,public/system
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*  " Linux/MacOSX

 set list                      " display unprintable characters f12 - switches
 set listchars=tab:\ ·,eol:¬
 set listchars+=trail:·
 set listchars+=extends:»,precedes:«
 map <silent> <F12> :set invlist<CR>

set scrolloff=0         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=18
set sidescroll=1

for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor

" ========================= File config
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,ucs-bom,gbk,gb2312,cp936
set encoding=utf8
set guifont=Monaco\ 16
highlight clear SignColumn
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%
map <Leader>ec :tabedit ~/.vimrc<CR>

" copy filename with line
noremap <silent> <leader>yl :let @+=expand("%:p:l").":".line(".")<CR>:echo @+<CR>
" copy full filename
noremap <silent> <Leader>yf :let @+=expand('%:p')<CR>:echo @+<CR>
" copy short filename
noremap <silent> <Leader>yF :let @+=expand('%')<CR>:echo @+<CR>
" copy file directory
noremap <silent> <Leader>yd :let @+=expand('%:p:h')<CR>:echo @+<CR>
" copy yanked text to clipboard
noremap <silent> <Leader>yy :let @+=@"<CR>:echo @+<CR>

map <LocalLeader>cd :lcd %:p:h<CR>:pwd<CR>

" =======================  Save file
nnoremap <Leader>o <C-w>o
nnoremap <Leader>c <C-w>c
imap <Leader>w <ESC>:update<CR>
map  <Leader>w <ESC>:update<CR>


" ======================= Copy & Paste
nmap gp "0p
nmap gP "+p
vmap gP "+p
vmap gy "+y


" ======================= Navigation keys  <M-hjkl>
ino <M-j> <DOWN>
ino <M-k> <UP>
ino <M-h> <LEFT>
ino <M-l> <RIGHT>

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

vnoremap k gk
vnoremap j gj
vnoremap gk k
vnoremap gj j


" make <c-l> clear the highlight as well as redraw
nnoremap <Leader>l :nohls<CR><C-L>
inoremap <Leader>l <C-O>:nohls<CR>

cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" =================================  Tab
nn <M-PageUp> :call MoveCurrentTab(-1)<CR>
nn <M-PageDown> :call MoveCurrentTab(1)<CR>

nn <Leader>1 1gt
nn <Leader>2 2gt
nn <Leader>3 3gt
nn <Leader>4 4gt
nn <Leader>5 5gt
nn <Leader>6 6gt
nn <Leader>7 7gt
nn <Leader>8 8gt
nn <Leader>9 9gt
nn <Leader>0 :tablast<CR>

ino <Leader>1 <C-o>1gt
ino <Leader>2 <C-o>2gt
ino <Leader>3 <C-o>3gt
ino <Leader>4 <C-o>4gt
ino <Leader>5 <C-o>5gt
ino <Leader>6 <C-o>6gt
ino <Leader>7 <C-o>7gt
ino <Leader>8 <C-o>8gt
ino <Leader>9 <C-o>9gt
ino <Leader>0 <C-o>:tablast<CR>

" ========================== Repo :)
" Git commits.
autocmd FileType gitcommit setlocal spell
" Subversion commits.
autocmd FileType svn       setlocal spell
" Mercurial commits.
autocmd FileType asciidoc  setlocal spell

" ========================== Function
function! FollowSymlink()
  let b:orig_file = fnameescape(expand('%:p'))
  if getftype(b:orig_file) == 'link'
    execute 'lcd' fnamemodify(resolve(b:orig_file), ':p:h')
    execute 'file' fnameescape(resolve(b:orig_file))
    :edit!
  endif
  redraw!
endfunction
command! FollowSymlink :call FollowSymlink()
nnoremap <Leader>F :FollowSymlink<CR>


function! OpenURL(url)
  let b:escape_url = escape(a:url, '"')
  if executable("chromium")
    exe "silent !chromium \"".b:escape_url."\""
  elseif executable("gnome-open")
    exe "silent !gnome-open \"".b:escape_url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
" open URL under cursor in browser
nnoremap <Leader>G :OpenURL http://www.google.com/search?q=<cword><CR>
vnoremap <Leader>G "zy:OpenURL http://www.google.com/search?q=<C-R>z<CR>
nnoremap <Leader>D :OpenURL http://dict.youdao.com/search?q=<cword><CR>
vnoremap <Leader>D "zy:OpenURL http://dict.youdao.com/search?q=<C-R>z<CR>

augroup filetypedetect
  au BufNewFile,BufRead  *.yml set filetype=yml.eruby
  au BufNewFile,BufRead  *.erb set filetype=eruby.html
augroup END

hi Visual ctermbg=240
hi CursorLine ctermbg=240 cterm=none
