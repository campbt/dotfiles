"
" Tyler's Vim Config File {{
"   v2.06 - 2012-03-08
"   vim: set foldmarker={{,}} foldlevel=2 foldmethod=marker :
" }}
"

" Cheat Sheet {{
  "This is a brief list of custom commands and what they do
  "Plus other miscellaneous information

  " (Assuming \ = Leade, Space is also leader)
  " <C-Space>    : Esc (in insert mode)
  " \n           : Nerdtree Open Directory (N opens and finds current file)
  " \F2          : Colorize Hex VAlues in Code
  " \e           : :e {directory of current file}/ (open in current buffer)
  " \te          : same as \e except opens in new tab
  " <C-P>        : Insert Directory of current file into command
  " \o           : Brings up Searching for files in current directory
  " \\l          : FuzzyFind Lines in file
  " \mw          : Mark Window for Swapping
  " \ms          : Swap Current Window with one marked
  " \p           : Open up Yank Ring
  " \w          : EasyMove by word forward (\\b for backward)
  " \\_          : EasyMove - j,k lines, w/b, words, e end of words, /,? for search
  "   \j, \k, \w : are same as \\j \\k \\w
  " s            : EasyMove search
  " \c           : Comment out a line
  " gc<motion>   : Comment motion
  " S-Up/Down    : Move Line Up (Down to move it down)
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
  " gp           : Visually Select recently pasted text
  " \K           : Grep the word the cursor is on
  " :Ag <>       : Silver search and throw results into quickfix
  " :Agf! <>      : Silver search with fzf
  " :Subvert/..  : Replace multiple variants (like one/One/ONE). Ex: :Subvert/first/second/g  :Subvert/child{,ren}/adult{,s}
  " :Remove      : Delete file and buffer
  " :Move        : Move file and buffer
  " <C-S-P>      : Displays the highlight tags for the word
  " gh gl        : Navigate backward (gh) or forward (gl) by file
" }}

" ---------

" vim-plug List {{
   " Specify a directory for plugins
    call plug#begin('~/.vim/plugged')

    "List of Plugins used (Comment out to disable them)

    " Nord (Custom theme tyler-nord is used for colorscheme and airline theme)
    " Plug 'arcticicestudio/nord-vim'

    "NerdTree - Directory Viewer
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    "" vim-airline - cool status line
    Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    "" UltiSnippits - Best snippit plugin I've seen
    if(has("py3") || has("python") || has("python3"))
        Plug 'SirVer/ultisnips'
    endif

    "" EasyMotion - Fast moving through file
    Plug 'Lokaltog/vim-easymotion'

    "" fzf | File searching / opening
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " This will install fzf if it's not there
    Plug 'junegunn/fzf.vim'

    " Async completions
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    " You Complete Me Extra Installation Notes {{
    "   Check the github link at:
    "   https://github.com/Valloric/YouCompleteMe
    "
    "   Vim-Plug will attempt to install.py it automatically. If that fails,
    "   try: cd ~/.vim/bundle/YouCompleteMe
    "        git submodule update --init --recursive
    "        ./install.sh
    "
    "    (If it doesn't work you'll need to install CMake and stuff. Read the readme)
    "
    "   This plugin requires some extra compiled sources to work properly
    " }}

    "" Yankring - Great yanking \p to open yankring
    "Plug 'vim-scripts/YankRing.vim'

    " Misc install needed for some (vim-session and vim-easytags)
    Plug 'xolox/vim-misc'

    " vim-session - use good session manager ( Misc needed for vim-session )
    Plug 'xolox/vim-session'

    " Vim Eunuch (Unix Commands in Vim, like :Rename)
    Plug 'tpope/vim-eunuch'

    " Vim-Abolish (substitute multiple variants of word)
    Plug 'tpope/vim-abolish'

    " Fugitive - Git wrapper
    Plug 'tpope/vim-fugitive'

    " Commentary - Simple commenter
    Plug 'tpope/vim-commentary'

    " Nice rest console for testing REST commands. Only used on its custom .rest filetype
    Plug 'diepm/vim-rest-console', { 'for' : 'rest' }

    " Tmux-Navigation integration (use C-hjkl to navigate between vim and tmux panes)
    Plug 'christoomey/vim-tmux-navigator'

    " Tabularize - better than Align (no stupid bindings)
    Plug 'godlygeek/tabular', { 'on' : 'Tabularize' }

    " --- Minor Tweaks / Improvement Plugins -----------------

    "" upAndDown - Move lines up and down using shift arrow keys
    Plug 'vim-scripts/upAndDown'

    "" Highlights hex Colors (useful for editing color files
    Plug 'vim-scripts/hexHighlight.vim'

    "" Pasta - Much better pasting - all passive
    Plug 'sickill/vim-pasta'

    " Surround - surround text (cs'" = change surrounding ' to ")
    Plug 'tpope/vim-surround'

    " Improves words (allows i and a to work on more things and adds I and A. Ex: cI")
    Plug 'wellle/targets.vim'

    " Clam - Better terminal command support
    Plug 'sjl/clam.vim', { 'on': 'Clam' }

    " Shows changed lines since last git commit
    Plug 'mhinz/vim-signify'

    " HistoryTraverse - Allows file-wise history traversal
    Plug 'ckarnell/history-traverse'

    " Rooter - Auto change vim's cwd to the buffer
    Plug 'airblade/vim-rooter'


    " --- Plugins to improve certain filetypes: -----------------

    " A collection of language packs for 100+, loaded on demand
    " https://vimawesome.com/plugin/vim-polyglot
    Plug 'sheerun/vim-polyglot'

    " Initialize plugin system
     call plug#end()

    "-------------

    " TagBar - Shows all the methods, variables and stuff in file
    "Bundle 'majutsushi/tagbar'
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

  " }}
