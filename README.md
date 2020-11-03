# dotfiles

All my dot files and such

## installation

1. Clone this directory:
    ```sh
    # over HTTPS
    git clone --recursive https://github.com/mattcan/dotfiles.git
    # over SSH
    git clone --recursive https://github.com/mattcan/dotfiles.git
    ```
1. Run `.setup.sh` to backup any old configurations and install this one

## directory structure

* **thispc** - Machine specific private commands or variables. Good place to put
  private environment variables.
* **os** - operating system specific setup and configuration
* **share** - configurations and plugins that are for software used on any os, anything here gets linked to `~/`
* **vendor** - third party stuff that isn't a vim/tmux plugin

## adding vim plugins

This is the pathogen system:

1. Start in the root of this project
1. Do this: `git submodule add https://github.com/the/plugin share/vim/bundle/pluginName`

## git things I always forget

* **cloned without recursive or pulling in new submodule**
    ```sh
    git submodule update --init
    ```
* **updating to latest commit for all submodules**
    ```sh
    git submodule update --recursive --remote
    ```

## things to install

* git
* curl
* tmux
* Ubuntu Mono font
* iterm2
* Nord theme
* Docker
* the_silver_searcher
