" Vim syntax file
" Language: Arcanum Messages
" Maintainer: Viqsi

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "arcanummes"
endif


" These are a lot simpler than .dlg files. Just:
" {LineNumber}{ArbitraryText}


syntax match everythingElse "[^{}]*"
syntax match emptyMsgLine "^[^{}]*{[0-9]\+}\s*{\s*}[^{}]*$"
syntax match msgLine "^[^{}]*{[0-9]\+}\s*{\_[^{}]*}[^{}]*$" contains=msgLineNumber,msgText

syntax match msgLineNumber "^[^{}]*{\zs[0-9]\+\ze}" contained
syntax match msgText "{\zs\_[^{}]*\ze}[^{}]*$" contained

highlight default link msgLineNumber Underlined
highlight default link msgText Constant
highlight default link emptyMsgLine Comment
highlight default link everythingElse Comment

let b:current_syntax = "arcanummes"
if main_syntax == 'arcanummes'
  unlet main_syntax
endif
