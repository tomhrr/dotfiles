hi clear Normal
set bg&

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"

hi Comment 	ctermfg=darkblue term=NONE  
hi String 	ctermfg=darkred term=NONE
hi Identifier 	ctermfg=darkmagenta term=NONE
hi Statement 	ctermfg=black term=NONE
hi xmlAttrib    ctermfg=darkblue term=NONE
