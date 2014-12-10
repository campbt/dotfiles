export PATH=~/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:/usr/local/git/bin:/usr/local/mysql/bin:$PATH
export PATH=~/Amazon/Cloud9BrazilBuild-1.0/bin:$PATH
export PATH=~/Amazon/sdk/platform-tools:$PATH
export PATH="/apollo/env/ruby193/bin:/apollo/env/SDETools/bin:$PATH"
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
alias gll="git log -p -40 | vim - -R -c 'set foldmethod=syntax'"
alias gundo='git reset --soft HEAD^'

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

# Amazon Stuff
#Start synergy
alias syn='synergy &'
alias work='cd ~/Amazon/workspace_eclipse'
alias proj='cd ~/Amazon/projects'
alias tools='cd ~/Amazon/sdk/platform-tools'
alias fish='cd ~/Amazon/projects/RaftFish/src/RaftFishKindle'
alias core='cd ~/Amazon/projects/RaftFish/src/RaftFishCore/src/main'
alias browser='cd ~/Amazon/projects/RaftBrowser/src/RaftBrowser'
alias launcher='cd ~/Amazon/projects/RaftLauncher/src/RaftLauncher'
alias chat='cd ~/Amazon/projects/RaftChat/src/RaftChat'
alias oneg='cd ~/Amazon/projects/OnegForAndroid/src/OnegForAndroid'
alias rabbit='cd ~/Amazon/projects/RabbitAndroidApp/src/RabbitAndroidApp/'
alias pid='pidcat'
alias pid_b='pidcat com.amazon.raftbrowser'
alias pid_f='pidcat com.amazon.raftfish'
alias pid_c='pidcat com.amazon.raftchat'
alias pid_l='pidcat com.amazon.raftlauncher'

# Brazil stuff
alias refresh='brazil ws --clean; brazil-recursive-cmd rm -rf .gradle; rm -rf ../.gradle; brazil ws --sync --md; brazil-recursive-cmd brazil-build -u'
alias bb='brazil-build'
alias bsync='brazil ws --sync -md'
alias bbs='brazil ws --sync -md; brazil-build'

alias adb_activities='adb shell dumpsys activity | grep -i run'
alias raft_login="adb shell am broadcast -a com.amazon.raft.LOGIN -e com.amazon.raft.STATE LOGGED_IN -e com.amazon.raft.USERNAME tylercam"
alias raft_logout="adb shell am broadcast -a com.amazon.raft.LOGIN -e com.amazon.raft.STATE LOGGED_OUT"

# Set the following two in /etc/profile if on ubuntu for fancy airline font
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

alias ssh_amazon="ssh ud43d7e5a743d5130dd7e"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf +s +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

# fco - checkout git commit
fco() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}
