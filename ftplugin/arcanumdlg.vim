" Arcanum only understands Windows codepage encodings, and attempting to
" switch after loading introduces garbage.
if !exists("b:need_encoding_reload")
  let b:need_encoding_reload = 1
  e ++enc=cp1252
endif

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal expandtab shiftwidth=4 tabstop=4

" Call this to pop up a pair of scratch buffers that'll compare male and
" female lines.
" It doesn't update as you go (I'm not that skilled), so if you edit anything
" you have to do so in the original buffer, and then close the scratch buffers
" and re-call this function.
function ArcanumMaleFemaleLineCheck()
  %y a
  sp female
  setlocal buftype=nofile
  put a
  %v/.*{}{[0-9]*}{}{[^}]*}$/s/.*//
  diffthis
  set wrap
  %s/\({[0-9]*}\)\({[^}]*}\)\({[^}]*}\).*/\1\3/g
  vsp male
  setlocal buftype=nofile
  put a
  %v/.*{}{[0-9]*}{}{[^}]*}$/s/.*//
  diffthis
  set wrap
  %s/\({[0-9]*}\)\({[^}]*}\)\({[^}]*}\).*/\1\2/g
endfunction