" }}

" ---------

" Vim Settings {{

    " Default color scheme (Custom Created One)
    colorscheme tyler-nord

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
    set undodir=~/.vim/tmp/undo/     " undo files
    set backupdir=~/.vim/tmp/backup/ " backups
    set directory=~/.vim/tmp/swap/   " swap files
    set backup                        " enable backups
    set noswapfile                    " It's 2012, Vim.
    " }}

    set number
    set ruler
    set nowrap
    set textwidth=0
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
    " NOTE: Potentially HUGE performance hit for this for some filetypes. Disabled for now
    " autocmd BufEnter * setlocal cursorline
    " autocmd BufLeave * setlocal nocursorline

    " Trim whitespace on save (has problems moving cursor around)
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    " Return cursor to previous location on load
    autocmd BufReadPost * normal `"

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

    " git commit messages
    au FileType gitcommit setlocal spell textwidth=80 | call setpos('.', [0, 1, 1, 0]) " Start at line 0
" }}

" ----------

" Custom Remappings {{
    " This section does not include mappings of plugins

    " Ctrl-Space to leave insert mode
    noremap <C-Space> <Esc>
    nnoremap <C-Space> <Esc>:noh<CR>
    inoremap <C-Space> <Esc>
    vnoremap <C-Space> <Esc>
    cnoremap <C-Space> <Esc>
    onoremap <C-Space> <Esc>
    " Allows OS X Terminal to use Ctrl-Space
    noremap <C-@> <Esc>
    nnoremap <C-@> <Esc>:noh<CR>
    inoremap <C-@> <Esc>
    vnoremap <C-@> <Esc>
    cnoremap <C-@> <Esc>
    onoremap <C-@> <Esc>

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
    nmap <Space> <Leader>
    nmap <Space><Space> <Leader><Leader>
    vmap <Space> <Leader>
    vmap <Space><Space> <Leader><Leader>
    "nnoremap <Space> :noh<CR>
    "vnoremap <Space> <Esc>

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

    " Make horizontal scrolling easier (zh is left, zl is right)
    nmap <silent> <C-y> 10zh
    nmap <silent> <C-p> 10zl
    "nmap <silent> <C-y> <C-o>
    "nmap <silent> <C-p> <C-i>

    " Remove highlight
    nmap <Leader>h :noh<CR>

    "Editing Vimrc File
    nmap <silent> <Leader>ve :e $MYVIMRC<CR>
    nmap <silent> <Leader>vs :so $MYVIMRC<CR>

    " Opens an edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>e
    map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

    " Opens a tab edit command with the path of the currently edited file filled in
    " Normal mode: <Leader>t
    "map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

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

    " Select recently pasted text
    nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

    " Location list quick commands (useful for navigating eclim errors)
    map [l :ll<CR>:lprev<CR>
    map ]l :ll<CR>:lnext<CR>

    " Better grepping
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

    " grep word under cursor
    nnoremap <Leader>K :Ag <C-R><C-W><CR>

    " Use The Silver Searcher if we have it
     if executable('ag')
       " Use ag over grep
       set grepprg=ag\ --nogroup\ --nocolor
     endif
 " }}

" -------

" Plugin Settings {{
  "Most custom mappings here should involve <Leader> key

  " eclim settings {{
      "autocmd Filetype java imap <C-w> <C-x><C-u><C-p>
      "autocmd Filetype java map <C-n> :JavaSearch -a edit<CR>
      ""autocmd Filetype java let g:SuperTabRetainCompletionDuration='completion'
      "let g:EclimCompletionMethod = 'omnifunc'

      "" Lets eclim play work with YouCompleteMe
      "autocmd Filetype * runtime! autoload/eclim/<amatch>/complete.vim
      "    \ | let s:cfunc = 'eclim#'.expand('<amatch>').'#complete#CodeComplete'
      "    \ | if exists('*'.s:cfunc) | let &l:omnifunc=s:cfunc | endif
  " }}

  " NERDTree Settings {{
    let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
    map <Leader>n :NERDTreeToggle<CR>
    map <Leader>N :NERDTreeFind<CR>
  " }}

  " FZF Settings {{
      " Quick function to use :GFiles if in a git repo, otherwise Files
      function! GFilesFallback()
          let output = system('git rev-parse --show-toplevel')
          let prefix = get(g:, 'fzf_command_prefix', '')
          if v:shell_error == 0
              exec "normal :" . prefix . "GFiles\<CR>"
          else
              exec "normal :" . prefix . "Files\<CR>"
          endif
          return 0
      endfunction

      " Expands the current word and enters that as the initial search term
      command! -complete=dir FilesSearchWord call fzf#vim#files('', fzf#vim#with_preview({'options': ['--query', expand('<cword>')]}), 0)
      command! -complete=dir LinesSearchWord call fzf#vim#buffer_lines({'options': ['--query', expand('<cword>')]}, 0)

      nnoremap <Leader>o :call GFilesFallback()<CR>
      nnoremap <Leader>O :Buffers<CR>
      nnoremap <Leader><Leader>o :History<CR>
      nnoremap <Leader><Leader>O :FilesSearchWord<CR>
      nnoremap <Leader><Leader>l :BLines<CR>
      nnoremap <Leader><Leader>L :LinesSearchWord<CR>

      " Silver Search (Ag) with fzf and preview
      command! -bang -nargs=* Agf
          \ call fzf#vim#ag(<q-args>,
          \                 <bang>0 ? fzf#vim#with_preview('up:60%')
          \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
          \                 <bang>0)

      " Files command with preview window
      command! -bang -nargs=? -complete=dir Files
          \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  " }}

  " Vim-Commentary Settings {{
     nnoremap <Leader>c :Commentary<CR>
     vnoremap <Leader>c :Commentary<CR>
  "}}

  " UltiSnippits Settings {{
    " Also looks in snippits folder in default .vim folder
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippits"]
    let g:UltiSnipsExpandTrigger="<c-s-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-s-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-s-k>"
  " }}

  " Airline Settings {{
      "set statusline=%f\ %r%{fugitive#statusline()}%m%h%=(%l/%L,\ %c)\ %3p%%\ %w\ %y\ [%{&encoding}:%{&fileformat}]\ \
      let g:airline_enable_hunks = 0 " Gets errors when this is enabled
      source ~/.vim/autoload/airline/themes/tylernord.vim
      let g:airline_theme = 'tylernord'
      let g:airline#extensions#whtespace#enabled = 0 " Disables airline's file whitespace warnings
      silent! call airline#extensions#whitespace#disable()
      "let g:airline_section_b = ''
      " let g:airline#extensions#branch#format = 'CustomBranchName'
      " function! CustomBranchName(name)
      "     return ''
      " endfunction
      let g:airline#extensions#hunks#enabled = 0 " Disables +0 ~0 -0 Stuff next to branch name
      let g:airline#extensions#branch#format = 2 " Shortens branch/full/names to /b/f/names
      let g:airline#extensions#branch#displayed_head_limit = 14 " Limit the max size of the branch section
      let g:airline_section_c = '%<%t%m'
      "let g:airline_section_b = '%<%{expand("%:h")}/' " The relative path to the file
      "let g:airline_section_c = '%<%t%m' " The file name (%t), if it has been modified (%m)
      "let g:airline_section_x = '%{airline#extensions#tagbar#currenttag()}' " Shows the method the cursor is in
      let g:airline_section_x = ''
      "let g:airline_section_y = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}' " Shows the current branch
      let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}' " Shows the file type
      " let g:airline_section_z = '%l/%L : %c' " Shows the line number and column number of cursor
      let g:airline_section_z = '%l/%L  %{HistoryIndicator()}' " Shows the line number and the history indicator (HistoryTraverse plugin)
      let g:airline#extensions#tabline#enabled = 0
      let g:airline#extensions#tabline#show_splits = 0
      let g:airline#extensions#tabline#buffer_min_count = 2
      let g:airline#extensions#tabline#tab_min_count = 2
      let g:airline#extensions#tabline#show_buffers = 0
      let g:airline#extensions#tabline#show_tab_nr = 0
      let g:airline#extensions#tabline#show_tab_type = 0
      let g:airline#extensions#tabline#left_sep = ''
      let g:airline#extensions#tabline#left_alt_sep = ''
      let g:airline#extensions#tabline#show_close_button = 0

      let g:airline#extensions#ctrlp#color_template = 'visual'

      " Enable this if the terminal is using a patched font
      set encoding=utf-8
      " set fillchars+=stl:\ ,stlnc:\ " Fixes ^^^^^^^^^^^ on some terminals
      let g:airline_powerline_fonts = 1
  " }}

  " Yankring Settings {{
    nnoremap <silent> <Leader>p :YRShow<CR>
    let g_yankring_paste_using_g = 0 " Conflicts with the select last paste binding
  " }}

  " EasyMotion Settings {{
    "Commonly used ones may be used with only one leader press
    map <Leader>w <Leader><Leader>w
    map <Leader>f <Leader><Leader>f
    map <Leader>t <Leader><Leader>t

    " Sexy hjkl movement
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)

    " Better search (use Tab / S-Tab to scroll; press CR to turn on EasyMotion)
    "map  / <Plug>(easymotion-sn)
    "omap / <Plug>(easymotion-tn)
    "map  n <Plug>(easymotion-next)
    "map  N <Plug>(easymotion-prev)

    nmap s <Plug>(easymotion-s)

    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
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
  " Vertical diffs
    set diffopt+=vertical

  " vim-sessions Settings {{
    let g:session_autoload = 'no'
    let g:session_autosave = 'yes'
  " }}

  " vim-signify Settings {{
    let g:signify_vcs_list = [ 'git' ]
    " Set all signify characters to just a dot. Use colors to differeniate
    let g:signify_sign_delete_first_line = '•'
    let g:signify_sign_add               = '•'
    let g:signify_sign_delete            = '•'
    let g:signify_sign_delete_first_line = '•'
    let g:signify_sign_change            = '•'
    nmap <leader>gh :SignifyToggleHighlight<cr>
  " }}

  " YouCompleteMe Settings {{
      let g:ycm_key_invoke_completion = '<C-F>'
  "}}

  " HistoryTraverse Settings {{
    nnoremap gh :HisTravBack<CR>
    nnoremap gl :HisTravForward<CR>
    " let g:history_indicator_back_active      = '⬅' " Default: '⬅'
    " let g:history_indicator_back_inactive    = '' " Default: '⇦'
    " let g:history_indicator_forward_active   = '➡' " Default: '➡'
    " let g:history_indicator_forward_inactive = '' " Default: '⇨'
    let g:history_indicator_separator        = ' '
  "}}

  " Rooter Settings {{
    let g:rooter_silent_chdir = 1 " Don't echo when we change directories
  " }}

  " sourcekitten Settings (swift autocomplete) {{
      autocmd Filetype swift imap <C-w> <C-x><C-o>

      " Hooks in swift to ycm
      "let g:ycm_semantic_triggers =  {
                  "\ 'swift,cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                  "\ }

      " Lets eclim play work with YouCompelteMe
      "autocmd Filetype swift runtime! autoload/eclim/<amatch>/complete.vim
          "\ | let s:cfunc = 'eclim#'.expand('<amatch>').'#complete#CodeComplete'
          "\ | if exists('*'.s:cfunc) | let &l:omnifunc=s:cfunc | endif
  " }}

  " vim-rest-client settings {{

        " Shows the curl commdn
        let g:vrc_show_command = 1

        " Bind it to <Leader>r when in rest files
        let g:vrc_set_default_mapping = 0
        autocmd FileType rest map <Leader>r :call VrcQuery()<BR>
  " }}

" -------

" Custom Functions {{

  " Move Tab - moves the tab in the given direction
    function! TabMove(direction)
        let s:current_tab=tabpagenr()
        let s:total_tabs = tabpagenr("$")

        if s:current_tab == 1 && a:direction == -1
            " Wrap to end
            tabmove
        elseif s:current_tab == s:total_tabs && a:direction == 1
            " Wrap to start
            tabmove 0
        else
            " Normal move
            execute (a:direction > 0 ? "+" : "-") . "tabmove"
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

  " Dash Function
  nmap <expr> K <SID>doc(":Dash!<CR>")
  function! s:doc(cmd)
      if exists(':Dash')
          return a:cmd
      endif
      return 'K'
  endfunction

  " Delete trailing whitespace
  function! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
  endfun

  " Identify current word's syntax name
  nmap <C-S-P> :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc
" }}
