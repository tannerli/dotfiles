
alias acs='apt-cache search'
alias gstatus='git status'
alias st='git status'
alias gadd='git add'
alias vim='vim -p'

alias fc='fc -e vim'

export EDITOR=vim

function cdn {
  mkdir $1 && cd $1
}

alias qutebrowser='qutebrowser --backend webengine'

alias sysupgrade='sudo apt update; sudo apt upgrade; sudo apt autoremove'

function twitch {
  quali=$2
  if [ -e $quali ] 
  then
    quali='480p'
  fi
  livestreamer twitch.tv/$1 $quali
}

git_branch () { 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}

# This fixes the flickering screen after "waking" from the
# lockscreen

function fix-flicker {
  xrandr --output "DP-2" --mode "1920x1080i" --rate 60
  sleep 0
  xrandr --output "DP-2" --mode "1920x1080" --rate 60
}
