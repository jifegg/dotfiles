" Variables {{{
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
" }}}
" Base {{{
set nocompatible                        " use vim defaults not vi
let mapleader = ","
let g:mapleader = ","
set mouse=a                             " enable the mouse in all modes (i:inset mode ,c: command mode,n:normal mode; a:all)
set clipboard+=unnamed                  " share the clip board ouside
set autochdir                           " switch the dir to current dir 
set browsedir=buffer
set autoread                        " set to auto read when a file is changed from outside
" }}}
" Encoding {{{
if has("multi_byte")
    set encoding=utf-8                                                              " set the coding inside of vim to utf-8
    set fileencoding=uft-8
    set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5,euc-jp,euc-krl,latin1 " set the sort for encoding
    " solve the wrong coding of message
    if g:isLinux
        language POSIX
    else
        language messages en_US.uft-8
    endif
    source $VIMRUNTIME/delmenu.vim
    set langmenu=en_US.UTF-8
    source $VIMRUNTIME/menu.vim
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    set nobomb
else
    echoerr "sorry, this version of (g)vim was not compiled with multi_byte"
endif
" }}}
" Layout {{{
set shortmess=atI                       " abbreviate message
set confirm                             " show save dialog if command won't work with unsaved changes
set completeopt=longest,menu            " close the preview window when having autocomplete

set noerrorbells                        " no annouing sound on errors
set novisualbell
set vb t_vb=

set tm=500
set guicursor+=n-v-c:blinkon0           " left blank flash only in insert mode
set wildmenu                            " better command-line completion
set wildmode=list:longest               " set wildmenu to list choice
set wildignore=*.o,*~,*.pyc             " ignore complied files
set ruler                               " always show current position
set history=50                          " sets how many lines of history VIM has to remember  
set so=7                                " set 7 lines to the cursor
set report=0                            " tell us about changes
set lazyredraw                          " redraw only when we need to
set ttyfast                             " smoother changes
set backspace=eol,start,indent          " configure backspace so it acts ad it should act
set cursorline                          " cursor current line
set scrolloff=3                         " keep 3 lines when scrolling
set number                              " show line numbers
set formatoptions+=r                    " better comment
set showcmd                             " show partial commands in the last line of screen 
set cmdheight=1                         " height of the command bar
set laststatus=2                        " always show the statue line
set showtabline=2                       " always show tabs
set whichwrap+=<,>,h,l
set nowrap                              " don't wrap lines
set iskeyword+=_,$,@,%,#,-              " don't break word when word with this key char
set fileformats=unix,dos,mac            " use unix as the standard file type
set list                                " display whitespace
if g:isGUI
    " must after encoding setting if include unicode chars
    set listchars=tab:▸\ ,trail:·,precedes:«,extends:»,eol:¬
    " display blank with the windows were spilted
    set fillchars+=vert:\┆
    "set fillchars=vert:\ ,stl:\ ,stlnc:\
endif
"set linebreak                          " linebreak on 500 characters
"set textwidth=80
"Format the status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
" }}}
" Font & Color {{{
syntax enable                           " enable syntax highlighting
if g:isGUI
    "winpos 150 150                     " set default size:120x35
    "set lines=30
    "set columns=120
    au GUIEnter * simalt ~x             " start with fullscreen
    set guioptions-=m                   " hide menu
    set guioptions-=T                   " hide toolbar
   "set guioptions-=l                   " hide left scrollbar
    set guioptions+=r                   " show right scrolbar
    set guioptions+=b                   " show bottom scrollbar
    set t_Co=256                        " use 256 colors int XTerm
    set guitablabel=%M\ %t
    set guifont=Iosevka:h12
    "set guifont=Inziu\ Iosevka\ SC:h12
