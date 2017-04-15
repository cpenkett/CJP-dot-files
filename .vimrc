set nocompatible

if has('syntax')
  syntax on
endif

colorscheme morning
set background=light
highlight Search cterm=none ctermbg=darkgreen ctermfg=white
highlight MatchParen cterm=none ctermbg=darkred ctermfg=grey
highlight PyFlakes cterm=none ctermbg=red ctermfg=white

if version >= 700

  set title
  silent !echo -ne "\033]12;RoyalBlue1\007"
  let &t_SI = "\033]12;Green3\007"
  let &t_EI = "\033]12;RoyalBlue1\007"

  if has('autocmd')

    autocmd VimLeave * !echo -ne "\033]12;red\007"; clear

    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufReadPost *.doc %!antiword '%'
    " autocmd BufEnter * call DoWordComplete()
    " autocmd BufEnter c,cpp,perl,java,python call ToggleColours()

    filetype on
    filetype indent on
    filetype plugin on
    filetype plugin indent on

    autocmd FileType * set formatoptions=tcql nocindent comments&
    autocmd FileType c,cpp set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
    autocmd FileType c,cpp,perl,java set omnifunc=syntaxcomplete#Complete
    autocmd FileType python set ofu=pythoncomplete#Complete

  endif

endif

set mouse=a

set foldmethod=indent
set foldlevel=99

set autoindent
set smartindent
set expandtab
" set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set nolist              " Don't show non printing characters
set wrap                " Wrap longer lines

set hidden              " Hide buffers when they are abandoned
" set showtabline=2     " Always show tabs
" set laststatus=2      " Always show a status line
" set cpoptions=n
" tab sball

set hlsearch            " Highlight searches
set incsearch           " Incremental search
set magic               " Use extended reg-exps - add \v for very magic
" set ignorecase          " Do case insensitive matching
" set smartcase           " Do smart case matching
" set gdefault            " Set 'g' flag in :s/foo/bar/

" set digraph             " Allow easy typing of unusual chars
set nodigraph           " Must use C-k for digraphs
set spelllang=en_gb     " Set spelling languange
" set spell               " Turn spelling mode on
set nospell             " Spelling mode off - less red in code!
set dictionary+=/usr/share/dict/british-english
" set thesaurus+=$HOME/project/thesaurus/mthesaur.txt
" set complete+=k         " C-n and C-p use dictionary
" set complete+=s         " C-n and C-p use thesaurus
set completeopt=menuone,longest,preview " Completion options

" By default, mapleader = '\'
" let mapleader = ','
map <Leader>q :q<CR>
map <Leader>z :q<CR>
map <Leader>Q :q!<CR>
map <Leader>Z :wq<CR>

map! <Leader>q <Esc>:q<CR>
map! <Leader>z <Esc>:q<CR>
" map! <Leader>Q <Esc>:q!<CR>
" map! <Leader>Z <Esc>:wq<CR>

map Y y$
map £ ggVG

map zx :q<CR>
" map Q :q!<CR>
map Q @q
" map Q <Nop>
" map z :q<CR>
" map Z :wq<CR>

" Force a write with sudo
" cmap w!! %!sudo tee > /dev/null %

" In insert mode, C-a and C-e aren't very useful, so use the Emacs ones instead
noremap! <C-a> <Esc>I
noremap! <C-e> <Esc>A

" C-k is useful, map C-space to C-n
" noremap! <C-k> <Esc><right>C
noremap! <Nul> <C-n>

" Easier moving in tabs and windows
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
"map <C-L> <C-W>l<C-W>_
"map <C-H> <C-W>h<C-W>_

" New tabs
nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>

" Don't make a # be forced to go start in column zero
inoremap # X<BS>#
nmap <C-w>1 :only<CR>
nmap <C-w>2 <C-w>s

"inoremap <F2> <Esc>:call ToggleMode()<CR><Insert>
noremap <F2> :call ToggleMode()<CR>
noremap <F3> :call ToggleColours()<CR>
"noremap <F4> :call ToggleMouse()<CR>
noremap <F4> :call ToggleComp()<CR>

set pastetoggle=<F5>

nmap <F6> :set spell! spell?<CR>
nmap <F7> :set digraph! digraph?<CR>

imap <F8> <Esc><Right>n<Insert>
nmap <F8> :set hlsearch! hlsearch?<CR>

" taglist plugin
" nnoremap <silent> <F9> :TlistToggle<CR>

function! ToggleMode()

  if &ts == 2
    echo 'Text mode'

    set noai
    set nosi
    set noet
    set ts=8
    set sts=8
    set sw=8

    set list
    set nowrap

  else
    echo 'Coding mode'

    set ai
    set si
    set et
    set ts=2
    set sts=2
    set sw=2

    set nolist
    set wrap

  endif

endfunction

