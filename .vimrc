" 
" Tyler's Vim Config File {{
"   v2.06 - 2012-03-08 
"   vim: set foldmarker={{,}} foldlevel=2 foldmethod=marker :
" }}
" 

" Cheat Sheet {{
  "This is a brief list of custom commands and what they do
  "Plus other miscellaneous information

  " (Assuming \ = Leader)
  " <C-Space>    : Esc (in insert mode)
  " \n           : Nerdtree Open Directory
  " \F2          : Colorize Hex VAlues in Code
  " \e           : :e {directory of current file}/ (open in current buffer)
  " \te          : same as \e except opens in new tab
  " <C-P>        : Insert Directory of current file into command
  " Align        : Aligns along something: ex: : 5 , 10 Align => (aligns on => for lines 5 through 10
  " \o           : Brings up Searching for files in current directory
  " \]           : ZoomWin, when in split windows, zooms into the current one, \\ zooms out again
  " \cd          : Changes directory to the current files
  " \mw          : Mark Window for Swapping
  " \ms          : Swap Current Window with one marked
  " \p           : Open up Yank Ring
  " \\w          : EasyMove by word forward (b for backward)
  " \\_          : EasyMove - j,k lines, w/b, words, e end of words, /,? for search
  "   \j, \k, \w : are same as \\j \\k \\w
   "<D-/> or \/  : Comment out a line
  " \c           : NerdComment (add letter after c for option)
  " S-Up         : Move Line Up (Down to move it down)
  " ultisnips    : 
  " Tabularize   : Aligns text based on a regex
  " surround     : (supports more than ()'s, just used as example)
  "   ys(        : add () surround
  "   ds(        : delete ()
  "   cs({       : Change () to {}
  " \b           : open ctags and it goes away when you select something
  " \B           : toggle ctags
  " \m           : <Disabled> ToggleMiniMap (Doesn't work in terminal!)
  " :w!!         : Force save, even on Read Only (will ask you for root permissions)
  " \g*          : Bindings for Fugitive, replace * with c (commit), a (add), s (status),  l (log), d (diff)
  " <C-t>        : Create a tab
  " F7 , F8      : Move tab left and right respectively
  " :SaveSession : Save current tabs (can also supply a name for session)
  " :OpenSession : Displays list (or you can tab complete) of sessions
  " F2           : Toggle Paste mode on/off
  " \gh          : Toggle highlight lines changed since last commit
  " c] c[        : Move to next chunk of changes since last commit
" }}

" ---------

