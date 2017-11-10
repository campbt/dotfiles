set --export PATH /usr/local/bin $PATH
set --export PATH /usr/local/sbin $PATH
set --export PATH ~/bin $PATH
set --export PATH ~/homebrew/bin $PATH
set --export PATH ~/Library/Android/sdk/platform-tools $PATH
set -U EDITOR vim

# Abbreviations
abbr --add ga 'git add'
abbr --add gs 'git status'
abbr --add gd 'git diff --color'
abbr --add gdd 'git diff --staged --color'
abbr --add gc 'git commit'
abbr --add gb 'git branch'
abbr --add gk 'git checkout'
abbr --add gp 'git push origin'
abbr --add gundo 'git reset --soft HEAD~1'

# Disable underline on paths
set fish_color_valid_path
