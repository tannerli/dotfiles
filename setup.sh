function install {
  file=$1

  #Back up existing
  if [ -e ~/$file ]
  then
    mv -v ~/$file ~/$file.bak
  fi

  ln ~/.dotfiles/$file ~/$file
}
while read file;
do
  install $file
done << EOF
.bash_aliases
.bashrc
.gitconfig
.ideavimrc
.profile
.tmux.conf
.vimrc
EOF
