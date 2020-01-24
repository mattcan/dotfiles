#!/bin/bash
############################
# .setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

WORKING_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

linkdotfiles() {

    ########## Variables

    dir=$WORKING_DIR
    olddir=$HOME/dotfiles_old   # old dotfiles backup directory
    files="vimrc vim oh-my-zsh zshrc thispc tmux.conf tmux"       # list of files/folders to symlink in homedir

    ##########

    # create dotfiles_old in homedir
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    echo "...done"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
    echo "Moving any existing dotfiles from $HOME to $olddir"
    for file in $files; do
        if [ -e "$HOME/.$file" ] ; then
            mv $HOME/.$file $olddir
        fi
	if [ -d "$HOME/.$file" ] ; then
            mv $HOME/.$file $olddir
        fi
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file $HOME/.$file
    done
}

linkCustomTheme() {
    dir=$WORKING_DIR/omz/themes
    custom=$WORKING_DIR/oh-my-zsh/custom/themes
    themes="wezm++.zsh-theme refiner.zsh-theme"

    echo "Linking wezm++ (hardcoded name)"
    for theme in $themes; do
      if [ -d "$custom/$theme" ] ; then
          exit
      fi

      ln -s $dir/$theme $custom/$theme
    done
}

setprofile() {
    echo "\n######### PROFILE #########"
    prompt="Select a profile:"
    profiles=( $(ls $WORKING_DIR/profiles) )

    PS3="$prompt "
    select opt in "${profiles[@]}" "Cancel" ; do
        if (( REPLY == 1 + ${#profiles[@]} )) ; then
            exit

        elif (( REPLY > 0 && REPLY <= ${#profiles[@]} )) ; then
            echo "Creating symlink for $opt to $HOME/.zprofile"
            ln -s -f $WORKING_DIR/profiles/$opt $HOME/.zprofile
            break

        else
            echo "Invalid option"
        fi
    done
}

### Setup Menu
echo "######## SETUP ########"
prompt="Select setup option:"
setupopts=( 'All' 'Dotfiles without profile' 'Profile only' 'Custom oh-my-zsh' 'Quit')

PS3="$prompt "

select choice in "${setupopts[@]}"; do
    [[ -n $choice ]] || { echo "Invalid choice." >&2; continue; }

    case $choice in
        "All")
            linkdotfiles
            linkCustomTheme
            cd $WORKING_DIR
            setprofile
            ;;
        "Dotfiles without profile")
            linkdotfiles
            linkCustomTheme
            ;;
        "Profile only")
            setprofile
            ;;
        "Custom oh-my-zsh")
            linkCustomTheme
            ;;
        "Quit")
            echo "Quitter."
            exit 0
    esac

    break
done
