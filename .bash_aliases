
alias acs='apt-cache search'
alias fc='fc -e vim'
alias gadd='git add'
alias gstatus='git status'
alias ip='ip --color'
alias jazze='/opt/jazze/jazze.sh'
alias kctl='kubectl'
alias mux='tmuxinator'
alias pdftex='echo Are you sure you do not mean pdflatex?'
alias python=python3
alias st='git status'
alias sysupgrade='sudo apt update; sudo apt upgrade; sudo apt autoremove'
alias tf='terraform'
alias venv='. ./venv/bin/activate'
alias vim='vim -p'
alias xo=xdg-open
alias who_uses_port='echo "sudo lsof -i :<port>"'

export EDITOR=vim

function cdn {
  mkdir $1 && cd $1
}

gitignore () {
  echo $1 >> .gitignore && git add .gitignore
}


git_branch () { 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}

how_in () {
  where="$1"; shift
  IFS=+ curl "cht.sh/$where/$*"
}

if [ `which X` ]; then
  setxkbmap -option caps:escape
  alias qutebrowser='qutebrowser --backend webengine'
  function twitch {
    quali=$2
    if [ -e $quali ] 
    then
      quali='480p'
    fi
    livestreamer twitch.tv/$1 $quali
  }
fi
