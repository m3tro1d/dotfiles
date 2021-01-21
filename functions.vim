""" Custom functions live here


" Virtual edit (cursor beyond EOL)
function! VirtualEditToggle() " {{{
  if &ve == ""
    setlocal ve=all
    echo "Virtual edit: ON."
  else
    setlocal ve=
    echo "Virtual edit: OFF."
  endif
endfunction " }}}
command! VirtualEditToggle call VirtualEditToggle()<CR>

" Clean-up trailing whitespaces & newlines at EOF
function! CleanTrailings() " {{{
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  " Trailing whitespaces
  silent! %s/\s\+$//e
  " Blank lines at EOF
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
  call setreg('/', old_query)
  echo "Trailing cleared."
endfunction " }}}
command! CleanTrailings call CleanTrailings()

" Prose & code modes
function! ProseMode() " {{{
  " Settings
  set nonumber norelativenumber
  set noshowcmd showmode
  set conceallevel=1

  " Punctuation appreviations
  iabbrev <buffer> --- —
  iabbrev <buffer> ... …
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " Automatically format the paragraph (requires non-zero textwidth)
  setlocal formatoptions+=p
  " Don't break the lines after a one-letter word
  setlocal formatoptions+=1
endfunction " }}}
function! CodeMode() " {{{
  " Settings
  set number relativenumber
  set showcmd noshowmode
  set conceallevel=0

  " Remove all abbreviations
  iabclear <buffer>

  " Disable prose formatoptions
  setlocal formatoptions-=p
  setlocal formatoptions-=1
endfunction " }}}

" Dead keys
function! DeadKeysToggle() " {{{
  if !exists("b:DeadKeysEnabled") || !b:DeadKeysEnabled
    call DeadKeysEnable()
  else
    call DeadKeysDisable()
  endif
endfunction " }}}
function! DeadKeysEnable() " {{{
  let b:DeadKeysEnabled = 1
  echo "Dead Keys enabled."
  " grave accents
  inoremap <buffer> `a à
  inoremap <buffer> `e è
  inoremap <buffer> `i ì
  inoremap <buffer> `o ò
  inoremap <buffer> `u ù
  inoremap <buffer> `A À
  inoremap <buffer> `E È
  inoremap <buffer> `I Ì
  inoremap <buffer> `O Ò
  inoremap <buffer> `U Ù
  inoremap <buffer> `<space> `

  " umlaut
  inoremap <buffer> "a ä
  inoremap <buffer> "e ë
  inoremap <buffer> "i ï
  inoremap <buffer> "o ö
  inoremap <buffer> "u ü
  inoremap <buffer> "A Ä
  inoremap <buffer> "E Ë
  inoremap <buffer> "I Ï
  inoremap <buffer> "O Ö
  inoremap <buffer> "U Ü
  inoremap <buffer> "<space> "

  " macrons
  inoremap <buffer> :a ā
  inoremap <buffer> :e ē
  inoremap <buffer> :i ī
  inoremap <buffer> :o ō
  inoremap <buffer> :u ū
  inoremap <buffer> :A Ā
  inoremap <buffer> :E Ē
  inoremap <buffer> :I Ī
  inoremap <buffer> :O Ō
  inoremap <buffer> :U Ū

  " acute accents
  inoremap <buffer> 'a á
  inoremap <buffer> 'A Á
  inoremap <buffer> 'C Ć
  inoremap <buffer> 'c ć
  inoremap <buffer> 'e é
  inoremap <buffer> 'E É
  inoremap <buffer> 'i í
  inoremap <buffer> 'I Í
  inoremap <buffer> 'N Ń
  inoremap <buffer> 'n ń
  inoremap <buffer> 'o ó
  inoremap <buffer> 'R Ŕ
  inoremap <buffer> 'r ŕ
  inoremap <buffer> 'S Ś
  inoremap <buffer> 's ś
  inoremap <buffer> 'O Ó
  inoremap <buffer> 'u ú
  inoremap <buffer> 'U Ú
  inoremap <buffer> '<space> '

  " under dot
  inoremap <buffer> .D Ḍ
  inoremap <buffer> .d ḍ
  inoremap <buffer> .H Ḥ
  inoremap <buffer> .h ḥ
  inoremap <buffer> .L Ḹ
  inoremap <buffer> .l ḹ
  inoremap <buffer> .M Ṃ
  inoremap <buffer> .m ṃ
  inoremap <buffer> .N Ṇ
  inoremap <buffer> .n ṇ
  inoremap <buffer> .R Ṛ
  inoremap <buffer> .r ṛ
  inoremap <buffer> .G Ṝ
  inoremap <buffer> .g ṝ
  inoremap <buffer> .S Ṣ
  inoremap <buffer> .s ṣ
  inoremap <buffer> .T Ṭ
  inoremap <buffer> .t ṭ

  " tilde
  inoremap <buffer> ~a ã
  inoremap <buffer> ~A Ã
  inoremap <buffer> ~e ẽ
  inoremap <buffer> ~E Ẽ
  inoremap <buffer> ~i ĩ
  inoremap <buffer> ~I Ĩ
  inoremap <buffer> ~o õ
  inoremap <buffer> ~O Õ
  inoremap <buffer> ~u ũ
  inoremap <buffer> ~U Ũ
  inoremap <buffer> ~n ñ
  inoremap <buffer> ~N Ñ

  " caron
  inoremap <buffer> >A Ǎ
  inoremap <buffer> >a ǎ
  inoremap <buffer> >C Č
  inoremap <buffer> >c č
  inoremap <buffer> >E Ě
  inoremap <buffer> >e ě
  inoremap <buffer> >G Ǧ
  inoremap <buffer> >g ǧ
  inoremap <buffer> >I Ǐ
  inoremap <buffer> >i ǐ
  inoremap <buffer> >O Ǒ
  inoremap <buffer> >o ǒ
  inoremap <buffer> >R Ř
  inoremap <buffer> >r ř
  inoremap <buffer> >S Ṧ
  inoremap <buffer> >s ṧ
  inoremap <buffer> >U Ǔ
  inoremap <buffer> >u ǔ
  inoremap <buffer> >V Ǚ
  inoremap <buffer> >v ǚ
  inoremap <buffer> >Z Ž
  inoremap <buffer> >z ž
endfunction " }}}
function! DeadKeysDisable() " {{{
  echo "Dead Keys disabled."
  let b:DeadKeysEnabled = 0
  " grave accents
  iunmap <buffer> `a
  iunmap <buffer> `e
  iunmap <buffer> `i
  iunmap <buffer> `o
  iunmap <buffer> `u
  iunmap <buffer> `A
  iunmap <buffer> `E
  iunmap <buffer> `I
  iunmap <buffer> `O
  iunmap <buffer> `U
  iunmap <buffer> `<space>

  " umlaut
  iunmap <buffer> "a
  iunmap <buffer> "e
  iunmap <buffer> "i
  iunmap <buffer> "o
  iunmap <buffer> "u
  iunmap <buffer> "A
  iunmap <buffer> "E
  iunmap <buffer> "I
  iunmap <buffer> "O
  iunmap <buffer> "U
  iunmap <buffer> "<space>

  " macrons
  iunmap <buffer> :a
  iunmap <buffer> :e
  iunmap <buffer> :i
  iunmap <buffer> :o
  iunmap <buffer> :u
  iunmap <buffer> :A
  iunmap <buffer> :E
  iunmap <buffer> :I
  iunmap <buffer> :O
  iunmap <buffer> :U

  " acute accents
  iunmap <buffer> 'a
  iunmap <buffer> 'A
  iunmap <buffer> 'C
  iunmap <buffer> 'c
  iunmap <buffer> 'e
  iunmap <buffer> 'E
  iunmap <buffer> 'i
  iunmap <buffer> 'I
  iunmap <buffer> 'N
  iunmap <buffer> 'n
  iunmap <buffer> 'o
  iunmap <buffer> 'R
  iunmap <buffer> 'r
  iunmap <buffer> 'S
  iunmap <buffer> 's
  iunmap <buffer> 'O
  iunmap <buffer> 'u
  iunmap <buffer> 'U
  iunmap <buffer> '<space>

  " under dot
  iunmap <buffer> .D
  iunmap <buffer> .d
  iunmap <buffer> .H
  iunmap <buffer> .h
  iunmap <buffer> .L
  iunmap <buffer> .l
  iunmap <buffer> .M
  iunmap <buffer> .m
  iunmap <buffer> .N
  iunmap <buffer> .n
  iunmap <buffer> .R
  iunmap <buffer> .r
  iunmap <buffer> .G
  iunmap <buffer> .g
  iunmap <buffer> .S
  iunmap <buffer> .s
  iunmap <buffer> .T
  iunmap <buffer> .t

  " tilde
  iunmap <buffer> ~a
  iunmap <buffer> ~A
  iunmap <buffer> ~e
  iunmap <buffer> ~E
  iunmap <buffer> ~i
  iunmap <buffer> ~I
  iunmap <buffer> ~o
  iunmap <buffer> ~O
  iunmap <buffer> ~u
  iunmap <buffer> ~U
  iunmap <buffer> ~n
  iunmap <buffer> ~N

  " caron
  iunmap <buffer> >A
  iunmap <buffer> >a
  iunmap <buffer> >C
  iunmap <buffer> >c
  iunmap <buffer> >E
  iunmap <buffer> >e
  iunmap <buffer> >G
  iunmap <buffer> >g
  iunmap <buffer> >I
  iunmap <buffer> >i
  iunmap <buffer> >O
  iunmap <buffer> >o
  iunmap <buffer> >R
  iunmap <buffer> >r
  iunmap <buffer> >S
  iunmap <buffer> >s
  iunmap <buffer> >U
  iunmap <buffer> >u
  iunmap <buffer> >V
  iunmap <buffer> >v
  iunmap <buffer> >Z
  iunmap <buffer> >z
endfunction " }}}
inoremap <silent> <F3> <Esc>:call DeadKeysToggle()<CR>a
nnoremap <silent> <F3> :call DeadKeysToggle()<CR>

" Placeholders for quick jumping
function! PlaceholdersToggle() " {{{
  if !exists("b:PlaceholdersEnabled") || !b:PlaceholdersEnabled
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

" Toggle quickfix window
function! QuickfixToggle() " {{{
  " Close all quickfix windows, if presented
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  " Otherwise, open it
  copen
endfunction " }}}
nnoremap <silent> <Leader>c :call QuickfixToggle()<CR>

" Soft-wrap the text for copying into the text processors
command! -range=% SoftWrap
      \ <line2>put _ |
      \ <line1>,<line2>g/.\+/ .;-/^$/ join | normal $x

" Create or switch to the scratch buffer
command! Scratch
      \ e scratch |
      \ setlocal buftype=nofile bufhidden=hide noswapfile

" vim: set fdm=marker:
