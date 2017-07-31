# dotfiles

All my dot files and such

## installation

1. Clone this directory `git clone --recursive https://github.com/mattcan/dotfiles.git`
1. Make a copy of `thispc.tpl` name `thispc` and enter any local specific customizations
1. Run `.setup.sh` to backup any old configurations and install this one

## files

* **thispc** - Machine specific private commands or variables. Good place to put
	private environment variables.
* **vimrc** - Your `.vimrc` file.
* **zshrc** - Your `.zshrc` file.
* **profiles/** - Machine specific startup or public commands and routines. Good
	place to start `ssh-agent` or set machine specific aliases.

## adding vim plugins

1. Start in the root of this project
1. Do this: `git submodule add https://github.com/the/plugin
	 vim/bundle/pluginName`
