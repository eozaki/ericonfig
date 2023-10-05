#! /bin/bash

function createRsaKey {
	[ ! -e ~/.ssh/id_rsa.pub ] && echo "Criando chave ssh"
	[ ! -e ~/.ssh/id_rsa.pub ] && ssh-keygen
}

function linuxDeps {
	# Getting started with updates
	sudo apt update && sudo apt full-upgrade -y
	sudo apt-get install \
		tmux tmuxinator xclip fish git vim meld software-properties-common \
		ruby ruby-dev synapse xdotool libinput-tools libpq-dev libgmp3-dev \
		curl cowsay fortune dconf neovim silversearcher-ag gnupg2 libreadline6-dev -y
}

function linuxFonts {
	# Copying font files and making them available
	mkdir ~/.fonts
	cp -r "$PWD"/*.ttf ~/.fonts
	cp -r "$PWD"/*.otf ~/.fonts
	fc-cache -f -v
}

function linuxElementaryTerminal {
	# Setting terminal theme
	# Set correct font
	dconf write /io/elementary/terminal/settings/font "'Monaco for Powerline 13'"
	dconf write /io/elementary/terminal/settings/theme "'custom'"
}
function configGit {
	# Configuring git
	rm -rf ~/.gitconfig
	ln -s "$PWD"/.gitconfig ~/.gitconfig
}

function installAsdf {
	# Install asdf
	rm -rf ~/.asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
}

function configShell {
	# Making fish the default shell
	chsh -s /usr/bin/fish

	# Linking pre-configured config filed for fish
	rm -rf ~/.config/fish
	ln -s "$PWD"/fish ~/.config/fish
	rm -rf ~/.config/omf
	ln -s "$PWD"/omf ~/.config/omf
}

function configShellTheme {
	fish omf_config.fish > /dev/null
}

function configVim {
	# Using vim config file
	rm ~/.vimrc
	ln -s "$PWD"/vimrc ~/.vimrc

	# Configuring vim plugins
	rm -rf .vim
	mkdir .vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s ~/.vim ~/.config/nvim
	rm -rf ~/.config/nvim/init.vim
	ln -s ~/.vimrc ~/.config/nvim/init.vim
	nvim +VundleInstall
}

function configTmux {
	# configuring tmux
	rm -rf ~/.tmux.conf
	ln -s "$PWD"/tmux.conf ~/.tmux.conf
}

function linuxPreparation {
	echo "Starting linux tools instalation:"
	linuxDeps
	linuxFonts
	linuxElementaryTerminal

	configGit

	installAsdf

	configShell
	configShellTheme

	configVim

	configTmux
}

function macOsPreparation {
	echo "Starting macOS tools instalation:"

	createRsaKey

	configGit

	installAsdf

	configShell
	configShellTheme

	# configVim

	# configTmux
}

platform='unknown'

unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
	linuxPreparation
elif [[  "$unamestr" == 'Darwin' ]]; then
	macOsPreparation
else
	echo "QUE MERDA É ESSA????"
fi

