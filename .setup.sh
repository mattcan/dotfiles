#!/bin/bash
############################
# .setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

WORKING_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

linkConfig() {

    printf "\n######## LINK CONFIG ########\n"

    dir=$WORKING_DIR/share
    olddir=$HOME/dotfiles_old/$(date +"%Y%m%d_%H%M%S")   # old dotfiles backup directory
    files="$(ls $dir)"       # list of files/folders to symlink in homedir

    # create dotfiles_old in homedir
    printf "** Creating $olddir for backup of any existing dotfiles in ~\n"
    mkdir -p $olddir

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
    printf "** Moving any existing dotfiles from $HOME to $olddir\n"
    for file in $files; do
        if [ -e "$HOME/.$file" ] ; then
            mv $HOME/.$file $olddir
        fi
	if [ -d "$HOME/.$file" ] ; then
            mv $HOME/.$file $olddir
        fi
        printf "** Creating symlink to $file in home directory.\n"
        ln -s $dir/$file $HOME/.$file
    done
}

linkCustomTheme() {
    printf "\n######## LINK ZSH THEMES ########\n"
    dir=$WORKING_DIR/omz/themes
    custom=$WORKING_DIR/share/oh-my-zsh/custom/themes
    themes="$(ls $dir)"

    for theme in $themes; do
      if [ -d "$custom/$theme" ] ; then
          printf "** Theme did not exist: $theme\n"
          exit
      fi

      ln -s $dir/$theme $custom/$theme
    done
}

setProfile() {
  . "$WORKING_DIR/os/install.sh"
}

### Setup Menu
printf "######## SETUP ########\n"

if [ $# -eq 0 ] ; then
  linkConfig;
  linkCustomTheme;
fi

while getopts ":p:c:t:" arg; do
  case $arg in
    p) setProfile;;
    c) linkConfig;;
    t) linkCustomTheme;;
  esac
done
