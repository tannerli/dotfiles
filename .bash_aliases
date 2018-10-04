
alias acs='apt-cache search'
alias fc='fc -e vim'
alias gadd='git add'
alias gstatus='git status'
alias mux='tmuxinator'
alias st='git status'
alias vim='vim -p'
alias ip='ip --color'
alias jazze='/opt/jazze/jazze.sh'

setxkbmap -option caps:escape
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

how_in () {
  where="$1"; shift
  IFS=+ curl "cht.sh/$where/$*"
}
