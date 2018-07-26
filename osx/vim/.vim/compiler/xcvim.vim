" Vim compiler file
" Compiler:     xcvim (xcodebuild, xctool, xcbuild, xcpretty, etc)
" Maintainer:   Nate Chandler (nathaniel.chandler@gmail.com)
" Last Change:  2017 Aug 20

if exists("current_compiler")
    finish
endif
let current_compiler = "xcvim"

if exists(":CompilerSet") != 2        " older Vim always used :setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

" xcodebuild reports to stderr in part.
" setlocal shellpipe=2>

" Define the patterns that will be recognized by QuickFix when parsing the
" output of xcodebuild command (which will be invoked via make).
" http://vimdoc.sourceforge.net/htmldoc/quickfix.html#errorformat
CompilerSet errorformat =%E❌\ %f:%l:%c:\ %m
CompilerSet errorformat+=%W⚠️\ %f:%l:%c:\ %m
" CompilerSet errorformat+=%E\#\ failed\ -\ %m
" CompilerSet errorformat+=%C\#\ \ \ %f:%l:%.%#

" CompilerSet errorformat+=%+G⚠️\ \[BCNOTE\]%.%#

CompilerSet errorformat+=%-G%.%#                      " All lines not matching any of the above patterns are ignored

CompilerSet makeprg=make

