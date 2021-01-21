"            _
"           (_)
"     __   ___ _ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"     (_)_/ |_|_| |_| |_|_|  \___|
" by m3tro1d


" Plugins {{{
" https://github.com/junegunn/vim-plug
call plug#begin('~/AppData/Local/nvim/plugged')
" Appearance
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
" Project management
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive', { 'on': ['G', 'Git', 'Gw', 'Gcommit'] }
" Editing
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }
" Writing prose
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'reedes/vim-colors-pencil'
" Miscellaneous
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-dispatch', { 'on': ['Make', 'Dispatch'] }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
call plug#end()
" }}}

" Basics {{{
let mapleader=' '
language en_US
set spelllang=en_us,ru_ru
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
" let g:python3_host_prog = 'C:\Users\[user_name]\AppData\Local\Programs\Python\Python39\python.exe'
" }}}

" Behavior {{{
" Priority of end-of-line formats
set fileformats=dos,unix,mac
" Priority of encodings
set fileencodings=utf-8,cp1251,cp866,koi8-r
" Automatically hide buffer when it's unsaved (also allows to use :bufdo)
set hidden
" Ask if there are unsaved files
set confirm
" Messages settings
set shortmess=filmnrx
" Shorter delays (in ms)
set updatetime=300
" Store swap files
set swapfile
set directory=$HOME/AppData/Local/nvim/.swap//
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), 'p')
endif
" Disable backup files
set nobackup nowritebackup
" Do not store netrw history
let g:netrw_dirhistmax = 0
" Auto completion in command mode
set wildmenu wildignorecase
set wildmode=longest,list,full
set wildignore+=*.exe,*.o,*.obj
set wildignore+=.git/**,__pycache__/**,node_modules/**
" Don't jump to matching pairs
set noshowmatch
" Split windows at the bottom and right
set splitbelow splitright
" Don't update screen while running macros (makes them faster & uses less resources)
set lazyredraw
" Jump to the buffer instead of switching if it's already opened
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
autocmd BufRead,BufNewFile ~/AppData/Local/nvim/* setlocal modeline
" Auto-resize splits when Vim gets resized
autocmd VimResized * wincmd=
" Turn off paste when leaving insert mode
autocmd InsertLeave * set nopaste
" }}}

" Appearance {{{
" Theme settings
syntax enable
set termguicolors
set background=dark
colorscheme onedark
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
" Height of the cmd line
set cmdheight=1
" Show commands in bottom-right corner
set showcmd
" Disable startup message
set shortmess=I
" Don't show current mode
set noshowmode
" Set the window's title to the current filename
set title titlestring=%{expand(\"%:t\")}
" Disable scrollbars & toolbars in GUI
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
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
nnoremap C "_C
noremap x "_x
nnoremap X "_X
" Intuitive yank (like D)
nnoremap Y y$
" Intuitive replace
vnoremap p pgvy
" Intuitive line movement (if count is not provided, move by displayed lines)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" Macros tricks
nnoremap Q @q
xnoremap Q :norm @q<CR>
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
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bb :buffers<CR>:b<Space>
nnoremap <silent> <leader>bd :bwipeout!<CR>
" Toggle spell check
nnoremap <silent> <leader>s :setlocal spell!<CR>
" Fast vimrc access
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader>vs :so $MYVIMRC<CR>
" Comfortable editing in command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" Get current directory in command mode
cnoremap %% <C-r>=expand('%:p:h')<CR>\
" Some useful stuff for the terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" }}}

" Russian keymap {{{
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-j> <C-^>
autocmd InsertLeave * set iminsert=0
" }}}

" Some custom functions and commands {{{
source ~/AppData/Local/nvim/functions.vim
" }}}

" Plugins settings {{{
" Lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
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

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = [$HOME.'/AppData/Local/nvim/snips']

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

" Undotree
let g:undotree_HelpLine = 0
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 24
nnoremap <leader>u :UndotreeToggle<CR>

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key = '<C-z>'

" vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" vimwiki
let g:vimwiki_list = [{'path': 'D:\Documents\vimwiki\',
      \ 'ext': '.wiki',
      \ 'auto_diary_index': 1}]
let g:vimwiki_ext2syntax = {'.wiki': 'default'}

" Pencil theme
let g:pencil_spell_undercurl = 0

" Goyo
function! s:goyo_enter()
  call ProseMode()
  set background=light
  colorscheme pencil
endfunction
function! s:goyo_leave()
  call CodeMode()
  set background=dark
  colorscheme onedark
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" General files settings {{{
" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Automatically turn on spelling in git commit message
autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
" Sometimes the filetype is set incorrectly
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.asm,*.inc set filetype=nasm
" TeX type
let g:tex_flavor = 'latex'
" }}}

" Specific filetypes settings {{{
" Specific file mappings start with <leader>f
if has('nvim')
  augroup terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
endif

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
  " Get all labels
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fl :up \| Dispatch latex-get-labels "%:p"<CR>
  " Tidy up useless files
  autocmd FileType tex nnoremap <buffer> <silent> <leader>ft :cd %:h \| Dispatch! latex-tidyup "%"<CR><CR>
augroup END

augroup markdown
  autocmd!
  " Markdown-to-pdf with pandoc
  autocmd FileType markdown nnoremap <buffer> <silent> <leader>fc :up \| Dispatch! pandoc "%:p" -f markdown -t pdf -s -o "%:p:r.pdf"<CR>
  " Preview pdf
  autocmd FileType markdown nnoremap <buffer> <silent> <leader>fp :!start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%:p:r.pdf"<CR><CR>
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
