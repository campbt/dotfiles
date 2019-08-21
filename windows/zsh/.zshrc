# ----------------------
#   Cheat Sheet
# ----------------------
# C-Space    | Exit to normal mode
# C-n/p         | History substring search (j/k in normal mode)
# C-w/b         | Forward/backward by word. Good for auto complete
# C-f           | Accept the full auto completion
# Aliases: g<?> | Variety of git commands
#
#
#
#
#
# ----------------------
#   Exports
# ----------------------

export PATH=~/bin:$PATH
export EDITOR=vim

# ----------------------
#   Aliases
# ----------------------

alias gs='git status'
alias gd='git diff --color'
alias gdd='git diff --staged --color'
alias gc='git commit'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gk='git checkout'
alias gkm='git checkout master'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gg='git log --graph --oneline --all'
alias gl='git log --graph --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias gll='git log --graph --first-parent --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias gla='git log --graph --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[33m%an%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias glv="git log -p -40 | vim - -R -c 'set foldmethod=syntax'"
alias gundo='git reset --soft HEAD^'

# ----------------------
#   Configuration
# ----------------------

# Fixes some issues with colors when in tmux
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

# ls Colors
export LS_COLORS='fi=0:di=34:ln=35:pi=5:so=5:bd=5:cd=5:ex=32:su=0:sg=0:tw=0:ow=0:'
alias ls='ls -p --color=auto --group-directories-first'

#fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload zsh/complist
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} ma=0\;100  # Basic LS colors highlighting. ma=[selection color]
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==32=32}:${(s.:.)LS_COLORS}" ma=0\;100)'; # Will show prefixes if there is something. Prefix color is the ==##=## one. 32 is green
zstyle ':completion:*' menu select=2

zstyle ':completion:*'         list-dirs-first true     # Separate directories from files.
zstyle ':completion:*:options' auto-description '%d'               #
zstyle ':completion:*:options' description yes select         # Describe options.
zstyle ':completion:*'         verbose true             # provide verbose completion information
zstyle ':completion:*'                 group-name ''    # Group completions
zstyle ':completion:*:descriptions' format $'\n%B%d%b\n'

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Access to $fg[red,blue,green.cyan,yellow,magenta,black,white]
autoload -U colors
colors

# History Configuration
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed
setopt hist_ignore_all_dups # Ignore duplicates in the history
setopt hist_save_no_dups # Save no dupes to history
setopt prompt_subst # allow expansion in prompts


# ----------------------
#   Vi-Mode
# ----------------------

bindkey -v # Vi mode
#export KEYTIMEOUT=1 # Remove lag in VI mode switching, but breaks multi-key binding. If using Ctrl-Enter binding, shouldn't be a problem to leave this off.

bindkey '^R' history-incremental-search-backward

bindkey -M viins '^ ' vi-cmd-mode # Ctrl-Space to leave insert mode
bindkey -M viins '^w' forward-word
bindkey -M viins '^b' backward-word
bindkey -M viins "^?" backward-delete-char # Allows backspace over characters entered before the insert mode

bindkey -M isearch '^k' history-incremental-search-backward
bindkey -M isearch '^j' history-incremental-search-forward

# Use hjkl in completion menu.
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^n' expand-or-complete
bindkey -M menuselect '^p' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete #^[[Z is shift-tab

# Note: Some additional bindings are set after plugins are loaded in the plugins section

# ----------------------
#   Key Bindings
# ----------------------

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'go' edit-command-line

# ----------------------
#   Prompt
# ----------------------

