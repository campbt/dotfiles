
# -----------------------
#    Configuration
# -----------------------

# PATH
set --export PATH /usr/local/bin $PATH
set --export PATH /usr/local/sbin $PATH
set --export PATH ~/bin $PATH
set --export PATH ~/homebrew/bin $PATH
set --export PATH ~/Library/Android/sdk/platform-tools $PATH

# Editor
set -U EDITOR vim

# Disable underline on paths
set fish_color_valid_path

# Custom colors
set fish_color_command white
set fish_color_quote green
set fish_color_match magenta
set fish_color_operator yellow

# -----------------------
#    Functions
# -----------------------

source ~/.config/fish/functions/osx_functions.fish
source ~/.config/fish/functions/android_functions.fish

# -----------------------
#    Abbreviations
# -----------------------

# Git
abbr --add ga 'git add'
abbr --add gs 'git status'
abbr --add gd 'git diff --color'
abbr --add gdd 'git diff --staged --color'
abbr --add gc 'git commit'
abbr --add gb 'git branch'
abbr --add gk 'git checkout'
abbr --add gp 'git push origin'
abbr --add gundo 'git reset --soft HEAD~1'

# Android
abbr --add pid "pidcat"
abbr --add pidm "adb logcat -v brief | pidcat"

# -----------------------
#    Aliases
# -----------------------

# Better ls
export LS_COLORS='di=34:ln=35:pi=5:so=5:bd=5:cd=5:ex=32:su=0:sg=0:tw=0:ow=0:'
alias ls='gls -p --color=auto --group-directories-first'

# Git complex aliases
alias gg='git log --graph --oneline --all'
alias gl='git log --graph --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias gll='git log --graph --first-parent --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
alias gla='git log --graph --full-history --all --color --date=short --pretty=format:"%x1b[31m%h%x09%x1b[33m%an%x09%x1b[32m%d%x1b[0m%x20%ad %s"'