endif
" }}}
" Tab {{{
set tabstop=4                   " number of visual spaces per tab
set shiftwidth=4                " number of spaces in tab when editing
set expandtab                   " tabs are spaces
set modelines=1
"set smarttab                   " be smart when using tabs 
"set autoindent	                " auto indent
"set smartindent                " smart indent  
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " max 10 depth
set foldmethod=indent   " fold based on indent level
nnoremap <space> za
" }}}
" Searching {{{
set showmatch       " show matching brackets when text indicator is over them
set matchtime=2     " how many tenths of a second to blink when matching brackets
set incsearch       " do incremental searching
set hlsearch        " highlight searchs
set magic           " set magic on, for regular expressions
set ignorecase      " ignore case when searching
set smartcase       " when searching try be smart about cases
set nostartofline
" }}}
" Backup & Buffer {{{
set backupdir=$VIM/backup       " set backup dir
set directory=$VIM/backup
set nobackup                    " Turn backup off
set hidden                      " A buffer becomes hidden when it is abandoned
try                             " specify the behavior when switching between buffers 
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
autocmd BufReadPost *           " return to last edit position when opening files (You want this!)
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
command! Bclose call <SID>BufcloseCloseIt()
autocmd VimEnter * call TabPosInitialize()
set viminfo^=%                  " remember info about open buffers on close
" }}}
" FileType {{{
au BufRead,BufNewFile *.php set fileformat=unix
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType less setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType wxss setlocal shiftwidth=2 tabstop=2
autocmd FileType wxml setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
" }}}
" Plug {{{
" filetype off
" set rtp+=$VIM/vimfiles/bundle/Vundle.vim
" call vundle#begin('$VIM/vimfiles/bundle/')
call plug#begin('$VIM/vimfiles/plugged')

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'msanders/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'hdima/python-syntax'
Plug 'skammer/vim-css-color'
Plug '2072/vim-syntax-for-PHP'
Plug 'terryma/vim-multiple-cursors'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'morhetz/gruvbox'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'fatih/vim-go'
"Plugin 'moll/vim-node'
"Plugin 'davidhalter/jedi-vim'

call plug#end()
"filetype plugin indent on
"call togglebg#map("<F5>")
" }}}
" Package Setting {{{
" tagbar {{{
nmap <silent> <F8> :TagbarToggle<CR>
" }}}
" nerdtree {{{
let NERDTreeWinPos = "left"
let NERDTreeShowBookmarks = 1
nmap <silent> <F7> :NERDTreeToggle<CR>
" }}}
" nerdcommenter {{{
let g:NERDCustomDelimiters = {
    \ 'html': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
    \ 'xhtml': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/'}, 
\}
let NERD_html_alt_style=1
" }}}
" solarized {{{
set background=dark
let g:solarized_termcolors=256
let g:solarized_italic=0
colorscheme solarized
" }}}
" gruvbox {{{
"let g:gruvbox_invert_selection = 0
"let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_contrast_light='soft'
"let g:gruvbox_italicize_comments = 0
"colorscheme gruvbox
" }}}
" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" }}}
" ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}
" snipmate {{{
let g:snippets_dir='$VIM/vimfiles/custom/snippets/'
" }}}
" vim-markdown {{{
let g:markdown_enable_spell_checking = 0
" }}}
" vim-go {{{
"au FileType go nmap <leader>r <Plug>(go-run)
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

" }}}
" }}}
" Mappings {{{
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

nmap tt :tabnew<CR>
nmap tn :tabnext<CR>
nmap tp :tabprevious<CR>
nmap tc :tabclose<CR> 
nmap to :tabonly<CR>
nmap tr :+tabmove<CR>
nmap tl :-tabmove<CR>

" delete ^M
nmap <leader>mm :%s/\r//g<CR>

" fast reloading of .vimrc
nmap <silent> <leader>s :tabnew $VIM/_vimrc<CR>

" fast editing of .vimrc
nmap <silent> <leader>e :e! $VIM/_vimrc<CR>
command -nargs=1 Vg :vimgrep <args> | copen
imap jk <ESC>

" toggle cursorcolumn
map <silent><leader>cr :call ToggleCursorColumn()<CR>
" }}}
" Tips {{{
" cs{motion}{str}: change the surround
" ys{motion}{str}: add the surround
" ds{motion}{str}: remove the surround
" iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
" :%!xxd to transform the file to Hexadecimal
" :%!xxd -r transform the Hexadecimal to  Binary
" }}}
" Functions {{{
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

" don't close window, when deleting a buffer
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

" toggle cursorcolumn
function! ToggleCursorColumn()
    if &cursorcolumn
        set nocursorcolumn
    else
        set cursorcolumn
    endif
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
