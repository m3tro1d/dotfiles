"            _
"           (_)
"     __   ___ _ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
" by m3tro1d


" Config location {{{
" This is system-dependent
if has('win32')
  let $VIMCONF=$HOME . '/AppData/Local/nvim'
else
  let $VIMCONF=$HOME . '/.config/nvim'
endif
" }}}

" Plugins {{{
" Using https://github.com/junegunn/vim-plug

" Check if the plugin directory exists
if !isdirectory($VIMCONF . '/plugged')
  call mkdir($VIMCONF . '/plugged', 'p')
endif

call plug#begin($VIMCONF . '/plugged')
" Appearance
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
" Plug 'joshdick/onedark.vim'
Plug 'sainnhe/forest-night'
Plug 'thaerkh/vim-indentguides', { 'for': 'javascript' }
" Project management
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive', { 'on': ['G', 'Git', 'Gw', 'Gcommit'] }
" Editing
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
" Miscellaneous
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-dispatch', { 'on': ['Make', 'Dispatch'] }
call plug#end()
" }}}

" Basics {{{
let mapleader=' '
set spelllang=en_us,ru_ru
if has('win32')
  language en_US
else
  language en_US.UTF-8
endif
" Enable mouse only in normal mode
set mouse=n
" Less command history
set history=500
" Compatibility settings
set nocompatible
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
" Python path
if has('win32')
  let g:python3_host_prog = $HOME . '/AppData/Local/Programs/Python/Python39/python.exe'
else
  let g:python3_host_prog = '/bin/python3'
endif
" }}}

" Behavior {{{
" Priority of end-of-line formats
if has('win32')
  set fileformats=dos,unix,mac
else
  set fileformats=unix,mac,dos
