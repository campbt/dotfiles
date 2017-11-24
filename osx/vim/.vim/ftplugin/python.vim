set omnifunc=pythoncomplete#Complete
set foldmethod=indent

" Custom Commands
"<Leader>r - Run python script through Clam
nmap <Leader>r :Clam python %<CR>
"<Leader>R - Run python script through terminal
nmap <Leader>R :!python %<CR>
