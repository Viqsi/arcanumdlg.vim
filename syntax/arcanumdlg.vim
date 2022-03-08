" Vim syntax file
" Language: Arcanum Messages, dialog variant
" Maintainer: Viqsi

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "arcanumdlg"
endif


" NPC response:
" {Number}{TextM}{TextF}{}{EmptyOrVoiceActedNumber}{UsuallyEmpty}{Results}
" 
" PC response:
" {Number}{Text}{0/1 gender}{min/max IQ}{tests for availability}{goto}{results}

" The whole enchilada
syntax match emptyMsgLine "^[^{}]*{[0-9]\+}\s*{\s*}\s*{\s*}\s*{\s*}\s*{\s*}\s*{\s*}\s*{\s*}[^{}]*$"
syntax match everythingElse "[^{}]*"
syntax match npcMsgLine "^[^{}]*{[0-9]\+}\s*{[^{}]*}\s*{[^{}]*}\s*{\s*}\s*{[0-9]*}\s*{[^{}]*}\s*{[^{}]*}[^{}]*$" contains=msgLineNumber,npcTextMale,npcTextFemale,voiceActNumber,generatedTextSometimes,responseResults
syntax match playerMsgLine "^[^{}]*{[0-9]\+}\s*{[^{}]*}\s*{\(0\|1\|\)}\s*{[0-9-]\+}\s*{[^{}]*}\s*{[0-9-]*}\s*{[^{}]*}[^{}]*$" contains=msgLineNumber,playerText,playerGender,minMaxIQ,availabilityTests,gotoResponse,responseResults

" Common fields
syntax match msgLineNumber "^[^{}]*{\zs[0-9]\+\ze}" contained
syntax match responseResults "{\zs[^{}]*\ze}[^{}]*$" contained " contains=FIXME (can contain rules)

" NPC-only fields
syntax match npcTextMale "{\zs[^{}]*\ze}\s*{[^{}]*}\s*{\s*}\s*{[0-9]*}\s*{[^{}]*}\s*{[^{}]*}[^{}]*$" contained
syntax match npcTextFemale "{\zs[^{}]*\ze}\s*{\s*}\s*{[0-9]*}\s*{[^{}]*}\s*{[^{}]*}[^{}]*$" contained
syntax match voiceActNumber "{\zs[0-9]*\ze}\s*{[^{}]*}\s*{[^{}]*}[^{}]*$" contained
syntax match generatedTextSometimes "{\zs[^{}]*\ze}\s*{[^{}]*}[^{}]*$" contained

" Player-only fields
syntax match playerText "{\zs[^{}]*\ze}\s*{\(0\|1\|\)}\s*{[0-9-]*}\s*{[^{}]*}\s*{[0-9-]*}\s*{[^{}]*}[^{}]*$" contained
syntax match playerGender "{\zs\(0\|1\|\)\ze}\s*{[0-9-]*}\s*{[^{}]*}\s*{[0-9-]\+}\s*{[^{}]*}[^{}]*$" contained
syntax match minMaxIQ "{\zs[0-9-]\+\ze}\s*{[^{}]*}\s*{[0-9-]*}\s*{[^{}]*}[^{}]*$" contained
syntax match availabilityTests "{\zs[^{}]*\ze}\s*{[0-9-]*}\s*{[^{}]*}[^{}]*$" contained " contains=FIXME
syntax match gotoResponse "{\zs[0-9-]*\ze}\s*{[^{}]*}[^{}]*$" contained

" Places to go!
highlight default link msgLineNumber Underlined
highlight default link gotoResponse Underlined

" Things to say!
highlight default link npcTextMale Statement
highlight default link npcTextFemale PreProc
highlight default link playerText Type

" Stuff to verify...?
highlight default link voiceActNumber Constant
highlight default link playerGender PreProc
highlight default link minMaxIQ Special
"highlight default link availabilityTests Normal
highlight default link availabilityTests Identifier
highlight default link generatedTextSometimes PreProc

" Stuff to do!
"highlight default link responseResults Normal
highlight default link responseResults Special

" Nonsense we don't care about!
highlight default link emptyMsgLine Comment
highlight default link everythingElse Comment

let b:current_syntax = "arcanumdlg"
if main_syntax == 'arcanumdlg'
  unlet main_syntax
endif