function! ToggleColours()

  if &bg == 'light'

    colorscheme default
    set background=dark

    if version >= 700
      silent !echo -ne "\033]12;red\007"
      let &t_SI = "\033]12;orange\007"
      let &t_EI = "\033]12;red\007"
    endif

  else

    colorscheme morning
    set background=light
    hi Search cterm=none ctermbg=darkgreen ctermfg=white
    hi MatchParen cterm=none ctermbg=darkmagenta ctermfg=grey
    hi PyFlakes cterm=none ctermbg=red ctermfg=white

    if version >= 700
      silent !echo -ne "\033]12;RoyalBlue1\007"
      " let &t_SI = "\033]12;green\007"
      let &t_SI = "\033]12;Green3\007"
      let &t_EI = "\033]12;RoyalBlue1\007"
    endif

  endif

endfunction

function! ToggleComp()

  if &complete == '.,w,b,u,t,i'
    echo 'Libraries off'
    set complete-=i
  else
    echo 'Libraries on'
    set complete+=i
  endif

endfunction

set history=1000        " Number of lines of command line history
set undolevels=1000     " Number of undo levels
set showcmd             " Show (partial) command in status line
set showmatch           " Jump to matching bracket
set showmode            " Show current mode
set ruler               " Show the line and column numbers of the cursor
set scrolloff=5         " Keep a context when scrolling
set modeline            " Enable modeline - insecure for root
set esckeys             " Cursor keys in insert mode
set ttyscroll=0         " Turn off scrolling (this is faster)
set ttyfast             " We have a fast terminal connection
set encoding=utf-8      " Set default encoding to UTF-8

set noerrorbells        " No beeps
set visualbell t_vb=    " Turn off error beep/flash
set novisualbell        " Turn off visual bell

set t_RV=               " Fixes a bug so -w/-W options do the right thing
" set autowrite           " Automatically save before commands like :next and :make
" set nobackup            " Do not keep a backup file
" set number              " Show line numbers
" set relativenumber      " Show relative line numbers
" set laststatus=2        " Always show a status line

" set selectmode+=mouse   " Sets mouse to select mode if mouse=v or mouse=a
" set mouse=nich          " Mouse not set for visual or select modes

" These are for the :set list option
set lcs=tab:>-          " Tabs are shown as >-
set lcs+=trail:.        " Trailing spaces are shown as periods
" set lcs+=eol:$          " New lines are shown as $

set nostartofline       " Do not jump to first character with page commands
set viminfo='50,\"50    " Don't store more than 50 lines of registers

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Path/file expansion in colon-mode
set wildmode=list:longest
set wildchar=<TAB>
" set wildmenu

" There is a deliberate space at the end of the next line
" set showbreak=↳\ 

" abbreviations
ab *h use strict;<CR>use warnings;<CR>
ab *c # Comment - Entered on :r! date-JA

ab #b /********************************************************
ab #e ********************************************************/
ab #l /*------------------------------------------------------*/

" These C-code indent variables don't work well for me in perl/python
" set cindent
" set cinkeys={,0},:,0#,!<Tab>,!^F

" Some completion mappings
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" minibufexpl plugin
" let g:miniBufExplMapWindowNavVim = 1 
" let g:miniBufExplMapWindowNavArrows = 1 
" let g:miniBufExplMapCTabSwitchBufs = 1 
" let g:miniBufExplModSelTarget = 1 

" taglist plugin - not needed if ctags is in $PATH
" let Tlist_Ctags_Cmd = '/usr/bin/ctags'

" supertab plugin
" let g:SuperTabDefaultCompletionType = "context"

" pyflakes plugin
"let g:pyflakes_use_quickfix = 0

""" Emacs keybindings
" first move the window command because we'll be taking it over
" noremap <C-x> <C-w>
"" Movement left/right
" noremap! <C-b> <Left>
" noremap! <C-f> <Right>
"" word left/right
" noremap  <M-b> b
" noremap! <M-b> <C-o>b
" noremap  <M-f> w
" noremap! <M-f> <C-o>w
"" line start/end
" noremap  <C-a> ^
" noremap! <C-a> <Esc>I
" noremap  <C-e> $
" noremap! <C-e> <Esc>A
"" Rubout word / line and enter insert mode
" noremap  <C-w> i<C-w>
" noremap  <C-u> i<C-u>
"" Forward delete char / word / line and enter insert mode
" noremap! <C-d> <C-o>x " C-d is useful in vi insert mode
" noremap  <M-d> dw
" noremap! <M-d> <C-o>dw
" noremap  <C-k> Da
" noremap! <C-k> <C-o>D
"" Undo / Redo and enter normal mode
" noremap  <C-_> u
" noremap! <C-_> <C-o>u<Esc><Right>
" noremap! <C-r> <C-o><C-r><Esc>
