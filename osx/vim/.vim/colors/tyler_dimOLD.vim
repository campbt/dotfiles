" ir_black color scheme
" More at: http://blog.infinitered.com/entries/show/8


" ********************************************************************************
" Standard colors used in all ir_black themes:
" Note, x:x:x are RGB values
"
"  normal: #f6f3e8
" 
"  string: #A8FF60  168:255:96                   
"    string inner (punc, code, etc): #00A0A0  0:160:160
"  number: #FF73FD  255:115:253                 
"  comments: #7C7C7C  124:124:124
"  keywords: #96CBFE  150:203:254             
"  operators: white
"  class: #FFFFB6  255:255:182
"  method declaration name: #FFD2A7  255:210:167
"  regular expression: #E9C062  233:192:98
"    regexp alternate: #FF8000  255:128:0
"    regexp alternate 2: #B18A3D  177:138:61
"  variable: #C6C5FE  198:197:254
"  
" Misc colors:
"  red color (used for whatever): #FF6C60   255:108:96 
"     light red: #FFB6B0   255:182:176
"
"  brown: #E18964  good for special
"
"  lightpurpleish: #FFCCFF
" 
" Interface colors:
"  background color: black
"  cursor (where underscore is used): #FFA560  255:165:96
"  cursor (where block is used): white
"  visual selection: #1D1E2C  
"  current line: #151515  21:21:21
"  search selection: #07281C  7:40:28
"  line number: #3D3D3D  61:61:61


" ********************************************************************************
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #4E4E4E     #7C7C7C
" Red       #FF6C60     #FFB6B0
" Green     #A8FF60     #CEFFAB
" Yellow    #FFFFB6     #FFFFCB
" Blue      #96CBFE     #FFFFCB
" Magenta   #FF73FD     #FF9CFE
" Cyan      #C6C5FE     #DFDFFE
" White     #EEEEEE     #FFFFFF


" ********************************************************************************
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "tyler_dim"


"hi Example         guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" General colors
hi Normal           guifg=#e6e1de     guibg=#0c0c0c       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#070707     guibg=NONE       gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Cursor           guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr           guifg=#797775     guibg=black       gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi VertSplit        guifg=#353434     guibg=#353434     gui=NONE      ctermfg=darkgray    ctermbg=darkgray    cterm=NONE
hi StatusLine       guifg=#e6e1de     guibg=#353434     gui=italic    ctermfg=white       ctermbg=darkgray    cterm=NONE
hi StatusLineNC     guifg=#e6e1de     guibg=#353434     gui=NONE      ctermfg=blue        ctermbg=darkgray    cterm=NONE  

hi Folded           guifg=#a0a8b0     guibg=#202020    gui=bold      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE        ctermbg=darkgray    cterm=NONE

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu         guifg=green       guibg=yellow      gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
"hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#C6C5FE     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi CursorColumn   guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen     guifg=#68caf3     guibg=#857b6f     gui=BOLD      ctermfg=white       ctermbg=darkgray    cterm=NONE
  hi Pmenu          guifg=#a868e8     guibg=#202020     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi PmenuSel       guifg=#a0a8b0     guibg=#50596f     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi Search         guifg=NONE        guibg=#2b3d5c     gui=NONE ctermfg=NONE        ctermbg=NONE        cterm=underline
  hi IncSearch  guifg=NONE guibg=#46175C gui=NONE
endif

" Syntax highlighting
hi Comment          guifg=#868a85     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi String           guifg=#68caf3     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           guifg=#6cd30e     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          guifg=#69a1ff     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          guifg=#69a1ff     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end

hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         guifg=#7ae1ab     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       guifg=#C39FF2     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         guifg=#74da76     guibg=NONE        gui=NONE      ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Type             guifg=#a868e8     guibg=NONE        gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement        guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

hi Special          guifg=#E18964    guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#00A0A0     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         guifg=white       guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


" Special for Ruby
hi rubyRegexp                  guifg=#68caf3     guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter         guifg=#68caf3     guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                  guifg=white        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter  guifg=#00A0A0      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyControl                 guifg=#6699CC      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE  "and break, etc
"hi rubyGlobalVariable          guifg=#d181ff     guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
hi rubyStringDelimiter         guifg=#68caf3      guibg=NONE      gui=NONE      ctermfg=lightgreen     ctermbg=NONE      cterm=NONE
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

hi link rubyClass             Keyword 
hi link rubyModule            Keyword 
hi link rubyKeyword           Keyword 
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type  


" Special for Java
" hi link javaClassDecl    Type
hi link javaScopeDecl         Identifier 
hi link javaCommentTitle      javaDocSeeTag 
hi link javaDocTags           javaDocSeeTag 
hi link javaDocParam          javaDocSeeTag 
hi link javaDocSeeTagParam    javaDocSeeTag 

hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi javaDocSeeTag              guifg=#CCCCCC     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
"hi javaClassDecl              guifg=#CCFFCC     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE


" Special for XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 


" Special for HTML
hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 


" Special for Javascript
hi link javaScriptNumber      Number 


" Special for Python
"hi  link pythonEscape         Keyword      


" Special for CSharp
hi  link csXmlTag             Keyword      


" Special for PHP
"

" Special for EasyMotionTarget
hi EasyMotionTarget    guifg=#FF6C60     guibg=black        gui=BOLD      ctermfg=yellow      ctermbg=NONE        cterm=NONE
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade Comment

"Special for Scala'
hi link scalaClassName Identifier
hi link scalaClassIdentifierizer Identifier
hi link scalaConstructor Identifier

"Special for Code Folding
hi FoldColumn        guifg=#797775     guibg=black     gui=NONE      ctermfg=darkgray    ctermbg=darkgray    cterm=NONE

""" NERDTree {{{3
hi Directory      ctermfg=110  guifg=#87afdf
hi treeCWD        ctermfg=180  guifg=#dfaf87
hi treeClosable   ctermfg=174  guifg=#df8787
hi treeOpenable   ctermfg=150  guifg=#afdf87
hi treePart       ctermfg=244  guifg=#808080
hi treeDirSlash   ctermfg=244  guifg=#808080
hi treeLink       ctermfg=182  guifg=#dfafdf