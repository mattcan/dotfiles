# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Get proper terminal colours
export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wezm+"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow python)

source $ZSH/oh-my-zsh.sh

# editor
export EDITOR="vim"

# custom aliases
alias rzsh=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# Gitignore.io
function gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}

# Download and unpack latest wordpress into current directory
function wp-latest() {
    wget wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
}

# Include customizations if there are any
if [ -f $HOME/.thispc ]; then
    source ~/.thispc
fi
