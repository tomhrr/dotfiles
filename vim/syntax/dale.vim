" This is the default Vim Scheme syntax file, with some very slight
" modifications, for Dale (github.com/tomhrr/dale).  It needs a lot
" of work before it can move into that repository.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn match	schemeError	![^ \t()\[\]";]*!
syn match	schemeError	")"

syn region schemeQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

syn keyword schemeSyntax lambda and or if cond case define let let* letrec
syn keyword schemeSyntax begin do delay set! else =>
syn keyword schemeSyntax quote quasiquote unquote unquote-splicing
syn keyword schemeSyntax define-syntax let-syntax letrec-syntax syntax-rules
syn keyword schemeSyntax define-record-type fields protocol

syn keyword schemeFunc not boolean? eq? eqv? equal? pair? cons car cdr set-car!
syn keyword schemeFunc set-cdr! caar cadr cdar cddr caaar caadr cadar caddr
syn keyword schemeFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword schemeFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword schemeFunc cddaar cddadr cdddar cddddr null? list? list length
syn keyword schemeFunc append reverse list-ref memq memv member assq assv assoc
syn keyword schemeFunc symbol? symbol->string string->symbol number? complex?
syn keyword schemeFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword schemeFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword schemeFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword schemeFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword schemeFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword schemeFunc real-part imag-part magnitude angle exact->inexact
syn keyword schemeFunc inexact->exact number->string string->number char=?
syn keyword schemeFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword schemeFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword schemeFunc char-numeric? char-whitespace? char-upper-case?
syn keyword schemeFunc char-lower-case?
syn keyword schemeFunc char->integer integer->char char-upcase char-downcase
syn keyword schemeFunc string? make-string string string-length string-ref
syn keyword schemeFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword schemeFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword schemeFunc string-ci>=? substring string-append vector? make-vector
syn keyword schemeFunc vector vector-length vector-ref vector-set! procedure?
syn keyword schemeFunc apply map for-each call-with-current-continuation
syn keyword schemeFunc call-with-input-file call-with-output-file input-port?
syn keyword schemeFunc output-port? current-input-port current-output-port
syn keyword schemeFunc open-input-file open-output-file close-input-port
syn keyword schemeFunc close-output-port eof-object? read read-char peek-char
syn keyword schemeFunc write display newline write-char call/cc
syn keyword schemeFunc list-tail string->list list->string string-copy
syn keyword schemeFunc string-fill! vector->list list->vector vector-fill!
syn keyword schemeFunc force with-input-from-file with-output-to-file
syn keyword schemeFunc char-ready? load transcript-on transcript-off eval
syn keyword schemeFunc dynamic-wind port? values call-with-values
syn keyword schemeFunc scheme-report-environment null-environment
syn keyword schemeFunc interaction-environment
syn keyword schemeFunc make-eq-hashtable make-eqv-hashtable make-hashtable
syn keyword schemeFunc hashtable? hashtable-size hashtable-ref hashtable-set!
syn keyword schemeFunc hashtable-delete! hashtable-contains? hashtable-update!
syn keyword schemeFunc hashtable-copy hashtable-clear! hashtable-keys
syn keyword schemeFunc hashtable-entries hashtable-equivalence-function hashtable-hash-function
syn keyword schemeFunc hashtable-mutable? equal-hash string-hash string-ci-hash symbol-hash 
syn keyword schemeFunc find for-all exists filter partition fold-left fold-right
syn keyword schemeFunc remp remove remv remq memp assp cons*

