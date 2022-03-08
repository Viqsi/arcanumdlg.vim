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
