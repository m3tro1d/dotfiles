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
  echo "Trailings cleared."
endfunction " }}}
command! CleanTrailings call CleanTrailings()

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
