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
  let $VIMCONF = $HOME . '/AppData/Local/nvim'
else
  let $VIMCONF = $HOME . '/.config/nvim'
endif
" }}}

" Plugins {{{
" Using https://github.com/junegunn/vim-plug
" Create the plugin directory if it doesn't exists
if !isdirectory($VIMCONF . '/plugged')
  call mkdir($VIMCONF . '/plugged', 'p')
endif
call plug#begin($VIMCONF . '/plugged')
" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'nelsyeung/twig.vim'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/everforest'
Plug 'mhinz/vim-startify'

" Project management
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }

" Miscellaneous utilities
Plug 'tpope/vim-dispatch', { 'on': ['Make', 'Dispatch'] }
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'aserebryakov/vim-todo-lists'

" Some colorschemes for alternating
" Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'sainnhe/sonokai'
" Plug 'sainnhe/gruvbox-material'
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
  let g:python3_host_prog = $HOME . '\AppData\Local\Programs\Python\Python39\python.exe'
else
  let g:python3_host_prog = '/bin/python3'
endif
" }}}

" Behavior {{{
" Autocommands group for the general settings so they won't stack
augroup settings
  autocmd!
augroup END
" Priority of end-of-line formats
if has('win32')
  set fileformats=dos,unix
else
  set fileformats=unix,dos