# Displays the pwd.
# If somewhere in HOME, will set base as ~
# If somewhere in a git repo, will set base as the git repo's folder
function prompt_pwd() {
    local color
    if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
        # Normal mode
        color="%F{green}"
    elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
        # Insert mode
        color="%F{blue}"
    fi

    local gitRepo displayedPath
    gitRepo=$(git rev-parse --show-toplevel 2> /dev/null)
    local retCode=$?
    if [[ $retCode != 0 ]]; then
        # Not a git repo. Replaces home portions with ~
        displayedPath="${PWD/$HOME/~}"
    else
        # Is a git repo. Show basename
        local gitBase=$(basename $gitRepo)
        local gitPath=$(git rev-parse --show-prefix | sed s'/.$//')
        if [[ $gitPath != "" ]]; then
            displayedPath=" $gitBase/$gitPath"
        else
            displayedPath=" $gitBase"
        fi
    fi
    echo "$color$displayedPath%f"
}
# Displays a git indicator with a color dependent on the current state of the repo
function prompt_vim_mode_indicator() {
    if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
        # Normal mode
        #gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block
        # echo "%F{blue}⟩%f"
        echo "%F{blue}»%f"
    elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
        # Insert mode
        #gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam
        # echo "%F{green}⟩%f"
        echo "%F{green}»%f"
    fi
}
function prompt_git_indicator() {
    local INDICATOR_COLOR="%F{black}%B"
    if [[ "$(command git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]]; then
        if ! git diff --no-ext-diff --quiet --exit-code &> /dev/null
        then
            # Git is "dirty"
            INDICATOR_COLOR="%F{red}"
        else
            local untrackedFiles=$(git ls-files --others --exclude-standard | awk '
                    BEGIN { n = 0 }
                    { n++ }
                    END {
                        print n
                        exit !n
                    }
                ')
            if [[ $untrackedFiles -ne 0 ]]; then
                # Git has untracked files
                INDICATOR_COLOR="%F{yellow}"
            elif ! git diff --cached --no-ext-diff --quiet --exit-code
            then
                # Git is staged
                INDICATOR_COLOR="%F{green}"
            else
                # Git is "clean"
                INDICATOR_COLOR="%F{black}%B"
            fi
        fi
    fi
    echo "$INDICATOR_COLOR%f%b"
}
function right_prompt() {
    local currentBranch=$(git_current_branch)
    if [[ $currentBranch != "" ]]; then
        echo "%F{black}($currentBranch)%f"
    fi
}
# git indicator seems broken / incredibly slow
# PROMPT=' $(prompt_vim_mode_indicator) $(prompt_pwd) $(prompt_git_indicator) '
#RPROMPT=' $(right_prompt)'
PROMPT=' $(prompt_vim_mode_indicator) $(prompt_pwd) %F{black}%B»%f%b '
RPROMPT=''

# This will trigger the prompt to refresh when we change VI modes
function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# ----------------------
#   Functions
# ----------------------

function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# ----------------------
#   Plugins
# ----------------------

# Fish-like auto suggestions
#
# git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey -M viins '^f' autosuggest-accept
bindkey -M viins '^f' forward-char # Better than autosuggest-accept as the highlight plugin responds to it
#bindkey -M viins '^F' autosuggest-execute # Bind Ctrl-Shift-F to execute the suggestion


# Fish-like highlighting

# git clone git://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Override highlighter colors
 ZSH_HIGHLIGHT_STYLES[default]=fg=cyan
 ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
 ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
 ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
 ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
 ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
 ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
 ZSH_HIGHLIGHT_STYLES[precommand]=fg=white
 ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
 ZSH_HIGHLIGHT_STYLES[path]=fg=cyan
 ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
 #ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
 ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=cyan
 ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=cyan
 #ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
 ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=green
 ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=green
 ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=yellow
 ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan

# Fish-like history

# git clone https://github.com/zsh-users/zsh-history-substring-search
# NOTE: This does work with the zsh-syntax-highlighting, but it needs to be source'd after that one
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
# Arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M viins '^n' history-substring-search-down
bindkey -M viins '^p' history-substring-search-up
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bg=black

# Bashmarks
source ~/.zsh/bashmarks.sh

# OSX Specific
source ~/.zsh/osx_functions.zsh

# Colored man pages
# git clone https://github.com/ael-code/zsh-colored-man-pages.git
source ~/.zsh/zsh-colored-man-pages/colored-man-pages.plugin.zsh

# ----------------------
#   fzf
# ----------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# This by default binds the following:
# Ctrl-T | File search
# Crtl R | History search
# Alt C | cd to folder

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# Setting fd as the default source for fzf
if [ -x "$(command -v ag)" ]; then
    # Use ag if we have it
    # export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || ag -g f) 2> /dev/null'
    export FZF_DEFAULT_OPTS=""
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --exact" # Makes fzf use exact match on non space separated patterns. Prefix with ' to enable fuzzy finding
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up" # Custom bindings to scroll the preview window
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind ctrl-n:down,ctrl-p:up" # Custom bindings to bind c-n and c-p
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --history=$HOME/.fzf_history"
    export FZF_CTRL_T_COMMAND='(git ls-tree -r --name-only HEAD || ag -g f) 2> /dev/null'
fi

# Sourcing these grants the ^g^[f b t r h] keybinds
# and functions: fshow fbr fco gt chk fcs
source ~/.zsh/fzf_git.zsh
source ~/.zsh/fzf_git_functions.sh
source ~/.zsh/fzf_git_keybindings.zsh
source ~/.zsh/fzf_tmux.zsh


# ----------------------
#   Local Configuration
# ----------------------

# Source the local configuration file, if one present
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Launch tmux automatically
[ -f ~/.tmux.conf ] && if [ "$TMUX" = "" ]; then tmux; fi