" Bundles List {{
  " Vundle Requirements {{
    " This things are required for Vundle to Run
    set nocompatible     " be iMproved
    filetype off         " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Bundle 'gmarik/vundle'
  " }}

  " Bundle List {{
    "List of Plugins used (Comment out to disable them)

    "NerdTree - Directory Viewer
    Bundle 'scrooloose/nerdtree'

    ""NerdCommenter - Comment lines with <Leader>cc
    Bundle 'scrooloose/nerdcommenter'

    ""ZoomWin - Toggles hiding all but 1 window
    Bundle 'ZoomWin'

    ""Ctrl-P Fuzzy Finding Files
    Bundle 'kien/ctrlp.vim'

    "" SuperTab - Complete using Tab
    "Bundle 'ervandew/supertab'

    "" Smartusline - Color codes status line
    "Bundle 'molok/vim-smartusline'

    "" vim-airline - cool status line
    Bundle 'bling/vim-airline'

    "" Yankring - Great yanking \p to open yankring
    Bundle 'chrismetcalf/vim-yankring'

    "" Pasta - Much better pasting - all passive
    Bundle 'sickill/vim-pasta'

    "" Highlights hex Colors (useful for editing color files
    Bundle 'hexHighlight.vim'

    "" EasyMotion - Fast moving through file
    Bundle 'Lokaltog/vim-easymotion'

    "" upAndDown - Move lines up and down using shift arrow keys
    Bundle 'upAndDown'

    "" UltiSnippits - Best snippit plugin I've seen
    "Errors out for some reason - github's issue so you have to manually installed
    if(has("py3") || has("python"))
			Bundle 'SirVer/ultisnips'
    endif

    "Matching Pairs Autocompletition Support
    "Bundle 'Raimondi/delimitMate'

    " Autoclose - a simpler approach to autocompleting pairs
    "Bundle 'Townk/vim-autoclose'
    "Bundle 'Raimondi/delimitMate'

    " Tabularize - better than Align (no stupid bindings)
    Bundle 'godlygeek/tabular'

    " Surround - surround text
    Bundle 'tpope/vim-surround'

    " Clam - Better terminal command support
    Bundle 'sjl/clam.vim'

    " Fugitive - Git wrapper
    Bundle 'tpope/vim-fugitive'

    "Indexed Search - shows 'at x of N when searching'
    Bundle 'IndexedSearch'

    " Shows changed lines since last git commit
    Bundle 'mhinz/vim-signify'

    " Better JSON Support
    Bundle 'elzr/vim-json'

    " Gotham Colorscheme
    Bundle 'whatyouhide/vim-gotham'

    " Misc install needed for some (vim-session and vim-easytags)
    Bundle 'xolox/vim-misc' 

    " vim-session - use good session manager ( Misc needed for vim-session )
    Bundle 'xolox/vim-session'

    " Easy Tags
    Bundle 'xolox/vim-easytags'

    " You Complete Me - Fuzzy finding auto completion
    Bundle 'Valloric/YouCompleteMe'
    " You Complete Meet Extra Installation Notes {{
    "   Check the github link at:
    "   https://github.com/Valloric/YouCompleteMe
    "
    "   try: cd ~/.vim/bundle/YouCompleteMe
    "    ./install.sh
    "
    "    (If it doesn't work you'll need to install CMake and stuff. Read the readme)
    "
    "   This plugin requires some extra compiled sources to work properly
    " }}

    " TagBar - Shows all the methods, variables and stuff in file
    Bundle 'majutsushi/tagbar'
    " TagBar Extra Installation Notes {{
    " Note - To install this, you need Exuberant CTags
    " Install Homebrew http://mxcl.github.com/homebrew/
    " Run command : brew install ctags-exuberant
    " Go to : http://latestbuild.net/scala-ctags-and-vim-tagbar
    " Add the ctag lines to ~/.ctags file
    " }}

    " Indent Guides - Adds indent lines which look good
    " Maybe Add Sometime later for Python
    "Bundle 'nathanaelkane/vim-indent-guides'

    "Scala Syntax Files 
    "(Copied and slightly modified so not imported in Vundle)
	"Bundle 'derekwyatt/vim-scala' 
	
  " }}
" }}

" ---------

" Vim Settings {{

    " Default color scheme (Custom Created One)
      " NOTE : This colorscheme will support 256 Color terminals for OS X
      " Not sure how it looks in other OS's yet
    "color tyler_dim
    "colorscheme lucius 
    "LuciusDark 
    colorscheme smyck
    "colorscheme gotham

    " Run gvimrc commands First
    if has("gui_macvim")
      :source ~/.vim/gvimrc
    endif

    " Tab Settings {{
    " Tabstops are 4 spaces
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
    " }}

    " Fold Settings {{
    "folding settings
    "zn toggles foldcolumn: (Recap: za=toggle fold, zM=foldAll, zR=unfold all)
    set foldmarker={,}             "Fold based on Brackets
    set foldmethod=marker   "
    set foldnestmax=10      "deepest fold is 10 levels
    set nofoldenable        "dont fold by default
    set foldlevel=1         "this is just what i use
    set foldminlines=3      "Braces that only span 3 lines or less will not be folded
    " }}

    " Searching {{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    " }}

    " Backups {{
    set undodir=~/.vim/tmp/undo//     " undo files
    set backupdir=~/.vim/tmp/backup// " backups
    set directory=~/.vim/tmp/swap//   " swap files
    set backup                        " enable backups
    set noswapfile                    " It's 2012, Vim.
    " }}

    set number
    set ruler
    set nowrap
    set textwidth=160
    syntax on

    " Status Line
    "set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
    set statusline=%f\ %r%{fugitive#statusline()}%m%h%=(%l/%L,\ %c)\ %3p%%\ %w\ %y\ [%{&encoding}:%{&fileformat}]\ \ 

    " Set up the gui cursor to look nice
    set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start

    " load the plugin and indent settings for the detected filetype
    filetype plugin indent on

    " tell VIM to always put a status line in, even if there is only one window
    set laststatus=2

    " Directories for swp files
    "set backupdir=~/.vim/backup
    "set directory=~/.vim/backup

    " Show (partial) command in the status line
    set showcmd

    " When the page starts to scroll, keep the cursor 5 lines from the top and 5
    " lines from the bottom
    set scrolloff=5

    " Tab completion in involding 'wild' {
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc

    " Make the command-line completion better
    set wildmenu

    "Highlight cursor line (of current buffer only)
    autocmd BufEnter * setlocal cursorline
    autocmd BufLeave * setlocal nocursorline

    " Remember last location in file
    if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
    endif

    " Reload when entering buffer or gaining focus
    au FocusGained,BufEnter * :silent! !

    " ================
    " File Type Specific Settings

    " Json
    au FileType json set textwidth=0
" }}

" ----------

" Custom Remappings {{
    " This section does not include mappings of plugins

    " Ctrl-Space to leave insert mode
    noremap <C-Space> <Esc>
    inoremap <C-Space> <Esc>
    " Allows OS X Terminal to use Ctrl-Space
    inoremap <C-@> <Esc>

    " Ctrl-] To push everything else to the next line and then hit Enter
    " Ideal for opening {}
    inoremap <C-]> <CR><Esc>O

    "  To insert an opening and closing space with a line in between
    inoremap {<CR> {<CR>}<Esc>O
    inoremap {<Space> {<Space><Space>}<Left><Left>
    inoremap {<BS> {
    inoremap (<CR> (<CR>)<Esc>O
    inoremap (<Space> (<Space><Space>)<Left><Left>
    inoremap (<BS> (

    " Space in normal mode removes annoying search highlighting
    " Space also gets out of v mode
    nnoremap <Space> :noh<CR>
    vnoremap <Space> <Esc>

    " Easier moving in tabs and windows
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h

    "Shift H and L for moving between tabs
    " The following two lines conflict with moving to top and bottom of the screen
    map <S-H> gT          
    map <S-L> gt

    nmap j gj
    nmap k gk

    "Toggles showing the Fold Column (calls custom method)
    nnoremap zn :call FoldColumnToggle()<CR>

    " Unimpaired configuration
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e
    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv

    " Inserts the path of the currently edited file into a command
    " Command mode: Ctrl+P
    cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

    "indent/unindent (reselects text afterwards)
    vnoremap > >gv
    vnoremap < <gv

    " Change working directory to current file's location
    nmap <silent> <Leader>cd :cd %:p:h<CR>

    " Make horizontal scrolling easier
    nmap <silent> <C-o> 10zl
    nmap <silent> <C-i> 10zh

    "Editing Vimrc File
    nmap <silent> <Leader>ve :e $MYVIMRC<CR>
    nmap <silent> <Leader>vs :so $MYVIMRC<CR>

    " Opens an edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>e
    map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

    " Opens a tab edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>t
    map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

    map <Leader>mw :call MarkWindowSwap()<CR>
    map <Leader>ms :call DoWindowSwap()<CR>

    " Repeat last command on each line in Visual Mode
    vnoremap . :normal .<CR>

    " Don't move on *
    nnoremap * *<c-o>

    " Window resizing
    nnoremap <S-C-Left> 5<c-w><
    nnoremap <S-C-Right> 5<c-w>>
    nnoremap <S-C-Up> 5<c-w>+
    nnoremap <S-C-Down> 5<c-w>-

    " Force saving files that require root permission
    cmap w!! %!sudo tee > /dev/null %

    " Paste and increment first number
    " Use for printing 'println('Test 1')' then 'println('Test 2')' ...etc
    nnoremap <leader>i p<C-A>==yy

    " New tabs
    nnoremap <C-t> :tabnew<CR>

    " Move tab to left (F9) and right (F10)
    nnoremap <F7> :call TabMove(-1)<CR>
    nnoremap <F8> :call TabMove(1)<CR>

    " Paste mode toggle
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
    set showmode

    " Location list quick commands (useful for navigating eclim errors)
    map [l :ll<CR>:lprev<CR>
    map ]l :ll<CR>:lnext<CR>
 " }}

" -------

" Plugin Settings {{
  "Most custom mappings here should involve <Leader> key
  
  " eclim settings {{
      autocmd Filetype java imap <C-w> <C-x><C-u><C-p>
      autocmd Filetype java map <C-n> :JavaSearch -a edit<CR>
      "autocmd Filetype java let g:SuperTabRetainCompletionDuration='completion'
      let g:EclimCompletionMethod = 'omnifunc'

      " Lets eclim play work with YouCompelteMe
      autocmd Filetype * runtime! autoload/eclim/<amatch>/complete.vim
          \ | let s:cfunc = 'eclim#'.expand('<amatch>').'#complete#CodeComplete'
          \ | if exists('*'.s:cfunc) | let &l:omnifunc=s:cfunc | endif
  " }}

  " NERDTree Settings {{
    let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
    map <Leader>n :NERDTreeToggle<CR>
  " }}

   "NERDComment Settings {{
      nnoremap <Leader>/ :call NERDComment(0,"toggle")<CR>
      vnoremap <Leader>/ :call NERDComment(0,"toggle")<CR>gv
      nnoremap <Leader>c<Space> :call NERDComment(0,"toggle")<CR>
      vnoremap <Leader>c<Space> :call NERDComment(0,"toggle")<CR>gv
   "}}

  " delimitMate Settings {{
    "Expands braces when enter is hit
    let delimitMate_expand_cr = 1
    "Pads a space when a space is pressed
    let delimitMate_expand_space = 1

		" It adds some binding to <Esc>OC for some reason so I'm removing that
		silent! iunmap <C-[>OC

    " I don't like it matching quotes (messes up a lot)
    let delimitMate_quotes = ""

    " SuperTab has issues with the CR so I remapped it to shift and ctrl
    " This is only useful for expanding braces
		silent! imap <unique> <buffer> <C-CR> <Plug>delimitMateCR
		silent! imap <unique> <buffer> <S-CR> <Plug>delimitMateCR
  " }}

   "ZoomWin Settings {{
    map <Leader>] :ZoomWin<CR>
  " }}

  " Ctrl-P Settings {{
     "Change mapping to \o (open) 
     let g:ctrlp_map = '<Leader>o'
     let g:ctrlp_max_height = 15
     let g:ctrlp_highlight_match = [1, 'Type']
     let g:ctrlp_switch_buffer = 'et'

		 noremap <Leader>O :CtrlPBuffer<CR>
		 noremap <Leader><Leader>o :CtrlPMRUFiles<CR>

     "Don't allow searching for hidden files/folders
     let g:ctrlp_dotfiles = 0
  " }}
  
  " UltiSnippits Settings {{
    " Also looks in snippits folder in default .vim folder
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippits"]
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
  " }}

  " SmartusLine Settings {{
    "let g:smartusline_string_to_highlight = '%f '
		"let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
		"let g:smartusline_hi_insert  = 'guibg=orange guifg=black  ctermbg=208 ctermfg=black'
		"let g:smartusline_hi_normal  = 'guibg=#95e454 guifg=black ctermbg=113 ctermfg=black'
  " }}

  " Airline Settings {{
      "set statusline=%f\ %r%{fugitive#statusline()}%m%h%=(%l/%L,\ %c)\ %3p%%\ %w\ %y\ [%{&encoding}:%{&fileformat}]\ \ 
      let g:airline_enable_hunks = 0 " Gets errors when this is enabled
      let g:airline_theme = 'bubblegum'
      let g:airline#extensions#whitespace#enabled = 0 " Who cares about whitespace?
      "let g:airline_section_b = '%<%{expand("%:h")}/' " The relative path to the file
      "let g:airline_section_c = '%<%t%m' " The file name (%t), if it has been modified (%m)
      let g:airline_section_x = '%{airline#extensions#tagbar#currenttag()}' " Shows the method the cursor is in
      let g:airline_section_x = '' " Shows the method the cursor is in
      "let g:airline_section_y = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}' " Shows the current branch
      let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}' " Shows the file type
      let g:airline_section_z = '%l/%L : %c' " Shows the line number and column number of cursor

      let g:airline#extensions#ctrlp#color_template = 'visual'

      " Enable this if the terminal is using a patched font
      set encoding=utf-8
      set fillchars+=stl:\ ,stlnc:\
      let g:airline_powerline_fonts = 1
      
      " Modifies the colorscheme a bit
      let g:airline_theme_patch_func = 'AirlineThemePatch'
      function! AirlineThemePatch(palette)
        if g:airline_theme == 'bubblegum'
          for colors in values(a:palette.inactive)
            let colors[2] = 243 " Makes the text a lighter gray on inactive colors
          endfor
        endif
      endfunction
  " }}
 
  " Yankring Settings {{
    nnoremap <silent> <Leader>p :YRShow<CR>
  " }}

  " EasyMotion Settings {{
    "Commonly used ones may be used with only one leader press
    map <Leader>j <Leader><Leader>j
    map <Leader>k <Leader><Leader>k
    map <Leader>w <Leader><Leader>w
  " }}

  " Autoclose Settings {{

  " Global AutoClose Pairs (don't use <>)
    "autocmd FileType *
              "\ let b:AutoClosePairs = AutoClose#DefaultPairsModified("","<")

    " Filetype specific pairs:
    "autocmd FileType ruby 
              "\ let b:AutoClosePairs = AutoClose#DefaultPairsModified("|", "<")
    "autocmd FileType html 
              "\ let b:AutoClosePairs = AutoClose#DefaultPairsModified("% #", "")

    
  
  " }}
  "
  " delimitMate Settings {{
      let delimitMate_smart_quotes = 1
        let b:delimitMate_matchpairs = "(:),[:],{:},<:>,\":\",':'"
  " }}

  " TagBar Settings {{
  
    " TagBar Toggle Hotkey
    map <Leader>b :TagbarOpenAutoClose<CR>
    map <Leader>B :TagbarToggle<CR>


    " Scala Supp
		" \nort
     let g:tagbar_type_scala = {
      \ 'ctagstype' : 'Scala',
      \ 'kinds'     : [
          \ 'p:packages:1',
          \ 'V:values',
          \ 'v:variables',
          \ 'T:types',
          \ 't:traits',
          \ 'o:objects',
          \ 'a:aclasses',
          \ 'c:classes',
          \ 'r:cclasses',
          \ 'm:methods'
          \ ]
      \ } 

  " }}

  " Clam Settings {{
    nnoremap ! :Clam<space>
  " }}

  " Fugitive Settings {{
    " Some keybindings:
    nmap <leader>gs :Gstatus<cr>
    nmap <leader>gc :Gcommit<cr>
    nmap <leader>ga :Gwrite<cr>
    nmap <leader>gl :Glog<cr>
    nmap <leader>gd :Gdiff<cr>
  " }}
  
  " vim-sessions Settings {{
    let g:session_autoload = 'no'
    let g:session_autosave = 'yes'
  " }}

  " vim-signify Settings {{
    let g:signify_sign_overwrite = 0 " May not play nice with eclim
    let g:signify_sign_delete_first_line = '-' " Default character doesnt work on ubuntu??
  " }}

" -------

" Custom Functions {{

  " Move Tab - moves the tab in the given direction
    function! TabMove(direction)
        " get number of tab pages.
        let ntp=tabpagenr("$")
        " move tab, if necessary.
        if ntp > 1
            " get number of current tab page.
            let ctpn=tabpagenr()
            " move left.
            if a:direction < 0
                let index=((ctpn-1+ntp-1)%ntp)
            else
                let index=(ctpn%ntp)
            endif

            " move tab page.
            execute "tabmove ".index
        endif
    endfunction

  " Fold Column Toggle {{
    "A fold method that toggles the foldcolumn
    function! FoldColumnToggle()
        if &foldcolumn
            setlocal foldcolumn=0
        else
            setlocal foldcolumn=3
        endif
    endfunction
  " }}

  " Window Swapping {{

    "Marks a window to to swap
    function! MarkWindowSwap()
        let g:markedWinNum = winnr()
    endfunction

    "Swaps current window with marked window
    function! DoWindowSwap()
        "Mark destination
        let curNum = winnr()
        let curBuf = bufnr( "%" )
        exe g:markedWinNum . "wincmd w"
        "Switch to source and shuffle dest->source
        let markedBuf = bufnr( "%" )
        "Hide and open so that we aren't prompted and keep history
        exe 'hide buf' curBuf
        "Switch to dest and shuffle source->dest
        exe curNum . "wincmd w"
        "Hide and open so that we aren't prompted and keep history
        exe 'hide buf' markedBuf 
    endfunction
  " }}

  "MiniMap {{
  "makes the text really tiny so you can see an overview of the code
  "INSTALL NOTES :
  "  You need ProggyTinyTT
  "  You can DL it from here: http://www.dafont.com/proggy-tiny.font
  "
  " Make sure you set your default font in this method 
  "
  function! ToggleMinimap()
    if exists("s:isMini") && s:isMini == 0
      let s:isMini = 1
    else
      let s:isMini = 0
    end

    if (s:isMini == 0)
      " save current visible lines
      let s:firstLine = line("w0")
      let s:lastLine = line("w$")

      " resize each window
      " windo let w=winwidth(0)*12 | exe "set winwidth=" . w
      " windo let h=winheight(0)*12 | exe "set winheight=" . h

      " don't change window size
      "let c = &columns * 12
      "let l = &lines * 12
      "exe "set columns=" . c
      "exe "set lines=" . l

      " make font small
      set guifont=ProggyTinyTT:h1
      
      " highlight lines which were visible
      let s:lines = ""
      for i in range(s:firstLine, s:lastLine)
        let s:lines = s:lines . "\\%" . i . "l"

        if i < s:lastLine
          let s:lines = s:lines . "\\|"
        endif
      endfor

      exe 'match Visible /' . s:lines . '/'
      hi Visible guibg=lightblue guifg=black term=bold
    else
      set guifont=Menlo:h11
      hi clear Visible
    endif
  endfunction

  command! ToggleMinimap call ToggleMinimap()
  "nnoremap <Leader>m :ToggleMinimap<CR>

  " }}


" }}