endif
" Priority of encodings
set fileencodings=utf-8,cp1251,cp866,koi8-r
" Automatically hide buffer when it's unsaved (also allows to use :bufdo)
set hidden
" Ask if there are unsaved files
set confirm
" Longer updatetime (def: 4000 ms) leads to delays and poor UX
set updatetime=100
" Waiting interval for the mapped commands
set timeoutlen=500
" Disable swap files
set noswapfile
" Disable backup files
set nobackup nowritebackup
" Auto completion for files and commands
set wildmenu wildignorecase
set wildmode=longest,list,full
set wildignore+=*.exe,*.o,*.obj
set wildignore+=*/.git/*,*/__pycache__/*,*/node_modules/*
set wildignore+=*/var/*,*/vendor/*,*/public/build/*
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
if has('nvim')
  " Preview for :s command
  set inccommand=nosplit
endif
" Treat numbers as either decimal or hex when using CTRL-A|X
set nrformats=hex
" Disable dangerous settings in the modeline and .exrc
" set secure
" Enable .exrc settings
set exrc
" Allow backspace in insert mode
set backspace=indent,eol,start
" Keeps only one whitespace when joining lines
set nojoinspaces
" Don't beep or flash on errors
set noerrorbells novisualbell t_vb=
" Change dir for the current file automatically
" set autochdir
" Reload file automatically if it was changed
set autoread
autocmd settings FocusGained,BufEnter * checktime
" Auto-resize splits when Vim gets resized
autocmd settings VimResized * wincmd=
" Turn off paste when leaving insert mode
autocmd settings InsertLeave * set nopaste
" Automatically reload vimrc
autocmd settings BufWritePost $MYVIMRC source $MYVIMRC
" }}}

" Appearance {{{
" Theme settings
syntax enable
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:everforest_background = 'medium'
colorscheme everforest
" Disable cursor blinking in GUI
" set guicursor+=a:blinkon0
" Line numbering
set number relativenumber
" Show cursor position
set ruler
" Always show statusline
set laststatus=2
" Hide the mouse pointer when typing
set mousehide
" Height of the cmd line (bigger helps avoiding hit-enter prompt)
set cmdheight=2
" Smaller completion menu
set pumheight=10
" Show current commands in the bottom-right corner
set showcmd
" Don't show current mode in the command line
set noshowmode
" Highlight current line
set cursorline
" Set the window's title to the current filename
set title titlestring=%{expand(\'%\')}
" }}}

" Search {{{
" Don't highlight search results
set nohlsearch
" Show results while typing
set incsearch
" Ignore case if query is lowercase (use \C to force match case)
set ignorecase smartcase
" }}}

" Indentation {{{
" Automatic indentation
set autoindent
" Use existing indentation settings in this file for new lines
set copyindent
" White spaces instead of tabs
set expandtab
" Number of spaces to be deleted and inserted with Backspace (negative to use shiftwidth)
set softtabstop=-1
" Number of spaces shifted with <, >
set shiftwidth=2
" Round the indentation to shiftwidth when shifting with <, >
set shiftround
" }}}

" Text display {{{
" Don't automatically break lines
set textwidth=0
" Wrap text and break the lines by words
set nowrap nolinebreak
" Proper indentation for wrapped lines
set breakindent
set breakindentopt=shift:2
" Show line wrappings
set showbreak=»
" Always try to show paragraph's last line
set display+=lastline
" Make 1 line above, below and sideways the cursor always visible
set scrolloff=1 sidescrolloff=1
" Turn off concealing by default
set conceallevel=0
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
xnoremap p pgvy
" Intuitive line movement (if count is not provided, move by displayed lines)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" Faster movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Window resizing
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
" Toggle 2 vertical and horizontal splits
nnoremap <leader>th <C-w>t<C-w>K
nnoremap <leader>tv <C-w>t<C-w>H
" Copy and paste using system clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>p "+p
xnoremap <leader>p "+p
" Toggle paste mode
set pastetoggle=<F2>
" Some mappings for the buffers
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>
" Quickfix list bindings
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [Q :cfirst<CR>
" Toggle spell check
nnoremap <silent> <leader>s :setlocal spell!<CR>
" Reload file in windows 1251
nnoremap <F12> :e ++enc=cp1251<CR>
" Comfortable editing in command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" Get current directory in the command mode
cnoremap %% <C-r>=expand('%:p:h')<CR>\
" Terminal mappings for Neovim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif
" }}}

" Russian keymap {{{
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
inoremap <C-j> <C-^>
autocmd settings InsertLeave * set iminsert=0
" }}}

" Some custom functions and commands {{{
" Quickfix list toggle {{{
function! QuickfixToggle() abort
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction
" }}}
nnoremap <silent> <leader>q :call QuickfixToggle()<CR>

" Virtual edit (cursor beyond EOL) {{{
function! VirtualEditToggle() abort
  if &ve == ''
    setlocal ve=all
    echo 'Virtual edit: ON.'
  else
    setlocal ve=
    echo 'Virtual edit: OFF.'
  endif
endfunction " }}}
command! VirtualEditToggle call VirtualEditToggle()<CR>

" Clean-up trailing whitespaces & newlines at EOF {{{
function! CleanTrailings() abort
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  " Trailing whitespaces
  silent! %s/\s\+$//e
  " Blank lines at EOF
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction " }}}
command! CleanTrailings call CleanTrailings()

" Placeholders for quick jumping {{{
function! PlaceholdersToggle() abort
  if !exists('b:PlaceholdersEnabled') || !b:PlaceholdersEnabled
    let b:PlaceholdersEnabled = 1
    nnoremap <buffer> <silent> <leader><leader> /<++><CR>c4l
    inoremap <buffer> <silent> <leader><leader> <Esc>/<++><CR>c4l
  else
    let b:PlaceholdersEnabled = 0
    nunmap <buffer> <leader><leader>
    iunmap <buffer> <leader><leader>
  endif
endfunction " }}}
command! PlaceholdersToggle call PlaceholdersToggle()

" Quickly change indentaion spaces amount {{{
function! ChangeTabstops(current, new) abort
  let &l:tabstop = a:current
  let &l:shiftwidth = a:current
  setlocal noexpandtab
  retab!
  let &l:tabstop = a:new
  let &l:shiftwidth = a:new
  setlocal expandtab
  retab
endf
" }}}
command! -nargs=* ChangeTabstops call ChangeTabstops(<f-args>)

" Commands {{{
" Soft-wrap the text for copying into the text processors
command! -range=% SoftWrap
      \ <line2>put _ |
      \ <line1>,<line2>g/.\+/ .;-/^$/ join | normal $x

" Create or switch to the scratch buffer
command! Scratch
      \ e scratch |
      \ setlocal buftype=nofile bufhidden=hide noswapfile
" }}}
" }}}

" Plugins settings {{{
" lightline.vim {{{
let g:lightline = {
      \ 'colorscheme': 'everforest',
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
function! LightlineFilename() abort
  " '+' - modified; '-' - readonly
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : &modifiable ? '' : ' -'
  return filename . modified
endfunction
function! LightlineKeymap() abort
  return &iminsert == 1 ? 'RU' : ''
endfunction
call lightline#init()
call lightline#colorscheme()
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
let g:UltiSnipsListSnippets = '<C-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = [$VIMCONF . '/snips']
" }}}

" NERDTree {{{
autocmd settings BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeWinSize = 30
let NERDTreeWinSizeMax = 50
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = [
      \ '\.git$', 'node_modules$', '\.idea$'
      \ ]
let NERDTreeBookmarksFile = ''
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFocus<CR>
nnoremap <silent> <leader>nF :NERDTreeFind<CR>
" }}}

" EasyAlign {{{
xmap gl <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)
" }}}

" netrw {{{
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" }}}

" matchit.vim {{{
if !exists('g:loaded_matchit')
  runtime! macros/matchit.vim
endif
" }}}

" ctags {{{
command! Tags Dispatch! ctags --exclude=.git --exclude=node_modules --exclude=__pycache__ -R .
" }}}

" emmet-vim {{{
let g:emmet_html5 = 0
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<C-z>'
augroup emmet
  autocmd!
  autocmd FileType html,css,pug,html.twig.js.css,php EmmetInstall
augroup END
" }}}

" ctrlp.vim {{{
let g:ctrlp_match_current_file = 1
let g:ctrlp_working_path_mode = 'wra'
let g:ctrlp_mruf_max = 25
nnoremap <silent> <C-p> :<C-u>CtrlP<CR>
" }}}

" fugitive {{{
nmap <silent> <leader>gg :<C-u>Git<CR>
" }}}

" gitgutter {{{
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
" }}}

" undotree {{{
nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>uf :UndotreeFocus<CR>
let g:undotree_WindowLayout = 2
" }}}

" startify {{{
let g:startify_session_dir = $VIMCONF . '/session'
let g:startify_files_number = 5
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_change_cmd = 'tcd'
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks = [
      \ {'c': $MYVIMRC},
      \ {'m': 'C:\Users\gnutella\AppData\Roaming\mpv\mpv.conf'},
      \ ]
let g:startify_commands = [
    \ {'h': ['Quick reference', 'h quickref']},
    \ {'u': ['Update plugins', 'PlugUpdate']},
    \ ]
let g:startify_skiplist = [
      \ '\\\.git\\',
      \ 'runtime\\doc\\.*\.txt$',
      \ 'plugged\\.*\\doc\\.*\.txt$',
      \ ]
" }}}
" }}}

" General files settings {{{
augroup formatting
  autocmd!
  " Turn off automatic text formatting (both text and comments)
  autocmd BufRead,BufNewFile * setlocal formatoptions-=t formatoptions-=c
  " Turn off automatic comment insertion
  autocmd BufRead,BufNewFile * setlocal formatoptions-=r formatoptions-=c formatoptions-=o
  " Preserve short lines and don't break words when formatting
  autocmd BufRead,BufNewFile * setlocal formatoptions+=w
augroup END

" LaTeX type
let g:tex_flavor = 'latex'
" }}}

" Specific filetypes settings {{{
" Specific file mappings start with <leader>f
augroup gitcommit " {{{
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal formatoptions+=t
  autocmd FileType gitcommit setlocal spell
augroup END " }}}

augroup python " {{{
  autocmd!
  autocmd FileType python setlocal colorcolumn=80
  " Run pylint with :make
  autocmd FileType python setlocal makeprg=pylint\ --output-format=parseable\ %
augroup END " }}}

augroup javascript " {{{
  autocmd!
  " Node.js file navigation with 'gf'
  autocmd FileType javascript setlocal include=require(
  autocmd FileType javascript setlocal suffixesadd=.js
  " Run eslint with :make
  autocmd FileType javascript setlocal makeprg=eslint\ --format\ compact\ %
  autocmd FileType javascript setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
augroup END " }}}

augroup latex " {{{
  autocmd!
  autocmd FileType tex setlocal conceallevel=0
  " Compile
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fc :up \| cd %:h \| !pdflatex "%"<CR>
  " Preview pdf
  autocmd FileType tex nnoremap <buffer> <silent> <leader>fp :!start "C:\Program Files\SumatraPDF\SumatraPDF.exe" "%:p:r.pdf"<CR><CR>
  " Tidy up useless files
  autocmd FileType tex nnoremap <buffer> <silent> <leader>ft :cd %:h \| Dispatch! latex-tidyup "%"<CR><CR>
augroup END " }}}

augroup dosbatch " {{{
  autocmd!
  autocmd FileType dosbatch setlocal fileformat=dos
augroup END " }}}

augroup php " {{{
  autocmd!
  autocmd FileType php setlocal shiftwidth=4
augroup END " }}}

augroup pascal " {{{
  autocmd!
  " autocmd FileType pascal setlocal makeprg=gpc\ %\ -o\ %:t:r
  autocmd FileType pascal setlocal errorformat+=%f(%l\\,%c)\ %m,%-G%.%#
  autocmd FileType pascal setlocal commentstring={%s}
  autocmd FileType pascal command! FindExtraSemicolons execute 'vimgrep /\v;\n?\s*(END|UNTIL)/ **/*.pas'
augroup END " }}}
" }}}

" vim: set fmr={{{,}}} fdm=marker:
