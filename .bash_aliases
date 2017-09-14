
alias acs='apt-cache search'
alias gstatus='git status'
alias gadd='git add'
alias vim='vim -p'

alias fc='fc -e vim'

alias sysupgrade='sudo apt update; sudo apt upgrade; sudo apt autoremove'

function twitch {
  quali=$2
  if [ -e $quali ] 
  then
    quali='480p'
  fi
  livestreamer twitch.tv/$1 $quali
}