endif
" Priority of encodings
set fileencodings=utf-8,cp1251,cp866,koi8-r
" Automatically hide buffer when it's unsaved (also allows to use :bufdo)
set hidden
" Ask if there are unsaved files
set confirm
" Longer updatetime (def: 4000 ms) leads to delays and poor UX
set updatetime=50
" Disable swap files
set noswapfile
" Disable backup files
set nobackup nowritebackup
" Do not store netrw history
let g:netrw_dirhistmax = 0
" Auto completion in command mode
set wildmenu wildignorecase
set wildmode=longest,list,full
set wildignore+=*.exe,*.o,*.obj
set wildignore+=**/.git/**,**/__pycache__/**,**/node_modules/**
" Don't show insert completion messages
set shortmess+=c
" Recursive :find in the current directory
set path+=**
" Don't jump to matching pairs
set noshowmatch
" Split windows at the bottom and right
set splitbelow splitright
" Don't update screen while running macros (makes them faster & uses less resources)
set lazyredraw
" Jump to the buffer window instead of switching if it's already opened
set switchbuf=useopen
" Preview for :s command
set inccommand=nosplit
" Treat numbers as either decimal or hex when using CTRL-A|X
set nrformats=hex
" Allow backspace in insert mode
set backspace=indent,eol,start
" Keeps the right amount of spaces when joining lines
set nojoinspaces
" Don't beep or flash on errors
set noerrorbells novisualbell t_vb=
" Reload file automatically if it was changed
set autoread
autocmd FocusGained,BufEnter * checktime
" Enable modeline only for my files (for security purposes)
set nomodeline
set modelines=1
autocmd BufRead,BufNewFile $VIMCONF/* setlocal modeline
" Auto-resize splits when Vim gets resized
autocmd VimResized * wincmd=
" Turn off paste when leaving insert mode
autocmd InsertLeave * set nopaste
" }}}

" Appearance {{{
" Theme settings
syntax enable
if has('termguicolors')
  set termguicolors
endif
set background=dark
colorscheme forest-night
" Disable cursor blinking in UI
set guicursor+=a:blinkon0
" Line numbering
set number relativenumber
" Show cursor position
set ruler
" Always show statusline
set laststatus=2
" Hide mouse when typing
set mousehide
" Height of the cmd line (bigger helps avoiding hit-enter prompt)
set cmdheight=1
" Show commands in bottom-right corner
set showcmd
" Don't show current mode
set noshowmode
" Set the window's title to the current filename
set title titlestring=%{expand(\"%:t\")}
" Disable scrollbars & toolbars in GUI
set guioptions-=r guioptions-=R
set guioptions-=l guioptions-=L
set guioptions-=T
" }}}

" Search {{{
" Highlight search results
set nohlsearch
" Show results while typing
set incsearch
" Ignore case if query is lowercase
set ignorecase smartcase
" }}}

" Indentation {{{
" Insert shiftwidth in front of a line, tabstop & softtabstop otherwise
set smarttab
" Smart automatic indentation
set autoindent smartindent
" White spaces instead of tabs
set expandtab
" Amount of white spaces in tab
set tabstop=2
" Number of spaces to be deleted and inserted with Backspace
set softtabstop=2
" Number of spaces shifted with <, >, etc.
set shiftwidth=2
" Round the indentation to shiftwidth when shifting with <, >, etc.
set shiftround
" }}}

" Text display {{{
" Don't automatically break lines
set textwidth=0
" Wrap text and break the lines by words
set wrap linebreak
" Proper indentation for wrapped lines
set breakindent
set breakindentopt=shift:2
" Show line wrappings
set showbreak=»
" Always try to show paragraph's last line
set display+=lastline
" Make 1 line above, below and sideways the cursor always visible
set scrolloff=1 sidescrolloff=1
" }}}

" Mappings {{{
" Change and delete to the blackhole register
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
nnoremap x "_x
xnoremap x "_x
nnoremap X "_X
" Intuitive yank (like D)
nnoremap Y y$
" Intuitive replace
vnoremap p pgvy
" Intuitive line movement (if count is not provided, move by displayed lines)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" Cool macro trick
nnoremap Q @q
xnoremap Q :<C-u>norm @q<CR>
" Faster movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Faster window resizing
nnoremap <Right> <C-w>>
nnoremap <Left> <C-w><
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
" Switch between vertical and horizontal splits
nnoremap <Leader>tv <C-w>t<C-w>H
nnoremap <Leader>th <C-w>t<C-w>K
" Copy and paste using system clipboard
noremap <leader>y "+y
noremap <leader>p "+p
" Toggle paste mode
set pastetoggle=<F2>
" Some tricks for the buffers
nnoremap <silent> <leader>bn :<C-u>bnext<CR>
nnoremap <silent> <leader>bp :<C-u>bprevious<CR>
nnoremap <silent> <leader>bb :<C-u>buffers<CR>:b<Space>
nnoremap <silent> <leader>bd :<C-u>bwipeout!<CR>
" Toggle spell check
nnoremap <silent> <leader>s :<C-u>setlocal spell!<CR>
" Comfortable editing in command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" Get current directory in command mode
cnoremap %% <C-r>=expand('%:p:h')<CR>\
" }}}

" Russian keymap {{{
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-j> <C-^>
autocmd InsertLeave * set iminsert=0
" }}}

" Some custom functions and commands {{{
source $VIMCONF/functions.vim
" }}}

" Plugins settings {{{
" Lightline
let g:lightline = {
      \ 'colorscheme': 'forest_night',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'keymap', 'mode', 'paste' ],
      \             [ 'filename', 'gitbranch' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead',
      \   'keymap': 'LightlineKeymap',
      \ },
      \ }
function! LightlineFilename()
  " '+' - modified; '-' - readonly
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : &modifiable ? '' : ' -'
  return filename . modified
endfunction
function! LightlineKeymap()
  return &iminsert == 1 ? 'RU' : ''
endfunction
call lightline#init()
call lightline#colorscheme()

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = [$VIMCONF . '/snips']

" NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeWinSize = 30
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.git$']
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" vimwiki
if has('win32')
  let g:vimwiki_list = [{'path': 'D:\Documents\vimwiki\',
        \ 'ext': '.wiki',
        \ 'auto_diary_index': 1}]
else
  let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
        \ 'ext': '.wiki',
        \ 'auto_diary_index': 1}]
endif
let g:vimwiki_ext2syntax = {'.wiki': 'default'}

" vim-indentguides
let g:indentguides_ignorelist = ['text', 'help']
" }}}

" General files settings {{{
" Turn off automatic text formatting (both text and comments)
autocmd BufRead,BufNewFile * setlocal formatoptions-=t formatoptions-=c
" Turn off automatic comment insertion
autocmd BufRead,BufNewFile * setlocal formatoptions-=r formatoptions-=c formatoptions-=o
" Automatically turn on spelling for the needed file types
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
" Sometimes the filetype is set incorrectly
autocmd BufRead,BufNewFile *.tex set filetype=tex
" TeX type
let g:tex_flavor = 'latex'
" }}}

" Specific filetypes settings {{{
" Specific file mappings start with <leader>f
augroup python
  autocmd!
  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal colorcolumn=80
  " Remove trailings automatically
  autocmd BufWritePre *.py,*.pyw silent! call CleanTrailings()
augroup END

augroup tex
  autocmd!
  autocmd FileType tex setlocal tabstop=2
  autocmd FileType tex setlocal softtabstop=2
  autocmd FileType tex setlocal shiftwidth=2
  " Compile
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fc :up \| cd %:h \| !pdflatex "%"<CR>
  " Preview pdf
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fp :!start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%:p:r.pdf"<CR><CR>
  " Tidy up useless files
  autocmd FileType tex nnoremap <buffer> <silent> <leader>ft :cd %:h \| Dispatch! latex-tidyup "%"<CR><CR>
augroup END

augroup snippets
  autocmd!
  autocmd FileType snippets setlocal expandtab
  autocmd FileType snippets setlocal tabstop=2
  autocmd FileType snippets setlocal softtabstop=2
  autocmd FileType snippets setlocal shiftwidth=2
augroup END
" }}}

" vim: set fdm=marker:
