export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export PATH=$PATH:/usr/local/sbin:$SCALA_HOME/bin:/usr/local/git/bin:/usr/local/mysql/bin
export PATH=$PATH:/Library/PostgreSQL/9.1/bin:/usr/local/bin/jdbc.jar
export CLASSPATH=$CLASSPATH:/usr/lib/java/jars/postgresql-9.1-901.jdbc4.jar
export EDITOR=vim

# Vi mode ya!
set -o vi
bind -m vi-insert "\C-Space":vi-movement-mode

#Colors:
PS1='\[\e[0;32m\]\u\[\e[m\]\[\e[0;35m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[0;32m\]\u\[\e[m\]\[\e[0;35m\]@\[\e[0;35m\]\h \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# Aliases
alias code='cd ~/Dropbox/Code/'
alias vi='mvim -p'
alias vit='vi '
#alias ls='ls -p --group-directories-first --color=auto'
export CLICOLOR=1
#export LSCOLORS="Gxfxcxdxcxegedabagacad"
export LSCOLORS=ExFxCxDxBxegedabagacGx
alias ls='ls -FG'

#Good git commands
alias gitpulloverwrite='git pull -s recursive -X theirs origin r'
alias gs='git status'
alias gd='git diff'
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


#SSH aliases
alias rcs='ssh campbt2@rcs.rpi.edu'
alias malik='ssh lfdguest000@lfd.cs.rpi.edu'

