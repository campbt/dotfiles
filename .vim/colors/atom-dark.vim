" Vim color file
"
" Author: Federico Ramirez
" https://github.com/gosukiwi/vim-atom-dark
"
" Note: Based on the Monokai theme variation by Tomas Restrepo
" https://github.com/tomasr/molokai

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="atom-dark"

hi Boolean         cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#99CC99
hi Character       cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#A8FF60
hi Number          cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#99CC99
hi String          cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#A8FF60
hi Conditional     cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
hi Constant        cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#99CC99
hi Cursor          cterm=none   ctermfg=none   ctermbg=none   gui=none guifg=#F1F1F1   guibg=#ffa460
hi iCursor         cterm=none   ctermfg=none   ctermbg=none   gui=none guifg=#F1F1F1   guibg=#ffa460
hi Debug           cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#BCA3A3
hi Define          cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
hi Delimiter       cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#8F8F8F
hi DiffAdd         cterm=none   ctermfg=2      ctermbg=none   gui=none                 guibg=#13354A
hi DiffChange      cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#89807D   guibg=#4C4745
hi DiffDelete      cterm=none   ctermfg=1      ctermbg=none   gui=none guifg=#960050   guibg=#1E0010
hi DiffText        cterm=none   ctermfg=7      ctermbg=0      gui=none                 guibg=#4C4745

hi Directory       cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#AAAAAA
hi Error           cterm=underline   ctermfg=1      ctermbg=none   gui=underline guifg=#ff6b60
hi ErrorMsg        cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7   guibg=#232526
hi Exception       cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#DAD085
hi Float           cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#99CC99
hi FoldColumn      cterm=none   ctermfg=8      ctermbg=0      gui=none guifg=#465457   guibg=#000000
hi Folded          cterm=none   ctermfg=8      ctermbg=0      gui=none guifg=#465457   guibg=#000000
hi Function        cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#DAD085
hi Identifier      cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#B6B7EB
hi Ignore          cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080   guibg=bg
hi IncSearch       cterm=none   ctermfg=0      ctermbg=2      gui=none guifg=#C4BE89   guibg=#000000

hi Keyword         cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
hi Label           cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#A8FF60
hi Macro           cterm=none   ctermfg=3      ctermbg=none   gui=none guifg=#C4BE89
hi SpecialKey      cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF

hi MatchParen      cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#B7B9B8   guibg=#444444
hi ModeMsg         cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#A8FF60
hi MoreMsg         cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#A8FF60
hi Operator        cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7

" complete menu
hi Pmenu           cterm=none   ctermfg=7      ctermbg=0      gui=none guifg=#F8F8F2   guibg=#000000
hi PmenuSel        cterm=none   ctermfg=4      ctermbg=8      gui=none guifg=#92C5F7   guibg=#232526
hi PmenuSbar       cterm=none   ctermfg=7      ctermbg=none   gui=none                 guibg=#080808
hi PmenuThumb      cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF

hi PreCondit       cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#DAD085
hi PreProc         cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#DAD085
hi Question        cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
hi Repeat          cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
hi Search          cterm=none   ctermfg=0      ctermbg=2      gui=none guifg=#000000   guibg=#B4EC85
" marks
hi SignColumn      cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#DAD085   guibg=#232526
hi SpecialChar     cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
hi SpecialComment  cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#7C7C7C
hi Special         cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF   guibg=bg
if has("spell")
    hi SpellBad    cterm=undercurl ctermfg=9      ctermbg=none   guisp=#FF0000 gui=undercurl
    hi SpellCap    cterm=undercurl ctermfg=13     ctermbg=none   guisp=#7070F0 gui=undercurl
    hi SpellLocal  cterm=undercurl ctermfg=12     ctermbg=none   guisp=#70F0F0 gui=undercurl
    hi SpellRare   cterm=undercurl ctermfg=15     ctermbg=none   guisp=#FFFFFF gui=undercurl
endif
hi Statement       cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
"hi StatusLine      cterm=none   ctermfg=none   ctermbg=none   gui=none guifg=#455354   guibg=fg
"hi StatusLineNC    cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080   guibg=#080808
hi StorageClass    cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#B6B7EB
hi Structure       cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
hi Tag             cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
hi Title           cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#B6B7EB
hi Todo            cterm=none   ctermfg=15     ctermbg=none   gui=none guifg=#FFFFFF   guibg=bg

hi Typedef         cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
hi Type            cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
hi Underlined      cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080

hi VertSplit       cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080   guibg=#080808
hi VisualNOS       cterm=none   ctermfg=none   ctermbg=8      gui=none                 guibg=#403D3D
hi Visual          cterm=none   ctermfg=none   ctermbg=8      gui=none                 guibg=#403D3D
hi WarningMsg      cterm=none   ctermfg=15     ctermbg=none   gui=none guifg=#FFFFFF   guibg=#333333
hi WildMenu        cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF   guibg=#000000

hi TabLineSel      cterm=none   ctermfg=0     ctermbg=2      gui=none guifg=#808080   guibg=#1D1F21
hi TabLineFill     cterm=none   ctermfg=8      ctermbg=0      gui=none guifg=#1D1F21   guibg=#1D1F21
hi TabLine         cterm=none   ctermfg=8      ctermbg=0      gui=none guifg=#808080   guibg=#1D1F21

hi Normal          cterm=none   ctermfg=7      ctermbg=none   gui=none guifg=#F8F8F2   guibg=#1D1F21
hi Comment         cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#7C7C7C
hi CursorLine      cterm=none   ctermfg=none   ctermbg=0      gui=none                 guibg=#293739
hi CursorLineNr    cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#B6B7EB
hi CursorColumn    cterm=none   ctermfg=none   ctermbg=none   gui=none                 guibg=#293739
hi ColorColumn     cterm=none   ctermfg=none   ctermbg=none   gui=none                 guibg=#232526
hi LineNr          cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#465457   guibg=#232526
hi NonText         cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#465457
hi SpecialKey      cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#465457

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
