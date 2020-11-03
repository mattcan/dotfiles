# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Get proper terminal colours
#export TERM=screen-256color
#export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refiner"

# Comment this out to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python fbterm)

source $ZSH/oh-my-zsh.sh

# editor
export EDITOR="vim"

# custom aliases
function rzsh() {
    source ~/.zshrc
    source ~/.zprofile
    echo 'ZSH config reloaded from ~/.zshrc'
}

# Include functions
if [ -f $HOME/dotfiles/zshfunc ]; then
    source $HOME/dotfiles/zshfunc
fi

# Include customizations if there are any
if [ -f $HOME/.thispc ]; then
    source ~/.thispc
fi
