export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:/usr/local/git/bin:/usr/local/mysql/bin:$PATH
export PATH=~/bin:$PATH
export PATH=$PATH:~/homebrew/bin
export PATH=$PATH:~/mongodb/bin
export PATH=$PATH:~/Library/Android/sdk/platform-tools
export EDITOR=vim

# Vi mode ya!
set -o vi
bind -m vi-insert "\C-Space":vi-movement-mode

#Colors:
PS1='\[\e[1;32m\]\u\[\e[m\]\[\e[0;35m\] \[\e[0;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[0;32m\]\u\[\e[m\]\[\e[0;35m\]@\[\e[0;35m\]\h \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# Aliases
alias code='cd ~/Dropbox/Code/'
alias vi='mvim -p'
alias vit='vi '
#alias ls='ls -p --group-directories-first --color=auto'
export CLICOLOR=1
alias bashedit='vim ~/.bashrc'
alias refresh='source ~/.bashrc'

# LS Colors
#export LSCOLORS="Gxfxcxdxcxegedabagacad"
#export LSCOLORS=ExFxCxDxBxegedabagacGx
# For help: http://linux-sxs.org/housekeeping/lscolors.html
export LS_COLORS='di=34:ln=35:pi=5:so=5:bd=5:cd=5:ex=32:su=0:sg=0:tw=0:ow=0:'
#alias ls='ls -FG'
alias ls='gls -p --color=auto --group-directories-first'

#Good git commands
alias gitpulloverwrite='git pull -s recursive -X theirs origin r'
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

# Use brew install git bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#Alisa to v script, type v --help for more info
#Allows you to quickly open and edit recently editted vim files
alias v='~/.vim/bash/v'

#Quickly turn on/off hidden files
function hiddenToggle() {
  defaults write com.apple.finder AppleShowAllFiles "$1"
  killall Finder
}
alias hiddenon='hiddenToggle TRUE'
alias hiddenoff='hiddenToggle FALSE'

alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias sc1='screen -dr hhp'

#arrow keys auto complete history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export TERM="xterm-256color"

# ADB Helpful commands
alias adb_activities='adb shell dumpsys activity | grep -i run'
alias adb_stack="adb shell dumpsys activity activities | sed -En -e '/Stack #/p' -e '/Running activities/,/Run #0/p'"
alias adbr='adb kill-server; adb start-server'
alias adb_wifi_on='adb shell svc wifi enable'
alias adb_wifi_off='adb shell svc wifi disable'
alias adb_communicator='adb logcat -s ChatCommunicator'
alias pid="pidcat"
alias pidm="adb logcat -v brief | pidcat"

# ICE android project
alias gradle_release="./gradlew -DreleaseBuild=true clean build assemble release -x test"
# ICE swift project
alias kitten="SourceKittenDaemon start --project ~/Code/ice_mobile_ios/apps/ICEMobile/ICEMobile.xcodeproj" # Boots up SourceKitten for the ICEMobile project

alias mongo="~/bin/mongod --dbpath ~/mongodb/data"

# Set the following two in /etc/profile if on ubuntu for fancy airline font
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Bashmarks
source ~/.local/bin/bashmarks.sh

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d \
                  -not -path "*/build/*" \
                  -not -path "*/env/*" \
                  -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fshow() {
  local out shas sha q k
  while out=$(
      #git log --graph --color=always \
          #--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      gl |
      fzf --ansi --multi --no-sort --reverse --query="$q" --tiebreak=index \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = 'ctrl-d' ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gfzff() {
  is_in_git_repo &&
    git -c color.status=always status --short |
    fzf -d 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

gfzfb() {
  is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
    fzf -d 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

gfzft() {
  is_in_git_repo &&
    git tag --sort -version:refname |
    fzf -d 40% --multi
}

gfzfh() {
  is_in_git_repo &&
    #git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
      gl |
    fzf --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

gfzfr() {
  is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf -d 40% --tac | awk '{print $1}'
}

bind '"\C-g\C-e": shell-expand-line'
bind '"\C-g\C-q": redraw-current-line'

bind '"\C-g\C-f": "$(gfzff)\C-g\C-e\C-g\C-q"' # Fuzzy find files in the git status
bind '"\C-g\C-b": "$(gfzfb)\C-g\C-e\C-g\C-q"' # Fuzzy find git branches
bind '"\C-g\C-t": "$(gfzft)\C-g\C-e\C-g\C-q"' # Fuzzy find git tags
bind '"\C-g\C-h": "$(gfzfh)\C-g\C-e\C-g\C-q"' # Fuzzy find over git log and return the commit mini-hash
bind '"\C-g\C-r": "$(gfzfr)\C-g\C-e\C-g\C-q"' # Fuzzy find over git remote repositories
