" Improves xcodebuild output to point to the correct file locations when
" selected in the quickfix window
" xcvim should be in the compilters/ folder of the .vim folder
compiler xcvim

nmap <Leader>r :Make<CR>
set errorformat=%f:%l:%c:%.%#\ error:\ %m,%f:%l:%c:%.%#\ warning:\ %m,%-G%.%#
