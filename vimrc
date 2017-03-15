"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Version Check                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:isWindows = 1
    let g:isLinux = 0
else
    let g:isLinux = 1
    let g:isWindows = 0
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 General                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                        " Use vim defaults not vi

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader  = ","

set shortmess=atI                       " Abbreviate message    
set confirm		                        " Show save dialog if command won't work with unsaved changes
set completeopt=longest,menu            " Close the preview window when having autocomplete

" No annouing sound on errors
set noerrorbells 
set novisualbell 
set vb t_vb=

set tm=500
set guicursor+=n-v-c:blinkon0           " Left blank flash only in insert mode
set nomodeline                          " Security fix
set fillchars=vert:\ ,stl:\ ,stlnc:\    " Display blank with the windows were spilted
set wildmenu	                        " Better command-line completion
set wildmode=list:longest               " Set wildmenu to list choice
set wildignore=*.o,*~,*.pyc             " Ignore complied files
set ttyfast                             " Smoother changes
set ruler                               " Always show current position
set history=50                          " Sets how many lines of history VIM has to remember  
set so=7                                " Set 7 lines to the cursor
set report=0                            " Tell us about changes
set lazyredraw                          " redraw only when we need to

"Configure backspace so it acts ad it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set list
"scriptencoding utf-8
"set encoding=utf-8


set mouse=a             " Enable the mouse in all modes (i:inset mode ,c: command mode,n:normal mode; a:all)
set cursorline          " Cursor current line
set autochdir           " Switch the dir to current dir 
set browsedir=buffer
set scrolloff=3         " Keep 3 lines when scrolling
set autoread	        " Set to auto read when a file is changed from outside
set clipboard+=unnamed  " Share the clip board ouside
set number	            " Show line numbers   
set formatoptions+=r    " Better comment
set showcmd             " Show partial commands in the last line of screen 
set cmdheight=1         " Height of the command bar
set laststatus=2        "Always show the statue line

"Format the status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Colors and Fonts                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   " Enable syntax highlighting
set guifont=Iosevka:h12
"set guifont=Megatops\ ProCoder\ 1.0:h13
"set guifont=Inziu\ Iosevka\ SC:h12


" Set extra options when running in GUI mode
if has("gui_running")
    "winpos 150 150         "set default size:120x35
    "set lines=30
    "set columns=120
    au GUIEnter * simalt ~x
    au GUIEnter * simalt ~x
    "hide the menue and toolbar
    set guioptions-=m
    set guioptions-=T
   "set guioptions-=l       " hide left scrollbar
    set guioptions+=r       " hide right scrolbar
    set guioptions+=b       " hide bottom scrollbar
   "set showtabline=0       " hide tabline
    set t_Co=256            " Use 256 colors int XTerm
    set guitablabel=%M\ %t
endif

set fileformats=unix,dos,mac "Use Unix as the standard file type
au BufRead,BufNewFile *.php set fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Tab and Wrap                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4		            " number of visual spaces per TAB 
set shiftwidth=4	            " number of spaces in tab when editing
set expandtab                   " tabs are spaces
set modelines=1
"set smarttab		            " Be smart when using tabs 
"set autoindent		            " Auto indent
"set smartindent                " Smart indent  
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2


set nowrap                      " Don't wrap lines
set iskeyword+=_,$,@,%,#,-      " Don't break word when word with this key char
"set linebreak                  " Linebreak on 500 characters
"set textwidth=80              
set showtabline=2               " Always show tabs


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Files,Backups and Undo                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup dir
set backupdir=$VIM/backup
set directory=$VIM/backup

"set noswapfile
set nobackup                    " Turn backup off
set hidden                      " A buffer becomes hidden when it is abandoned


" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set viminfo^=%  " Remember info about open buffers on close


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Folding                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level
" space open/closes folds
nnoremap <space> za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Searching And Math                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmatch	" Show matching brackets when text indicator is over them 
set matchtime=2 " How many tenths of a second to blink when matching brackets
set incsearch	" Do incremental searching 
set hlsearch	" Highlight searchs   
set magic		" Set magic on, for regular expressions
set ignorecase	" Ignore case when searching 
set smartcase	" When searching try be smart about cases
set nostartofline 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 MultiByte Encoding                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
    set encoding=utf-8 "set the coding  inside of vim to utf-8
    set fileencoding=uft-8
    set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5,euc-jp,euc-krl,latin1 " Set the sort for encoding
    " Solve the wrong coding of message
    language messages en_US.uft-8
    source $VIMRUNTIME/delmenu.vim
    set langmenu=en_US.UTF-8
    source $VIMRUNTIME/menu.vim
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    set nobomb
else
    echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 chars                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Must after encoding setting if include unicode chars
set listchars=tab:▸\ ,trail:·,precedes:«,extends:»,eol:¬
set fillchars+=vert:\┆
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! TabPosActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction
function! TabPosInitialize()
    for i in range(0, 9)
        if i == 0 
            exe "map <M-0> :call TabPosActivateBuffer(10)<CR>"
        else
            exe "map <M-".i."> :call TabPosActivateBuffer(".i.")<CR>"
        endif
        exe "nmap t".i." :tabm ".i."<CR>"
    endfor
endfunction
autocmd VimEnter * call TabPosInitialize()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                TagbarToggle                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NERDTree                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "left" "placed NERDTree to left
let NERDTreeShowBookmarks = 1
nmap <silent> <F7> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Mapping                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Useful mappings for managing tabs
nmap tt :tabnew<CR>
nmap tn :tabnext<CR>
nmap tp :tabprevious<CR>
nmap tc :tabclose<CR> 
nmap to :tabonly<CR>
nmap tr :+tabmove<CR>
nmap tl :-tabmove<CR>

" Delete ^M
nmap <leader>mm :%s/\r//g<CR>    

" Fast reloading of .vimrc
nmap <silent> <leader>s :tabnew $VIM/_vimrc<CR>
" Fast editing of .vimrc
nmap <silent> <leader>e :e! $VIM/_vimrc<CR>

command -nargs=1 Vg :vimgrep <args> | copen

imap jk <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vundle                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/')

Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'hdima/python-syntax'
Plugin 'skammer/vim-css-color'
Plugin '2072/vim-syntax-for-PHP'
"Plugin 'bling/vim-airline'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'fatih/vim-go'
"Plugin 'moll/vim-node'
"Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

set background=dark
call togglebg#map("<F5>")


let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 solarized                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_italic=0
colorscheme solarized			" Use this color scheme


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                gruvbox                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gruvbox_vert_split='bg1'
"let g:gruvbox_invert_selection = 0
"let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_contrast_light='soft'
"let g:gruvbox_italicize_comments = 0
"colorscheme gruvbox
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-go                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               nerdcommenter                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCustomDelimiters = {
    \ 'html': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
    \ 'xhtml': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/'}, 
\}
let NERD_html_alt_style=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-markdown                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              indent-guides                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"use ,ig

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              snipmate                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets_dir='$VIM/vimfiles/custom/snippets/'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              airline                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ctrlp                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Tips                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cs{motion}{str}: change the surround
" ys{motion}{str}: add the surround
" ds{motion}{str}: remove the surround
" iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
" :%!xxd to transform the file to Hexadecimal
" :%!xxd -r transform the Hexadecimal to  Binary
"
" vim:foldmethod=marker:foldlevel=0
