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

" cterm colors to gui
" (color)        (dark)        (light)
" Black  :    0 = #2f3133    8 = #929292 = 2f3133   = 929292
" Red    :    1 = #ff8273    9 = #ffc4be = ff8273   = ffc4be
" Green  :    2 = #a8d4a9   10 = #bcea92 = a8d4a9   = bcea92
" Yellow :    3 = #cfc99b   11 = #e1d797 = cfc99b   = e1d797
" Blue   :    4 = #a2d0f9   12 = #90e3f1 = a2d0f9   = 90e3f1
" Purple :    5 = #b1b0e2   13 = #d6d6f3 = b1b0e2   = d6d6f3
" Cyan   :    6 = #d1d1fe   14 = #e5e6fe = d1d1fe   = e5e6fe
" White  :    7 = #f9f9f5   15 = #ffffff = f9f9f5   = ffffff

hi Cursor          cterm=none   ctermfg=none   ctermbg=none   gui=none guifg=#F1F1F1   guibg=#ffa460
hi iCursor         cterm=none   ctermfg=none   ctermbg=none   gui=none guifg=#F1F1F1   guibg=#ffa460

hi Normal          cterm=none   ctermfg=7      ctermbg=none   gui=none guifg=#F8F8F2   guibg=#1D1F21
hi Comment         cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#7C7C7C
hi CursorLine      cterm=none   ctermfg=none   ctermbg=0      gui=none                 guibg=#293739
hi CursorLineNr    cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#B6B7EB
hi CursorColumn    cterm=none   ctermfg=none   ctermbg=none   gui=none                 guibg=#293739
hi ColorColumn     cterm=none   ctermfg=none   ctermbg=none   gui=none                 guibg=#232526
hi LineNr          cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#465457   guibg=#232526
hi NonText         cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#465457
hi SpecialKey      cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#465457

hi Constant        cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#a8d4a9
hi Character       cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#bcea92
hi String          cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#bcea92
hi Boolean         cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#a8d4a9
hi Number          cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#a8d4a9
hi Float           cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#a8d4a9

" Identifier is a variable name. Function is a function name
hi Identifier      cterm=none   ctermfg=14      ctermbg=none  gui=none guifg=#e5e6fe
hi Function        cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797

hi Statement       cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Conditional     cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Repeat          cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Label           cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Operator        cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Keyword         cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Exception       cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797

hi PreCondit       cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797
hi PreProc         cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797
hi Include         cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797
hi Define          cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797
hi Macro           cterm=none   ctermfg=3      ctermbg=none   gui=none guifg=#cfc99b

hi StorageClass    cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#b1b0e2
hi Structure       cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#b1b0e2
hi Typedef         cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi Type            cterm=none   ctermfg=6      ctermbg=none   gui=none guifg=#d1d1fe

hi Special         cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#90e3f1   guibg=bg
hi Tag             cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#a2d0f9
hi SpecialComment  cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#7C7C7C
hi Delimiter       cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#8F8F8F
hi Debug           cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#BCA3A3

hi Error           cterm=underline   ctermfg=1      ctermbg=none   gui=underline guifg=#ff8273
hi ErrorMsg        cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7   guibg=#232526
hi Todo            cterm=none   ctermfg=15     ctermbg=none   gui=none guifg=#FFFFFF   guibg=bg


hi DiffAdd         cterm=none   ctermfg=2      ctermbg=none   gui=none guifg=#a8d4a9   guibg=bg
hi DiffChange      cterm=none   ctermfg=3      ctermbg=none   gui=none guifg=#cfc99b   guibg=bg
hi DiffDelete      cterm=none   ctermfg=1      ctermbg=none   gui=none guifg=#ff8273   guibg=bg
hi DiffText        cterm=underline   ctermfg=11     ctermbg=0      gui=none guifg=#e1d797  guibg=#4C4745

hi Directory       cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#929292
hi FoldColumn      cterm=none   ctermfg=8      ctermbg=0      gui=none guifg=#929292   guibg=#2f3133
hi Folded          cterm=none   ctermfg=8      ctermbg=0      gui=none guifg=#929292   guibg=#2f3133
hi Ignore          cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080   guibg=bg
hi IncSearch       cterm=none   ctermfg=0      ctermbg=2      gui=none guifg=#2f3133   guibg=#a8d4a9


hi MatchParen      cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#929292   guibg=#444444
hi ModeMsg         cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#bcea92
hi MoreMsg         cterm=none   ctermfg=10     ctermbg=none   gui=none guifg=#bcea92

" complete menu
hi Pmenu           cterm=none   ctermfg=7      ctermbg=0      gui=none guifg=#F8F8F2   guibg=#2f3133
hi PmenuSel        cterm=none   ctermfg=4      ctermbg=8      gui=none guifg=#a2d0f9   guibg=#455354
hi PmenuSbar       cterm=none   ctermfg=7      ctermbg=none   gui=none                 guibg=#080808
hi PmenuThumb      cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF

hi Question        cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
hi Search          cterm=none   ctermfg=0      ctermbg=2      gui=none guifg=#000000   guibg=#B4EC85
" marks
hi SignColumn      cterm=none   ctermfg=11     ctermbg=none   gui=none guifg=#e1d797   guibg=#232526
hi SpecialChar     cterm=none   ctermfg=4      ctermbg=none   gui=none guifg=#92C5F7
hi SpecialKey      cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#66D9EF
if has("spell")
    hi SpellBad    cterm=undercurl ctermfg=9      ctermbg=none   guisp=#ff8273 gui=undercurl
    hi SpellCap    cterm=undercurl ctermfg=13     ctermbg=none   guisp=#d6d6f3 gui=undercurl
    hi SpellLocal  cterm=undercurl ctermfg=12     ctermbg=none   guisp=#90e3f1 gui=undercurl
    hi SpellRare   cterm=undercurl ctermfg=15     ctermbg=none   guisp=#FFFFFF gui=undercurl
endif
"hi StatusLine      cterm=none   ctermfg=none   ctermbg=none   gui=none guifg=#455354   guibg=fg
"hi StatusLineNC    cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080   guibg=#080808
hi Title           cterm=none   ctermfg=5      ctermbg=none   gui=none guifg=#B6B7EB

hi Underlined      cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080

hi VertSplit       cterm=none   ctermfg=8      ctermbg=none   gui=none guifg=#808080   guibg=#080808
hi VisualNOS       cterm=none   ctermfg=none   ctermbg=8      gui=none                 guibg=#403D3D
hi Visual          cterm=none   ctermfg=none   ctermbg=8      gui=none                 guibg=#403D3D
hi WarningMsg      cterm=none   ctermfg=15     ctermbg=none   gui=none guifg=#FFFFFF   guibg=#333333
hi WildMenu        cterm=none   ctermfg=12     ctermbg=none   gui=none guifg=#90e3f1   guibg=#000000

hi TabLineSel      cterm=underline   ctermfg=12     ctermbg=0      gui=none guifg=#808080   guibg=#1D1F21
hi TabLineFill     cterm=underline   ctermfg=8      ctermbg=0      gui=none guifg=#1D1F21   guibg=#1D1F21
hi TabLine         cterm=underline   ctermfg=8      ctermbg=0      gui=none guifg=#808080   guibg=#1D1F21


" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