syn match	schemeDelimiter	!\.[ \t\[\]()";]!me=e-1
syn match	schemeDelimiter	!\.$!

syn match	schemeOther	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	schemeError	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeOther	"\.\.\."
syn match	schemeError	!\.\.\.[^ \t\[\]()";]\+!

syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\]()";],me=e-1
syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$,
syn match	schemeError	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	schemeError	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn region schemeStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region schemeStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

syn region schemeString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+

syn match	schemeOther	![+-][ \t\[\]()";]!me=e-1
syn match	schemeOther	![+-]$!
syn match	schemeNumber	"[-#+.]\=[0-9][-#+/0-9a-f@i.boxesfdl]*"
syn match	schemeError	![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match	schemeBoolean	"#[tf]"
syn match	schemeError	!#[tf][^ \t\[\]()";]\+!

syn match	schemeCharacter	"#\\"
syn match	schemeCharacter	"#\\."
syn match       schemeError	!#\\.[^ \t\[\]()";]\+!
syn match	schemeCharacter	"#\\space"
syn match	schemeError	!#\\space[^ \t\[\]()";]\+!
syn match	schemeCharacter	"#\\newline"
syn match	schemeError	!#\\newline[^ \t\[\]()";]\+!

syn match schemeCharacter "#\\x[0-9a-fA-F]\+"



if exists("b:is_mzscheme") || exists("is_mzscheme")
    syn region	schemeComment start="#|" end="|#"

    syn match schemeOther "#%[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
    syn match schemeOther "|[^|]\+|"

    syn match	schemeCharacter	"#\\\%(return\|tab\)"

    syn keyword schemeExtSyntax module require dynamic-require lib prefix all-except prefix-all-except rename
    syn keyword schemeExtSyntax provide struct all-from all-from-except all-defined all-defined-except
    syn keyword schemeExtSyntax with-handlers when unless instantiate define-struct case-lambda syntax-case
    syn keyword schemeExtSyntax free-identifier=? bound-identifier=? module-identifier=? syntax-object->datum
    syn keyword schemeExtSyntax datum->syntax-object
    syn keyword schemeExtSyntax let-values let*-values letrec-values set!-values fluid-let parameterize begin0
    syn keyword schemeExtSyntax error raise opt-lambda define-values unit unit/sig define-signature 
    syn keyword schemeExtSyntax invoke-unit/sig define-values/invoke-unit/sig compound-unit/sig import export
    syn keyword schemeExtSyntax link syntax quasisyntax unsyntax with-syntax

    syn keyword schemeExtFunc format system-type current-extension-compiler current-extension-linker
    syn keyword schemeExtFunc use-standard-linker use-standard-compiler
    syn keyword schemeExtFunc find-executable-path append-object-suffix append-extension-suffix
    syn keyword schemeExtFunc current-library-collection-paths current-extension-compiler-flags make-parameter
    syn keyword schemeExtFunc current-directory build-path normalize-path current-extension-linker-flags
    syn keyword schemeExtFunc file-exists? directory-exists? delete-directory/files delete-directory delete-file
    syn keyword schemeExtFunc system compile-file system-library-subpath getenv putenv current-standard-link-libraries
    syn keyword schemeExtFunc remove* file-size find-files fold-files directory-list shell-execute split-path
    syn keyword schemeExtFunc current-error-port process/ports process printf fprintf open-input-string open-output-string
    syn keyword schemeExtFunc get-output-string
    syn keyword schemeExtFunc exn exn:application:arity exn:application:continuation exn:application:fprintf:mismatch
    syn keyword schemeExtFunc exn:application:mismatch exn:application:type exn:application:mismatch exn:break exn:i/o:filesystem exn:i/o:port
    syn keyword schemeExtFunc exn:i/o:port:closed exn:i/o:tcp exn:i/o:udp exn:misc exn:misc:application exn:misc:unsupported exn:module exn:read
    syn keyword schemeExtFunc exn:read:non-char exn:special-comment exn:syntax exn:thread exn:user exn:variable exn:application:mismatch
    syn keyword schemeExtFunc exn? exn:application:arity? exn:application:continuation? exn:application:fprintf:mismatch? exn:application:mismatch?
    syn keyword schemeExtFunc exn:application:type? exn:application:mismatch? exn:break? exn:i/o:filesystem? exn:i/o:port? exn:i/o:port:closed?
    syn keyword schemeExtFunc exn:i/o:tcp? exn:i/o:udp? exn:misc? exn:misc:application? exn:misc:unsupported? exn:module? exn:read? exn:read:non-char?
    syn keyword schemeExtFunc exn:special-comment? exn:syntax? exn:thread? exn:user? exn:variable? exn:application:mismatch?
    syn keyword schemeExtFunc command-line current-command-line-arguments once-any help-labels multi once-each 

    syn region schemeUnquote matchgroup=Delimiter start="#," end=![ \t\[\]()";]!me=e-1 contains=ALL
    syn region schemeUnquote matchgroup=Delimiter start="#,@" end=![ \t\[\]()";]!me=e-1 contains=ALL
    syn region schemeUnquote matchgroup=Delimiter start="#,(" end=")" contains=ALL
    syn region schemeUnquote matchgroup=Delimiter start="#,@(" end=")" contains=ALL
    syn region schemeUnquote matchgroup=Delimiter start="#,\[" end="\]" contains=ALL
    syn region schemeUnquote matchgroup=Delimiter start="#,@\[" end="\]" contains=ALL
    syn region schemeQuoted matchgroup=Delimiter start="#['`]" end=![ \t()\[\]";]!me=e-1 contains=ALL
    syn region schemeQuoted matchgroup=Delimiter start="#['`](" matchgroup=Delimiter end=")" contains=ALL
endif


if exists("b:is_chicken") || exists("is_chicken")
    syntax region schemeMultilineComment start=/#|/ end=/|#/ contains=schemeMultilineComment

    syn match schemeOther "##[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
    syn match schemeExtSyntax "#:[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

    syn keyword schemeExtSyntax unit uses declare hide foreign-declare foreign-parse foreign-parse/spec
    syn keyword schemeExtSyntax foreign-lambda foreign-lambda* define-external define-macro load-library
    syn keyword schemeExtSyntax let-values let*-values letrec-values ->string require-extension
    syn keyword schemeExtSyntax let-optionals let-optionals* define-foreign-variable define-record
    syn keyword schemeExtSyntax pointer tag-pointer tagged-pointer? define-foreign-type
    syn keyword schemeExtSyntax require require-for-syntax cond-expand and-let* receive argc+argv
    syn keyword schemeExtSyntax fixnum? fx= fx> fx< fx>= fx<= fxmin fxmax
    syn keyword schemeExtFunc ##core#inline ##sys#error ##sys#update-errno

    syn region schemeString start=+#<<\s*\z(.*\)+ end=+^\z1$+
 
    if filereadable(expand("<sfile>:p:h")."/cpp.vim")
	unlet! b:current_syntax
	syn include @ChickenC <sfile>:p:h/cpp.vim
	syn region ChickenC matchgroup=schemeOther start=+(\@<=foreign-declare "+ end=+")\@=+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+foreign-declare\s*#<<\z(.*\)$+hs=s+15 end=+^\z1$+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeOther start=+(\@<=foreign-parse "+ end=+")\@=+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+foreign-parse\s*#<<\z(.*\)$+hs=s+13 end=+^\z1$+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeOther start=+(\@<=foreign-parse/spec "+ end=+")\@=+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+foreign-parse/spec\s*#<<\z(.*\)$+hs=s+18 end=+^\z1$+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+#>+ end=+<#+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+#>?+ end=+<#+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+#>!+ end=+<#+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+#>\$+ end=+<#+ contains=@ChickenC
	syn region ChickenC matchgroup=schemeComment start=+#>%+ end=+<#+ contains=@ChickenC
    endif

    syn match schemeExtSyntax "#![-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
    syn region schemeString start=+#<#\s*\z(.*\)+ end=+^\z1$+ 
endif

syn sync match matchPlace grouphere NONE "^[^ \t]"

if version >= 508 || !exists("did_scheme_syntax_inits")
  if version < 508
    let did_scheme_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink schemeSyntax		Statement
  HiLink schemeFunc		Function

  HiLink schemeString		String
  HiLink schemeCharacter	Character
  HiLink schemeNumber		Number
  HiLink schemeBoolean		Boolean

  HiLink schemeDelimiter	Delimiter
  HiLink schemeConstant		Constant

  HiLink schemeComment		Comment
  HiLink schemeMultilineComment	Comment
  HiLink schemeError		Error

  HiLink schemeExtSyntax	Type
  HiLink schemeExtFunc		PreProc
  delcommand HiLink
endif

let b:current_syntax = "dale"

syn match   schemeCharacter "#\\NULL"
syn keyword schemeFunc free' malloc'
syn match	schemeComment	";.*$"
syn region	schemeComment start="#|" end="|#"
